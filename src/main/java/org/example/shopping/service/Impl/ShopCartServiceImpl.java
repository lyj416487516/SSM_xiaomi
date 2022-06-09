package org.example.shopping.service.Impl;

import org.example.shopping.bean.*;
import org.example.shopping.dao.ShopCartDao;
import org.example.shopping.dao.ShopDao;
import org.example.shopping.service.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopCartServiceImpl implements ShopCartService {

    private final ShopCartDao shopCartDao;

    @Autowired
    public ShopCartServiceImpl(ShopCartDao shopCartDao) {
        this.shopCartDao = shopCartDao;
    }

    @Override
    public List<ShopCart> selectShopCartAll(String uid) {
        return shopCartDao.selectShopCartAll(uid);
    }

    @Override
    public List<ShopCart> selectOrderAll(String uid) {
        return shopCartDao.selectOrderAll(uid);
    }

    @Override
    public int updateShopCartState(Long id, Float total_price, Integer num, Integer state) {
        return shopCartDao.updateShopCartState(id, total_price, num, state);
    }

    @Override
    public int updateOrderState(Long id, Integer state) {
        return shopCartDao.updateOrderState(id, state);
    }

    @Override
    public List<Receiving> selectReceivingByUid(Long uid) {
        return shopCartDao.selectReceivingByUid(uid);
    }

    @Override
    public List<Address> selectProvinceAll() {
        return shopCartDao.selectProvinceAll();
    }

    @Override
    public List<Address> selectCityByPid(Long pid) {
        return shopCartDao.selectCityByPid(pid);
    }

    @Override
    public List<Address> selectAreaByCid(Long cid) {
        return shopCartDao.selectAreaByCid(cid);
    }

    @Override
    public List<Address> selectAddressByStr(String id) {
        return shopCartDao.selectAddressByStr(id);
    }

    @Override
    public int addReceivingAddress(Receiving receiving) {
        return shopCartDao.addReceivingAddress(receiving);
    }

    @Override
    public int editReceivingAddress(Receiving receiving, Long id) {
        return shopCartDao.editReceivingAddress(receiving, id);
    }

    @Override
    public int deleteReceivingAddress(Long id) {
        return shopCartDao.deleteReceivingAddress(id);
    }

    @Override
    public int insertOrder(Order order) {
        return shopCartDao.insertOrder(order);
    }

    @Override
    public List<ShopCart> selectScById(String sid) {
        return shopCartDao.selectScById(sid);
    }

    @Override
    public int stockById(Long sid) {
        return shopCartDao.stockById(sid);
    }

    @Override
    public int updateScState(String id) {
        return shopCartDao.updateScState(id);
    }
}
