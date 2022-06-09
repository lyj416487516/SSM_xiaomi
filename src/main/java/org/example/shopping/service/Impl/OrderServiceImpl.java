package org.example.shopping.service.Impl;

import org.example.shopping.bean.Order;
import org.example.shopping.bean.ShopCart;
import org.example.shopping.dao.OrderDao;
import org.example.shopping.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    private final OrderDao orderDao;

    @Autowired
    public OrderServiceImpl(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    @Override
    public Order findOrderById(Long id) {
        return orderDao.findOrderById(id);
    }

    @Override
    public Order findOrderByOrderNumber(String orderNumber) {
        return orderDao.findOrderByOrderNumber(orderNumber);
    }

    @Override
    public List<ShopCart> selectShopInId(String id) {
        return orderDao.selectShopInId(id);
    }

    @Override
    public int updateOrderState(Long id, int state) {
        return orderDao.updateOrderState(id, state);
    }
}
