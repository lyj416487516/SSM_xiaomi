package org.example.shopping.controller;

import org.example.shopping.bean.Order;
import org.example.shopping.bean.ShopCart;
import org.example.shopping.bean.User;
import org.example.shopping.common.CommonResult;
import org.example.shopping.service.OrderService;
import org.example.shopping.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("order_details")
public class OrderController {

    private CommonResult commonResult;

    private final OrderService orderService;
    private final UserService userService;

    @Autowired
    public OrderController(OrderService orderService,UserService userService) {
        this.orderService = orderService;
        this.userService = userService;
    }

    @RequestMapping("index/{id}")
    public String index(@PathVariable long id, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");

        Order order = orderService.findOrderById(id);
        List<ShopCart> shopList = orderService.selectShopInId(order.getSid());

        model.addAttribute("username", username);
        model.addAttribute("order", order);
        model.addAttribute("shopList", shopList);
        return "order_details/index";
    }

    @RequestMapping("payment/{orderNumber}")
    public String payment(@PathVariable String orderNumber, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");

        Order order = orderService.findOrderByOrderNumber(orderNumber);
        List<ShopCart> shopList = orderService.selectShopInId(order.getSid());

        model.addAttribute("username", username);
        model.addAttribute("order", order);
        model.addAttribute("shopList", shopList);
        return "order_details/payment";
    }

    @ResponseBody
    @RequestMapping("pay")
    public CommonResult pay(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        Long id = Long.valueOf(request.getParameter("id"));
        BigDecimal money = BigDecimal.valueOf(Float.valueOf(request.getParameter("money")));

        User user = userService.findByUserName(username);
        if (money.compareTo(user.getMoney()) > 0) {
            return new CommonResult(0, "余额不足", null);
        }

        int dec = userService.decUserMoney(user.getId(), money);
        int result = orderService.updateOrderState(id, 1);
        if (dec == 1 && result == 1) {
            commonResult = new CommonResult(1, "支付成功", null);
        } else {
            commonResult = new CommonResult(0, "失败", null);
        }
        return commonResult;
    }

}
