package org.example.shopping.dao;

import org.example.shopping.bean.Order;
import org.example.shopping.bean.User;

import java.math.BigDecimal;
import java.util.List;

public interface UserDao {

    User findUserByName(String username, String userpwd);

    int insertUser(User sysUser);

    User findByUserName(String username);

    int updateUserInfo(User user);

    List<Order> selectOrderByUid(Long uid);

    int decUserMoney(Long id, BigDecimal money);

}
