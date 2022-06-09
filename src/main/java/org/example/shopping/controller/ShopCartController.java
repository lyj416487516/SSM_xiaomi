package org.example.shopping.controller;

import org.apache.commons.lang3.StringUtils;
import org.example.shopping.bean.*;
import org.example.shopping.common.CommonResult;
import org.example.shopping.service.ShopCartService;
import org.example.shopping.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("shopcart")
public class ShopCartController {

    private CommonResult commonResult;

    private final ShopCartService shopCartService;
    private final UserService userService;

    @Autowired
    public ShopCartController(ShopCartService shopCartService, UserService userService) {
        this.shopCartService = shopCartService;
        this.userService = userService;
    }

    private User getUser(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        User user = userService.findByUserName(username);
        return user;
    }

    @RequestMapping("index")
    public String index(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");

        int count = 0;
        int num = 0;
        double total = 0.00;
        List<ShopCart> shopCartList = shopCartService.selectShopCartAll(username);
        for (ShopCart shopCart : shopCartList) {
            if (shopCart.getState() == 1) {
                num+=1;
            }
            if (shopCart.getState() == 1) {
                total+=shopCart.getTotalPrice();
            }
            count+=1;
        }

        model.addAttribute("shopCartList", shopCartList);
        model.addAttribute("count", count);
        model.addAttribute("num", num);
        model.addAttribute("total", String.format("%.2f", total));
        return "/shopcart/index";
    }

    @ResponseBody
    @RequestMapping("Settlement")
    public CommonResult Settlement(HttpServletRequest request) {
        Long id = Long.valueOf(request.getParameter("id"));
        String taf = request.getParameter("taf");
        Integer num = Integer.valueOf(request.getParameter("num"));
        Float total_price = Float.valueOf(request.getParameter("total_price"));

        int result;
        if (taf.equals("0")) {
            result = shopCartService.updateShopCartState(id, total_price, num, 1);
            commonResult = new CommonResult(result, "order", null);
        } else {
            result = shopCartService.updateOrderState(id, 0);
            commonResult = new CommonResult(result, "shopcart", null);
        }
        return commonResult;
    }

    @RequestMapping("confirm")
    public String confirm(HttpServletRequest request, Model model) {
        List<Long> s_id = new ArrayList<Long>();
        User user = getUser(request);
        List<Receiving> receivingList = shopCartService.selectReceivingByUid(user.getId());
        List<ShopCart> shopCartList = shopCartService.selectOrderAll(user.getUsername());
        List<Address> provinceList = shopCartService.selectProvinceAll();
        for (ShopCart shopCart : shopCartList) {
            s_id.add(shopCart.getId());
        }
        String stringFromList = StringUtils.join(s_id.toArray(), ',');
        int count = 0;
        Float total = 0f;
        for (ShopCart shopCart : shopCartList) {
            if (shopCart.getState() == 1) {
                total+=shopCart.getTotalPrice();
            }
            count+=1;
        }

        model.addAttribute("username", user.getUsername());
        model.addAttribute("receivingList", receivingList);
        model.addAttribute("shopCartList", shopCartList);
        model.addAttribute("provinceList", provinceList);
        model.addAttribute("s_id", stringFromList);
        model.addAttribute("count", count);
        model.addAttribute("total", String.format("%.2f", total));
        return "/shopcart/confirm";
    }

    @ResponseBody
    @RequestMapping("urban_district")
    private CommonResult urbanDistrict(HttpServletRequest request) {
        if (request.getParameter("p_id") != null) {
            Long p_id = Long.valueOf(request.getParameter("p_id"));
            List<Address> cityList = shopCartService.selectCityByPid(p_id);
            commonResult = new CommonResult(1, "success", cityList);
        }
        if (request.getParameter("c_id") != null) {
            Long c_id = Long.valueOf(request.getParameter("c_id"));
            List<Address> areaList = shopCartService.selectAreaByCid(c_id);
            commonResult = new CommonResult(1, "success", areaList);
        }

        return commonResult;
    }

    @ResponseBody
    @RequestMapping("editAddress")
    public CommonResult editAddress(HttpServletRequest request, Receiving receiving) {
        String genggai = request.getParameter("genggai");
        String province = receiving.getProvince();
        String city = receiving.getCity();

        User user = getUser(request);
        String reid = receiving.getProvince()+","+receiving.getCity()+","+receiving.getArea();
        List<Address> addressList = shopCartService.selectAddressByStr(reid);
        int result = 0;
        if (genggai.equals("0")) {
            getReceiving(receiving, province, city, user, addressList);
            result = shopCartService.addReceivingAddress(receiving);
            commonResult = new CommonResult(result, "添加成功", null);
        } else {
            getReceiving(receiving, province, city, user, addressList);
            result = shopCartService.editReceivingAddress(receiving, Long.valueOf(genggai));
            commonResult = new CommonResult(result, "修改成功", null);
        }
        return commonResult;
    }

    private void getReceiving(Receiving receiving, String province, String city, User user, List<Address> addressList) {
        for (Address address : addressList) {
            if (address.getId().equals(Long.valueOf(province))) {
                receiving.setProvince(address.getName());
            } else if (address.getId().equals(Long.valueOf(city))) {
                receiving.setCity(address.getName());
            } else {
                receiving.setArea(address.getName());
                receiving.setZipcode(address.getZipCode());
            }
        }
        receiving.setUid(user.getId());
    }

    @ResponseBody
    @RequestMapping("place_an_order")
    public CommonResult place_an_order(HttpServletRequest request, Order order) {
        String s_id = request.getParameter("sid");

        Random rand = new Random();
        Long time = System.currentTimeMillis()/1000;
        int pickedNumber = rand.nextInt(999899) + 100;
        String order_number = "X20"+time+pickedNumber;
        User user = getUser(request);
        BigDecimal totalPrice = BigDecimal.valueOf(order.getTotalPrice());
        List<ShopCart> shopCartList = shopCartService.selectScById(s_id);

//        if (user.getMoney().compareTo(totalPrice) == -1) {
//            return new CommonResult(0, "余额不足", null);
//        }
        for (ShopCart shopCart: shopCartList) {
            int stock = shopCartService.stockById(shopCart.getSid());
            if (stock <= 0) {
                return new CommonResult(0, "库存不足", null);
            }
        }

        order.setUid(user.getId());
        order.setOrderNumber(order_number);
        int result = shopCartService.insertOrder(order);
        int state = shopCartService.updateScState(s_id);
        if (result == 1 && state == 2) {
            commonResult = new CommonResult(1, "下单成功", null);
        } else {
            commonResult = new CommonResult(0, "未知错误", null);
        }
        return commonResult;
    }

    @ResponseBody
    @RequestMapping("delete_address")
    public CommonResult delete_address(HttpServletRequest request) {
        Long id = Long.valueOf(request.getParameter("id"));

        int result = shopCartService.deleteReceivingAddress(id);
        if (result == 1) {
            commonResult = new CommonResult(result, "删除成功", null);
        } else {
            commonResult = new CommonResult(0, "error", null);
        }
        return commonResult;
    }

}
