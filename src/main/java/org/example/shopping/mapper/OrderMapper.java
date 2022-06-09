package org.example.shopping.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.example.shopping.bean.Order;

import java.util.List;

@Mapper
public interface OrderMapper {

    /**
     * 添加订单
     * @param order
     * @return
     */
    int insertOrder(Order order);

    /**
     * 通过用户id查询所有的订单
     * @param uid
     * @return
     */
    List<Order> selectOrderByUid(Long uid);

    /**
     * 通过id查找对应订单
     * @param id
     * @return
     */
    Order findOrderById(Long id);

    /**
     * 通过订单号查找对应订单
     * @param orderNumber
     * @return
     */
    Order findOrderByOrderNumber(String orderNumber);

    /**
     * 通过id修改订单状态
     * @param id
     * @param state
     * @return
     */
    int updateOrderState(@Param("id") Long id, @Param("state") int state);

}
