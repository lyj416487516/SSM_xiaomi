package org.example.shopping.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.example.shopping.bean.Receiving;

import java.util.List;

@Mapper
public interface ReceivingMapper {

    /**
     * 通过用户id查询用户的收货地址
     * @param uid
     * @return
     */
    List<Receiving> selectReceivingByUid(Long uid);

    /**
     * 添加收货地址
     * @param receiving
     * @return
     */
    int addReceivingAddress(Receiving receiving);

    /**
     * 通过id修改收货地址
     * @param receiving
     * @param id
     * @return
     */
    int editReceivingAddress(@Param("receiving") Receiving receiving, @Param("id") Long id);

    /**
     * 删除地址
     * @param id
     * @return
     */
    int deleteReceivingAddress(Long id);

}
