package org.example.shopping.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.example.shopping.bean.InitShop;
import org.example.shopping.bean.Shops;

import java.util.List;
import java.util.Map;

@Mapper
public interface ShopMapper {

    /**
     * 查询所有商品
     * @return
     */
    List<Shops> selectAllShop(String name);

    /**
     * 商品列表
     * @param cid
     * @param start
     * @param end
     * @return
     */
    List<Shops> selectShopList(@Param("cid") int cid, @Param("s") int start, @Param("e") int end);

    /**
     * 根据ID查找商品
     * @param id
     * @return
     */
    Shops findShopById(int id);

    /**
     * 多表查询初始商品信息
     * @param did
     * @param eid
     * @param cid
     * @return
     */
    InitShop initShopAndEdCr(@Param("did") int did, @Param("eid") int eid, @Param("cid") int cid);

    /**
     * 添加商品
     * @param shop
     * @return
     */
    Integer save(Shops shop);

    /**
     * 修改商品
     * @param shops
     * @return
     */
    Integer update(Shops shops);

}
