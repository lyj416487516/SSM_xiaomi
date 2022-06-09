package org.example.shopping.dao.impl;

import org.example.shopping.bean.Order;
import org.example.shopping.bean.User;
import org.example.shopping.dao.UserDao;
import org.example.shopping.mapper.OrderMapper;
import org.example.shopping.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    private final UserMapper userMapper;
    private final OrderMapper orderMapper;

    @Autowired
    public UserDaoImpl(UserMapper userMapper, OrderMapper orderMapper) {
        this.userMapper = userMapper;
        this.orderMapper = orderMapper;
    }

    @Override
    public User findUserByName(String userName, String userPassword) {
        return  userMapper.findBySysUser(userName, userPassword);
    }

    @Override
    public int  insertUser(User sysUser) {
        return userMapper.insertUser(sysUser);
    }

    @Override
    public User findByUserName(String username) {
        return userMapper.findByUserName(username);
    }

    @Override
    public int updateUserInfo(User user) {
        return userMapper.updateUserInfo(user);
    }

    @Override
    public List<Order> selectOrderByUid(Long uid) {
        return orderMapper.selectOrderByUid(uid);
    }

    @Override
    public int decUserMoney(Long id, BigDecimal money) {
        return userMapper.decUserMoney(id, money);
    }
}
