package org.example.shopping.dao;

import org.example.shopping.bean.*;

import java.util.List;

public interface ShopDao {

    List<Shops> selectShopList(int cid, int s, int e);

    Shops findShopById(int id);

    List<Specification> selectInEdition(String id);

    InitShop initShopAndEdCr(int did, int eid, int cid);

    int selectStockByEid(Long did, String eid);

    Float selectPriceByEid(Long did, String eid);

    Long selectIdByEid(Long did, String eid);

    int insertShopCart(ShopCart shopCart);

    ShopCart isSetShopCart(String username, Long did, Long eid, Long cid, Integer state);

    int incShopCartNumber(Float price,int num, Long id);

    List<Classify> findClassify();

}
