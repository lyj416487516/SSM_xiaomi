package org.example.shopping.service.Impl;

import org.example.shopping.bean.Order;
import org.example.shopping.bean.User;
import org.example.shopping.dao.UserDao;
import org.example.shopping.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.math.BigDecimal;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    private final UserDao userDao;

    @Autowired
    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User checkLogin(String userName, String userPassword) {
        User user = userDao.findByUserName(userName);
        String salt = user.getSalt();
        String salty = salt+userPassword;
        String password = DigestUtils.md5DigestAsHex(salty.getBytes());
        if (user.getPassword().equals(password)) {
            User sysUser = userDao.findUserByName(userName, password);
            if (sysUser.getUsername().equals(userName) && sysUser.getPassword().equals(password)) {
                return sysUser;
            }
        }
        return null;
    }

    @Override
    public int Regist(User sysUser) {
        if (sysUser != null) {
            return userDao.insertUser(sysUser);
        }
        return 0;
    }

    @Override
    public User findByUserName(String username) {
        return userDao.findByUserName(username);
    }

    @Override
    public int updateUserInfo(User user) {
        return userDao.updateUserInfo(user);
    }

    @Override
    public List<Order> selectOrderByUid(Long uid) {
        return userDao.selectOrderByUid(uid);
    }

    @Override
    public int decUserMoney(Long id, BigDecimal money) {
        return userDao.decUserMoney(id, money);
    }
}
