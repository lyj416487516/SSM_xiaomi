package org.example.shopping.dao.impl;

import org.example.shopping.bean.Order;
import org.example.shopping.bean.ShopCart;
import org.example.shopping.bean.Shops;
import org.example.shopping.dao.OrderDao;
import org.example.shopping.mapper.OrderMapper;
import org.example.shopping.mapper.ShopCartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDaoImpl implements OrderDao {

    private final OrderMapper orderMapper;
    private final ShopCartMapper shopCartMapper;

    @Autowired
    public OrderDaoImpl(OrderMapper orderMapper, ShopCartMapper shopCartMapper) {
        this.orderMapper = orderMapper;
        this.shopCartMapper = shopCartMapper;
    }

    @Override
    public Order findOrderById(Long id) {
        return orderMapper.findOrderById(id);
    }

    @Override
    public Order findOrderByOrderNumber(String orderNumber) {
        return orderMapper.findOrderByOrderNumber(orderNumber);
    }

    @Override
    public List<ShopCart> selectShopInId(String id) {
        return shopCartMapper.selectShopInId(id);
    }

    @Override
    public int updateOrderState(Long id, int state) {
        return orderMapper.updateOrderState(id, state);
    }
}
