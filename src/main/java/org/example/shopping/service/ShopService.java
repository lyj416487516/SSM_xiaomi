package org.example.shopping.service;

import org.example.shopping.bean.*;

import java.util.List;

public interface ShopService {

    List<Shops> selectShopList(int cid, int s, int e);

    Shops findShopById(int id);

    List<Specification> selectInEdition(String id);

    InitShop initShopAndEdCr(int did, int eid, int cid);

    int selectStockByEid(Long did, String eid);

    Float selectPriceByEid(Long did, String eid);

    Long selectIdByEid(Long did, String eid);

    int insertShopCart(ShopCart shopCart);

    List<Classify> findClassify();

}
