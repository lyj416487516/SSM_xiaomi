package org.example.shopping.service.Impl;

import org.example.shopping.bean.*;
import org.example.shopping.dao.ShopDao;
import org.example.shopping.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopServiceImpl implements ShopService {

    private final ShopDao shopDao;

    @Autowired
    public ShopServiceImpl(ShopDao shopDao) {
        this.shopDao = shopDao;
    }

    @Override
    public List<Shops> selectShopList(int cid, int s, int e) {
        return shopDao.selectShopList(cid, s, e);
    }

    @Override
    public Shops findShopById(int id) {
        return shopDao.findShopById(id);
    }

    @Override
    public List<Specification> selectInEdition(String id) {
        return shopDao.selectInEdition(id);
    }

    @Override
    public InitShop initShopAndEdCr(int did, int eid, int cid){
        return shopDao.initShopAndEdCr(did, eid, cid);
    }

    @Override
    public int selectStockByEid(Long did, String eid) {
        return shopDao.selectStockByEid(did, eid);
    }

    @Override
    public Float selectPriceByEid(Long did, String eid) {
        return shopDao.selectPriceByEid(did, eid);
    }

    @Override
    public Long selectIdByEid(Long did, String eid) {
        return shopDao.selectIdByEid(did, eid);
    }

    @Override
    public int insertShopCart(ShopCart shopCart) {
        Long did = shopCart.getDid();
        String username = shopCart.getUid();
        Long eid = shopCart.getEid();
        Long cid = shopCart.getCid();
        Integer state = shopCart.getState();
        Float price = shopCart.getPrice();
        ShopCart isShopCart = shopDao.isSetShopCart(username, did, eid, cid, state);
        int result;
        if (isShopCart != null) {
            result = shopDao.incShopCartNumber(price,1, isShopCart.getId());
        } else {
            result = shopDao.insertShopCart(shopCart);
        }
        return result;
    }

    @Override
    public List<Classify> findClassify() {
        return shopDao.findClassify();
    }
}
