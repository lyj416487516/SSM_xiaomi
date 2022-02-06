package org.example.chapter05.controller;

import org.example.chapter05.model.DemoObj;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@ResponseBody
@RequestMapping("/rest")
public class DemoRestController {
    @RequestMapping(value = "/getjson", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public DemoObj getjson(@RequestBody DemoObj demoObj) {
        return new DemoObj(demoObj.getId(), demoObj.getName());
    }
}