package org.example.admin.service;

import org.example.shopping.bean.Classify;
import org.example.shopping.bean.Shops;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface CommodityService {

    List<Shops> findAll(String name);

    Integer save(MultipartFile file, Shops shops, Integer save);

    List<Classify> findClassify();

    Shops findShopById(Integer id);

}
