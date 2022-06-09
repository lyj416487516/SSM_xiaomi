package org.example.admin.service.impl;

import org.example.admin.service.CommodityService;
import org.example.shopping.bean.Shops;
import org.example.shopping.mapper.ShopMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommodityServiceImpl implements CommodityService {

    @Autowired
    private ShopMapper shopMapper;

    @Override
    public List<Shops> findAll() {
        return shopMapper.selectAllShop();
    }
}
