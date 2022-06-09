package org.example.admin.controller;

import org.example.admin.service.CommodityService;
import org.example.shopping.bean.Shops;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("commodity")
public class CommodityController {

    @Autowired
    private CommodityService commodityService;

    @RequestMapping("index")
    public String index() {
        List<Shops> shopsList = commodityService.findAll();
        System.out.println(shopsList);

        return "/admin/commodity/index";
    }

}
