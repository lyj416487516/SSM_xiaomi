package org.example.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {

    @RequestMapping("index")
    public String index() {
        return "/admin/index/index";
    }

    @RequestMapping("home")
    public String home() {
        return "/admin/index/home";
    }

}
