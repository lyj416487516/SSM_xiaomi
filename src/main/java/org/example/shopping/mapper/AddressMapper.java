package org.example.shopping.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.example.shopping.bean.Address;

import java.util.List;

@Mapper
public interface AddressMapper {

    /**
     * 查询所有省份
     * @return
     */
    List<Address> selectProvinceAll();

    /**
     * 通过省份id查询所属城市
     * @param pid
     * @return
     */
    List<Address> selectCityByPid(Long pid);

    /**
     * 通过城市id查询所属县区
     * @param cid
     * @return
     */
    List<Address> selectAreaByCid(Long cid);

    /**
     * 查询省市县的id得出多条数据
     * @param id
     * @return
     */
    List<Address> selectAddressByStr(String id);

}
