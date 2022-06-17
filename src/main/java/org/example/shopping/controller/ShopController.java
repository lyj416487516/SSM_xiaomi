package org.example.shopping.controller;

import org.example.shopping.bean.*;
import org.example.shopping.common.CommonResult;
import org.example.shopping.service.ShopService;
import org.example.shopping.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("shop")
public class ShopController {

    private CommonResult commonResult;

    private final ShopService shopService;
    private final UserService userService;

    @Autowired
    public ShopController(ShopService shopService, UserService userService) {
        this.shopService = shopService;
        this.userService = userService;
    }

    @RequestMapping("index/{cid}")
    public String index(@PathVariable int cid, HttpServletRequest request, Model model) {

        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        if (username != null) {
            model.addAttribute(username);
        }

        List<Shops> shopList = shopService.selectShopList(cid, 0, 10);
        List<Classify> classifyList = shopService.findClassify();
        model.addAttribute("shopList", shopList);
        model.addAttribute("classifyList", classifyList);
        model.addAttribute("cid", cid);

        return "/shop/index";
    }

    @ResponseBody
    @RequestMapping("drop")
    public CommonResult drop(HttpServletRequest request, HttpServletResponse response) {
        int cid = Integer.parseInt(request.getParameter("cid"));
        int num = Integer.parseInt(request.getParameter("num"))+1;
        List<Shops> shopsList = shopService.selectShopList(cid, num*5, 5);
        if (shopsList != null) {
            commonResult = new CommonResult(num, "加载成功", shopsList);
        } else {
            commonResult = new CommonResult(0, "没有数据了", null);
        }
        return commonResult;
    }

    @RequestMapping("details/{id}")
    public String details(@PathVariable int id, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        if (username != null) {
            model.addAttribute(username);
        }

        Shops shop = shopService.findShopById(id);
        String edition_id = shop.getEdition();
        List<Specification> edition = shopService.selectInEdition(edition_id);
        String color_id = shop.getColor();
        List<Specification> color = shopService.selectInEdition(color_id);

        String[] a = edition_id.split(",");
        int edmin = getMin(a);
        String[] b = color_id.split(",");
        int crmin = getMin(b);
        String initial = edmin+","+crmin;
        InitShop initShop = shopService.initShopAndEdCr(id, edmin, crmin);
        int stock = shopService.selectStockByEid((long) id, initial);
        initShop.setStock(stock);

        model.addAttribute("shop", shop);
        model.addAttribute("edition", edition);
        model.addAttribute("color", color);
        model.addAttribute("initShop", initShop);

        return "/shop/details";
    }

    @ResponseBody
    @RequestMapping("edition")
    public CommonResult edition(HttpServletRequest request) {
        Long did = Long.valueOf(request.getParameter("id"));
        String eid = request.getParameter("eid");

        int stock = shopService.selectStockByEid(did, eid);
        Float sum = shopService.selectPriceByEid(did, eid);
        Map<String, Object> map = new HashMap();
        map.put("stock", stock);
        map.put("sum", sum);

        commonResult = new CommonResult(0, "success", map);
        return commonResult;
    }

    @ResponseBody
    @RequestMapping("shoppingcart")
    public CommonResult shoppingcart(HttpServletRequest request) {
        Long did = Long.valueOf(request.getParameter("id"));
        String eid = request.getParameter("eid");
        String cid = request.getParameter("cid");
        String edcr = eid+","+cid;
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");

        int stock = shopService.selectStockByEid(did, edcr);
        if (stock == 0) {
            commonResult = new CommonResult(0, "库存不足", null);
        }

        Long s_id = shopService.selectIdByEid(did, edcr);
        Float sum = shopService.selectPriceByEid(did, edcr);
        ShopCart shopCart = new ShopCart(username, did, Long.valueOf(eid), Long.valueOf(cid), s_id, sum, sum, 1, 0);
        int result = shopService.insertShopCart(shopCart);
        if (result != 0) {
            commonResult = new CommonResult(1, "加入成功", result);
        } else {
            commonResult = new CommonResult(0, "发生错误", null);
        }

        return commonResult;
    }

    //定义一个方法用来获取最小值
    public static int getMin(String[] array2) {

        int min = Integer.parseInt(array2[0]); // 定义一个变量用来创建最小值，初始化值可以为数组中任意一个
        //注意，这是是根据元素的大小来比较
        for (String s : array2) {

            if (Integer.parseInt(s) < min) // 如果遍历的元素值小于min,就赋给min
            {
                min = Integer.parseInt(s);

            }

        }
        return min;

    }

}
