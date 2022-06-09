package org.example.shopping.dao;

import org.example.shopping.bean.Order;
import org.example.shopping.bean.ShopCart;
import org.example.shopping.bean.Shops;

import java.util.List;

public interface OrderDao {

    Order findOrderById(Long id);

    Order findOrderByOrderNumber(String orderNumber);

    List<ShopCart> selectShopInId(String id);

    int updateOrderState(Long id, int state);

}
