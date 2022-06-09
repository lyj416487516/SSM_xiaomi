package org.example.shopping.controller;

import org.example.shopping.bean.Classify;
import org.example.shopping.bean.Shops;
import org.example.shopping.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("index")
public class IndexController {

    @Autowired
    public IndexService indexService;

    @RequestMapping("index")
    public String index(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        if (username != null) {
            model.addAttribute(username);
        }

        List<Classify> classifyList = indexService.classFindAll();

        model.addAttribute("classifyList", classifyList);
        return "index/index";
    }

}
