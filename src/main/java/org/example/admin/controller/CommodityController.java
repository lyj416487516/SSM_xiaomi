package org.example.admin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.example.admin.service.CommodityService;
import org.example.shopping.bean.Classify;
import org.example.shopping.bean.Shops;
import org.example.shopping.common.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("commodity")
public class CommodityController {

    private CommonResult commonResult;

    @Autowired
    private CommodityService commodityService;

    @RequestMapping("index/{page}")
    public String index(@PathVariable Integer page, String keyword, Model model) {
        PageHelper.startPage(page,5);
        List<Shops> shopsList = commodityService.findAll(keyword);
        PageInfo pageInfo = new PageInfo(shopsList,5);

        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("keyword",keyword);
        model.addAttribute("page", page);
        return "/admin/commodity/index";
    }

    @RequestMapping("save_info")
    public String save_info(Model model) {
        List<Classify> classifyList = commodityService.findClassify();

        model.addAttribute("classifyList", classifyList);
        return "/admin/commodity/save_info";
    }

    @ResponseBody
    @RequestMapping("add")
    public CommonResult add(MultipartFile cover, Shops shops) {
        Integer code = commodityService.save(cover, shops, 1);
        if (code == 1) {
            commonResult = new CommonResult(code, "添加成功", null);
        } else {
            commonResult = new CommonResult(code, "添加失败", null);
        }
        return commonResult;
    }

    @RequestMapping("save/{id}")
    public String save(@PathVariable Integer id, Model model) {
        Shops shops = commodityService.findShopById(id);
        List<Classify> classifyList = commodityService.findClassify();

        model.addAttribute("shop", shops);
        model.addAttribute("classifyList", classifyList);
        model.addAttribute("id", id);
        return "/admin/commodity/save";
    }

    @ResponseBody
    @RequestMapping("update")
    public CommonResult update(MultipartFile cover, Shops shops) {
        Integer code = commodityService.save(cover, shops, 2);
        if (code == 1) {
            commonResult = new CommonResult(code, "添加成功", null);
        } else {
            commonResult = new CommonResult(code, "添加失败", null);
        }
        return commonResult;
    }

}
