package org.example.shopping.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.example.shopping.bean.Shops;
import org.example.shopping.bean.Specification;

import java.util.List;

@Mapper
public interface SpecificationMapper {

    /**
     * 根据id查询对应规格
     * @param id
     * @return
     */
    List<Specification> selectInEdition(String id);

    /**
     * 通过规格id查询总价格
     * @param did
     * @param eid
     * @return
     */
    Float selectPriceByEid(@Param("did") Long did, @Param("eid") String eid);

}
