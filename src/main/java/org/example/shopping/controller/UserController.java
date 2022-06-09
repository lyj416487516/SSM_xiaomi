package org.example.shopping.controller;

import org.example.shopping.bean.Address;
import org.example.shopping.bean.Order;
import org.example.shopping.bean.Receiving;
import org.example.shopping.bean.User;
import org.example.shopping.common.CommonResult;
import org.example.shopping.service.ShopCartService;
import org.example.shopping.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;


@Controller
@Scope(value="prototype")
@RequestMapping("/user")
public class UserController {

    private CommonResult commonResult;

    private final UserService userService;
    private final ShopCartService shopCartService;

    @Autowired
    public UserController(UserService userService, ShopCartService shopCartService) {
        this.userService = userService;
        this.shopCartService = shopCartService;
    }

    private User getUser(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        User user = userService.findByUserName(username);
        return user;
    }

    @RequestMapping("index")
    public String index(HttpServletRequest request, Model model) {
        User user = getUser(request);

        model.addAttribute("user", user);
        return "users/index";
    }

    @ResponseBody
    @RequestMapping("Verification")
    public CommonResult Verification(HttpServletRequest request, User user) {
        String unPassword = request.getParameter("unpassword");
        String birthdays = request.getParameter("birthdays");
        if (birthdays != null) {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            try {
                date = format.parse(birthdays);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            user.setBirthday(date);
        }

        int result = 0;
        if (unPassword != null) {
            User checkUser = getUser(request);

            String salt = checkUser.getSalt();
            String un_salty = salt+unPassword;
            String un_password = DigestUtils.md5DigestAsHex(un_salty.getBytes());
            System.out.println(un_password);
            if (checkUser.getPassword().equals(un_password)) {
                String new_salt = getRandomString(16);
                String new_salty = new_salt+user.getPassword();
                String new_password = DigestUtils.md5DigestAsHex(new_salty.getBytes());
                user.setSalt(new_salt);
                user.setPassword(new_password);
                result = userService.updateUserInfo(user);
            }

        } else {
            result = userService.updateUserInfo(user);
        }

        if (result == 1) {
            commonResult = new CommonResult(result, "编辑成功", null);
        } else {
            commonResult = new CommonResult(0, "error", user);
        }
        return commonResult;
    }

    @RequestMapping("receiving_address")
    public String receiving_address(HttpServletRequest request, Model model) {
        User user = getUser(request);
        List<Receiving> receivingList = shopCartService.selectReceivingByUid(user.getId());
        List<Address> provinceList = shopCartService.selectProvinceAll();

        model.addAttribute("username", user.getUsername());
        model.addAttribute("receivingList", receivingList);
        model.addAttribute("provinceList", provinceList);
        return "users/receiving_address";
    }

    @RequestMapping("order_center")
    public String order_center(HttpServletRequest request, Model model) {
        User user = getUser(request);
        List<Order> orderList = userService.selectOrderByUid(user.getId());

        model.addAttribute("orderList", orderList);
        return "users/order_center";
    }

    @RequestMapping("/login")
    public String Login() {
        return "/users/login";
    }

    //表单提交过来的路径
    @ResponseBody
    @PostMapping(value = "/checkLogin")
    public CommonResult checkLogin(User sysUser, @RequestParam("yanzhengma") String yanzhengma, HttpServletRequest request){

        if (sysUser.getUsername().equals("")) {
            commonResult = new CommonResult(2,"用户名不能为空",null);
            return commonResult;
        }
        if (sysUser.getPassword().equals("")) {
            commonResult = new CommonResult(2,"密码不能为空",null);
            return commonResult;
        }

        HttpSession session = request.getSession();
        String rightcode = (String)session.getAttribute("verifycode");
        if (!rightcode.equals(yanzhengma)) {
            commonResult = new CommonResult(2,"验证码错误",null);
            return commonResult;
        }

        //调用service方法
        sysUser = userService.checkLogin(sysUser.getUsername(), sysUser.getPassword());
        if(sysUser != null){
            session.setAttribute("username", sysUser.getUsername());
            commonResult = new CommonResult(1,"登录成功",sysUser);
        } else {
            commonResult = new CommonResult(2,"登陆失败",null);
        }
        return commonResult;
    }

    @RequestMapping("register")
    public String register() {
        return "users/register";
    }

    @ResponseBody
    @RequestMapping("add_user")
    public CommonResult addUser(User sysUser
            , @RequestParam("repassword") String repassword
            , @RequestParam("yanzhengma") String yanzhengma
            , HttpServletRequest request) {
        Long now_time = System.currentTimeMillis()/1000;

        if (sysUser.getUsername().equals("")) {
            commonResult = new CommonResult(2,"用户名不能为空",null);
            return commonResult;
        }
        if (sysUser.getPassword().equals("")) {
            commonResult = new CommonResult(2,"密码不能为空",null);
            return commonResult;
        }

        if (!sysUser.getPassword().equals(repassword)) {
            commonResult = new CommonResult(2, "两次输入密码不一致", null);
            return commonResult;
        }

        HttpSession session = request.getSession();
        String rightcode = (String)session.getAttribute("verifycode");
        if (!rightcode.equals(yanzhengma)) {
            commonResult = new CommonResult(2,"验证码错误",null);
            return commonResult;
        }

        User is_user = userService.findByUserName(sysUser.getUsername());
        if (is_user != null) {
            commonResult = new CommonResult(2,"该用户已注册",null);
            return commonResult;
        }

        String salt = getRandomString(16);
        String salty = salt+sysUser.getPassword();
        String password = DigestUtils.md5DigestAsHex(salty.getBytes());
        sysUser.setSalt(salt);
        sysUser.setPassword(password);
        sysUser.setGroupId(1L);
        sysUser.setCreatetime(now_time);
        sysUser.setUpdatetime(now_time);

        int result = userService.Regist(sysUser);
        if (result == 1) {
            commonResult = new CommonResult(1 , "注册成功", null);
        } else {
            commonResult = new CommonResult(2, "注册失败", null);
        }
        return commonResult;
    }

    /**
     * 注销
     * @param request
     * @param response
     */
    @RequestMapping("cancellation")
    public void cancellation(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            session.setAttribute("username", null);
            request.getRequestDispatcher("/user/login").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static String getRandomString(int length){
        //定义一个字符串（A-Z，a-z，0-9）即62位；
        String str="zxcvbnmlkjhgfdsaqwertyuiopQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
        //由Random生成随机数
        Random random=new Random();
        StringBuffer sb=new StringBuffer();
        //长度为几就循环几次
        for(int i=0; i<length; ++i){
            //产生0-61的数字
            int number=random.nextInt(62);
            //将产生的数字通过length次承载到sb中
            sb.append(str.charAt(number));
        }
        //将承载的字符转换成字符串
        return sb.toString();
    }

}
