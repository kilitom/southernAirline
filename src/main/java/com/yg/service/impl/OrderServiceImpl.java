package com.yg.service.impl;

import com.yg.mapper.OrderMapper;
import com.yg.pojo.Order;
import com.yg.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    public int addOrder(Order order) {
        return orderMapper.addOrder(order);
    }

    public int deleteOrder(String orderId) {
        return orderMapper.deleteOrder(orderId);
    }

    public int updateOrder(Order order) {
        return orderMapper.updateOrder(order);
    }

    public Order queryOrderById(String orderId) {
        return orderMapper.queryOrderById(orderId);
    }

    public List<Order> queryAllOrder(int pageNo ,int pageSize) {
        return orderMapper.queryAllOrder(pageNo,pageSize);
    }

    public  Order queryOrderByAirId(String airId) {
        return orderMapper.queryOrderByAirId(airId);
    }

    public  List<Order> queryOrderByUserId(String userId){
        return orderMapper.queryOrderByUserId(userId);
    }
}
