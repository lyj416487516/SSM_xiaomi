package org.example.shopping.service;

import org.example.shopping.bean.Order;
import org.example.shopping.bean.User;

import java.math.BigDecimal;
import java.util.List;

public interface UserService {

    //检验用户登录
    User checkLogin(String username, String password);

    int Regist(User user);

    User findByUserName(String username);

    int updateUserInfo(User user);

    List<Order> selectOrderByUid(Long uid);

    int decUserMoney(Long id, BigDecimal money);

}
