package com.yg.service;

import com.yg.pojo.Order;
import com.yg.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderService  {
    //    增加一个订单
    int addOrder(Order order);
    //    删除一个订单
    int deleteOrder(String orderId);
    //    更新订单信息
    int updateOrder(Order order);
    //    查询订单信息
    Order queryOrderById(String orderId);
    //    查询全部订单信息
    List<Order> queryAllOrder(int pageNo, int pageSize);
    //    根据飞机编号查询订单
    Order queryOrderByAirId(@Param("airId") String airId);
    //    根据用户ID查询订单
    List<Order> queryOrderByUserId(@Param("userId") String userId);
}
