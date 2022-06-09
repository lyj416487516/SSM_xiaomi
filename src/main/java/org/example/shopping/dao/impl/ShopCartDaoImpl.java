package org.example.shopping.dao.impl;

import org.example.shopping.bean.*;
import org.example.shopping.dao.ShopCartDao;
import org.example.shopping.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ShopCartDaoImpl implements ShopCartDao {

    private final ShopCartMapper shopCartMapper;
    private final ReceivingMapper receivingMapper;
    private final AddressMapper addressMapper;
    private final OrderMapper orderMapper;
    private final StockMapper stockMapper;

    @Autowired
    public ShopCartDaoImpl(ShopCartMapper shopCartMapper, ReceivingMapper receivingMapper, AddressMapper addressMapper, OrderMapper orderMapper, StockMapper stockMapper) {
        this.shopCartMapper = shopCartMapper;
        this.receivingMapper = receivingMapper;
        this.addressMapper = addressMapper;
        this.orderMapper = orderMapper;
        this.stockMapper = stockMapper;
    }

    @Override
    public List<ShopCart> selectShopCartAll(String uid) {
        return shopCartMapper.selectShopCartAll(uid);
    }

    @Override
    public List<ShopCart> selectOrderAll(String uid) {
        return shopCartMapper.selectOrderAll(uid);
    }

    @Override
    public int updateShopCartState(Long id, Float total_price, Integer num, Integer state) {
        return shopCartMapper.updateShopCartState(id, total_price, num, state);
    }

    @Override
    public int updateOrderState(Long id, Integer state) {
        return shopCartMapper.updateOrderState(id, state);
    }

    @Override
    public List<Receiving> selectReceivingByUid(Long uid) {
        return receivingMapper.selectReceivingByUid(uid);
    }

    @Override
    public List<Address> selectProvinceAll() {
        return addressMapper.selectProvinceAll();
    }

    @Override
    public List<Address> selectCityByPid(Long pid) {
        return addressMapper.selectCityByPid(pid);
    }

    @Override
    public List<Address> selectAreaByCid(Long cid) {
        return addressMapper.selectAreaByCid(cid);
    }

    @Override
    public List<Address> selectAddressByStr(String id) {
        return addressMapper.selectAddressByStr(id);
    }

    @Override
    public int addReceivingAddress(Receiving receiving) {
        return receivingMapper.addReceivingAddress(receiving);
    }

    @Override
    public int editReceivingAddress(Receiving receiving, Long id) {
        return receivingMapper.editReceivingAddress(receiving, id);
    }

    @Override
    public int deleteReceivingAddress(Long id) {
        return receivingMapper.deleteReceivingAddress(id);
    }

    @Override
    public int insertOrder(Order order) {
        return orderMapper.insertOrder(order);
    }

    @Override
    public List<ShopCart> selectScById(String sid) {
        return shopCartMapper.selectScById(sid);
    }

    @Override
    public int stockById(Long sid) {
        return stockMapper.stockById(sid);
    }

    @Override
    public int updateScState(String id) {
        return shopCartMapper.updateScState(id);
    }
}
