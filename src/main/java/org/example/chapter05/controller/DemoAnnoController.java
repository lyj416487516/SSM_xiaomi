package org.example.chapter05.controller;

import org.example.chapter05.model.DemoObj;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/anno")
public class DemoAnnoController {

    @RequestMapping(value = "/index", method = RequestMethod.GET, produces = MediaType.TEXT_PLAIN_VALUE)
    @ResponseBody//该注解可以放在返回值前或者方法上，用于将返回值放在response体内，而不是返回一个页面
    public String index(HttpServletRequest request) {
        return "url:" + request.getRequestURI() + " can access";
    }

    @RequestMapping(value = "/requestParam", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    //@RequestParam注解用于接收URL中的参数信息      使用了@RequestParam注解的参数，在Url中必须传递。
    public @ResponseBody String passRequestParam(@RequestParam("id") Long id, @RequestParam("name") String name, HttpServletRequest request) {
        return "url:" + request.getRequestURI() + " can access,id: " + id + ",name=" + name;
    }

    @RequestMapping(value = "/pathvar/{str}", produces = "text/plain;charset=UTF-8")
    //@PathVariable注解中指定value属性的话，它会假设占位符的名称与方法的参数名相同。
    public @ResponseBody String demoPathVar(@PathVariable("str") String str, HttpServletRequest request) {
        return "url:" + request.getRequestURI() + " can access,str: " + str;
    }

    @RequestMapping(value = "/obj", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public String passObj(@RequestBody DemoObj demoObj, HttpServletRequest request) {
        return "url:" + request.getRequestURI() + " can access,demoObj id：" + demoObj.getId() +
                " demoObj name:" + demoObj.getName();
    }
}