package org.example.shopping.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.example.shopping.bean.Stock;

import java.util.List;

@Mapper
public interface StockMapper {

    /**
     * 通过规格id查询库存
     * @param did 商品id
     * @param eid 规格id
     * @return int
     */
    int selectStockByEid(@Param("did") Long did, @Param("eid") String eid);

    /**
     * 通过规格id查询库存id
     * @param did
     * @param eid
     * @return
     */
    Long selectIdByEid(@Param("did") Long did, @Param("eid") String eid);

    /**
     * 通过id查询库存
     * @param sid
     * @return
     */
    int stockById(Long sid);

}
