package org.example.shopping.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.example.shopping.bean.ShopCart;
import org.example.shopping.bean.Shops;

import java.util.List;

@Mapper
public interface ShopCartMapper {

    /**
     * 加入购物车
     * @param shopCart
     * @return
     */
    int insertShopCart(ShopCart shopCart);

    /**
     * 查询购物车是否存在商品
     * @param username
     * @param did
     * @param eid
     * @param state
     * @return
     */
    ShopCart isSetShopCart(@Param("uid") String username, @Param("did") Long did, @Param("eid") Long eid, @Param("cid") Long cid, @Param("state") Integer state);

    /**
     * 增加购物车商品数量
     * @param num
     * @param id
     * @return
     */
    int incShopCartNumber(@Param("price") Float price, @Param("num") int num, @Param("id") Long id);

    /**
     * 查询用户购物车中所有商品
     * @param uid
     * @return
     */
    List<ShopCart> selectShopCartAll(String uid);

    /**
     * 查询订单中所有商品
     * @param uid
     * @return
     */
    List<ShopCart> selectOrderAll(String uid);

    /**
     * 将购物车中的商品改成订单
     * @param id
     * @param total_price
     * @param num
     * @param state
     * @return
     */
    int updateShopCartState(@Param("id") Long id, @Param("price") Float total_price, @Param("num") Integer num , @Param("state") Integer state);

    /**
     * 将订单改回购物车
     * @param id
     * @param state
     * @return
     */
    int updateOrderState(@Param("id") Long id, @Param("state") Integer state);

    /**
     * 通过id查询多条数据
     * @param sid
     * @return
     */
    List<ShopCart> selectScById(String sid);

    /**
     * 根据多个id查询对应商品
     * @param id
     * @return
     */
    List<ShopCart> selectShopInId(String id);

    /**
     * 根据多个购物车id更改状态
     * @param id
     * @return
     */
    int updateScState(String id);

}
