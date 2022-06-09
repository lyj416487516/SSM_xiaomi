package org.example.shopping.dao;

import org.example.shopping.bean.*;

import java.util.List;

public interface ShopCartDao {

    List<ShopCart> selectShopCartAll(String uid);

    List<ShopCart> selectOrderAll(String uid);

    int updateShopCartState(Long id, Float total_price, Integer num , Integer state);

    int updateOrderState(Long id, Integer state);

    List<Receiving> selectReceivingByUid(Long uid);

    List<Address> selectProvinceAll();

    List<Address> selectCityByPid(Long pid);

    List<Address> selectAreaByCid(Long cid);

    List<Address> selectAddressByStr(String id);

    int addReceivingAddress(Receiving receiving);

    int editReceivingAddress(Receiving receiving, Long id);

    int deleteReceivingAddress(Long id);

    int insertOrder(Order order);

    List<ShopCart> selectScById(String sid);

    int stockById(Long sid);

    int updateScState(String id);

}
