package com.yg.mapper;

import com.yg.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/*订单*/
public interface OrderMapper {
//    增加一个订单
    int addOrder(@Param("order") Order order);
//    删除一个订单
    int deleteOrder(@Param("orderId") int orderId);
//    更新订单信息
    int updateOrder(@Param("order") Order order);
//    查询订单信息
    Order queryOrderById(@Param("orderId") int orderId);
//    查询全部订单信息
    List<Order> queryAllOrder(@Param("pageNo") int pageNo, @Param("pageSize") int pageSize);
//    根据飞机编号查询订单
    Order queryOrderByAirId(@Param("airId") String airId);
//    根据用户ID查询订单
    List<Order> queryOrderByUserId(@Param("userId") String userId);
}
