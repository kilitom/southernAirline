package com.yg.controller;

import com.yg.pojo.Order;
import com.yg.service.OrderService;
import com.yg.utils.DateUtil;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;

    //添加订单
    @RequestMapping(value = "addOrder", method = RequestMethod.POST)
    public String addOrder(Order order,
                           Map<String, Object> map) {
        Order byOrderId = orderService.queryOrderById(order.getOrderId());
        if (byOrderId != null) {
            map.put("msg", "订单编号已存在");
            return "adminorderinser";
        } else {

            int result = orderService.addOrder(order);
            if (result != 1) {
                map.put("code", 500);
                map.put("msg", "添加订单失败");
                return "adminorderinser";
            }
            map.put("code", 200);
            map.put("msg", "添加订单成功");
            return "adminorderDesign";
        }
    }

    //    删除订单
    @RequestMapping(value = "deleteOrderById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> deleteOrderByOrderId(@RequestParam("orderId") String orderId) {
        Map<String, Object> map = new HashMap<String, Object>();
        int result = orderService.deleteOrder(orderId);
        if (result != 1) {
            map.put("code", 500);
            map.put("msg", "删除订单失败");
            return map;
        }
        map.put("code", 200);
        map.put("msg", "删除订单成功");
        map.put("data",result);

        return map;
    }


    //    修改订单
    @RequestMapping(value = "updateOrder", method = RequestMethod.POST)
    public String updateOrder(Order order,
                              Map<String, Object> map) {
        int result = orderService.updateOrder(order);
        if (result != 1) {
            map.put("code", 500);
            map.put("msg", "订单修改失败");
            return "adminorderUpdate";
        }
        map.put("code", 200);
        map.put("msg", "订单修改成功");
        return "adminorderDesign";
    }

//    根据订单编号查询订单
    @RequestMapping(value = "queryOrderById",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> queryOrderById(@RequestParam("orderId") String orderId,
                                             HttpServletRequest req,
                                             HttpServletResponse resp) throws IOException{

        Order order = orderService.queryOrderById(orderId);
        Map<String,Object> resultMap =new HashMap<String, Object>();

        resultMap.put("date",order);
        String msg = "query success";
        String code = "200";
        if (orderId == null|| orderId.equals(" ")){
            msg = "参数错误";
            code = "500";
            resultMap.put("msg",msg);
            resultMap.put("code",code);
            return resultMap;
        }
        resultMap.put("msg",msg);
        resultMap.put("code",code);
        req.getSession().setAttribute("order",order);

        return resultMap;
    }
//    查询所有订单
    @RequestMapping(value = "queryAllOrder",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> queryAllOder(@RequestParam("pageNo") String pageNo,
                                           @RequestParam("pageSize") String pageSize) throws IOException {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String msg = "queryOrder success";
        String code = "200";
        //参数校验
        if (pageNo == null || pageNo.equals("")) {
            pageNo = "1";
        }
        if (pageSize == null || pageSize.equals("")) {
            pageSize = "2";
        }
        //校验取值范围
        if (Integer.parseInt(pageNo) <= 0 || Integer.parseInt(pageSize) <= 0) {
            msg = "参数错误，取值要注意哦";
            code = "500";
            resultMap.put("msg", msg);
            resultMap.put("code", code);
            return resultMap;
        }

        List<Order> orders = orderService.queryAllOrder(Integer.parseInt(pageNo) - 1, Integer.parseInt(pageSize));

        if (orders == null || orders.size() == 0) {
            resultMap.put("msg", "query fail");
            resultMap.put("coed", 500);
        } else {
            resultMap.put("msg", "query success");
            resultMap.put("code", 200);
        }
        resultMap.put("data", orders);

        return resultMap;

    }

//    根据用户ID查询订单
    @RequestMapping(value = "queryOrderByUserId",method = RequestMethod.GET)
    public String queryOrderByUserId(@RequestParam("userId") String userId,
                                     HttpServletRequest req, Model model) throws IOException{

        List<Order> order = orderService.queryOrderByUserId(userId);
        Map<String,Object> resultMap = new HashMap<String, Object>();

        resultMap.put("date",order);
        String msg = "query success";
        String code = "200";
        if (userId == null || userId.equals("")){
            msg = "参数错误";
            code = "500";
            resultMap.put("msg",msg);
            resultMap.put("code",code);
            return  "indexuser";
        }
        resultMap.put("msg",msg);
        resultMap.put("code",code);
        resultMap.put("oder",order);

        req.getSession().setAttribute("order",order);
        model.addAttribute("orders",order);
        return  "orderList";
    }

//   生成订单
    @ResponseBody
    @RequestMapping(value = "insertOrder",method = RequestMethod.POST)
    public Map<String,Object> insertOrder(Order order,
                                          @RequestParam("originTime") String origintime,
                                          @RequestParam("destinationTime") String destinationtime){
        Map<String,Object> map = new HashMap<>();
        Date originTime = DateUtil.strToUtil(origintime);
        Date detinationTime = DateUtil.strToUtil(destinationtime);
        order.setOriginTime(DateUtil.utilToSql(originTime));
        order.setDestinationTime(DateUtil.utilToSql(detinationTime));
        int i = orderService.addOrder(order);
        if (i!=1){
            map.put("msg","生成订单失败");
            map.put("code",500);
        }
        map.put("msg","生成订单成功");
        map.put("code",200);
        return map;

    }
//    更新支付状态


}
