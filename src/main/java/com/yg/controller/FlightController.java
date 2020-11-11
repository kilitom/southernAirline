package com.yg.controller;

import com.google.gson.Gson;
import com.yg.pojo.Flight;
import com.yg.pojo.User;
import com.yg.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FlightController {

    @Autowired
    private FlightService flightService;


    //    查询航班
    @RequestMapping(value = "/queryFlightInformation", method = RequestMethod.GET)
    public String queryFlightInformation(@RequestParam String origin,
                                         @RequestParam String destination,
                                         @RequestParam Date originTime,
                                         Model model){

        Map<String, Object> resultMap = new HashMap<String, Object>();
        List<Flight> flightList = flightService.queryFlightInformation(origin, destination, originTime);
        if (flightList == null) {
            resultMap.put("msg", "查询失败");
            resultMap.put("code", 500);
        }
        resultMap.put("code", 200);
        model.addAttribute("flights", flightList);

        return "flightList";
    }
    //    查询航班返回Json数据@ResponseBody
    @RequestMapping(value = "/queryFlightInformationMap", method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> queryFlightInformationMap(@RequestParam String origin,
                                         @RequestParam String destination,
                                         @RequestParam Date originTime) throws Exception {

        Map<String, Object> resultMap = new HashMap<String, Object>();
        List<Flight> flightList = flightService.queryFlightInformation(origin, destination, originTime);
        if (flightList == null) {
            resultMap.put("msg", "查询失败");
            resultMap.put("code", 500);
        }
        resultMap.put("code", 200);
        resultMap.put("data", flightList);

        return resultMap;
    }

    // 添加航班
    @RequestMapping(value = "/addFlight", method = RequestMethod.POST)
    public String addFlight(Flight flight,
                            Map<String, Object> map) {
        Flight byFlightId = flightService.queryFlightById(flight.getFlightId());
        Flight byAirId = flightService.queryFlightByAirId(flight.getAirId());
        if (byFlightId != null) {
            map.put("mag", "航班编号已存在");
            return "adminflyInsert";
        }
        if (byAirId != null) {
            map.put("msg", "飞机编号已存在");
            return "adminflyInsert";
        } else {
            int result = flightService.addFlight(flight);
            if (result != 1) {
                map.put("code", 500);
                map.put("msg", "航班添加失败");
                return "adminflyInsert";
            }
            map.put("code", 200);
            map.put("msg", "航班添加成功");
            return "adminflyDesign";
        }


    }

    //    删除航班
    @RequestMapping(value = "/deleteFlightById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteFlightById(@RequestParam("flightId") String flightId) {
        Map<String, Object> map = new HashMap<String, Object>();
        int result = flightService.deleteFlight(Integer.parseInt(flightId));
        if (result != 1) {
            map.put("code", 500);
            map.put("msg", "删除失败");
            return map;
        }
        map.put("code", 200);
        map.put("msg", "删除成功");

        return map;

    }

    //    修改航班信息
    @RequestMapping(value = "/updateFlight", method = RequestMethod.POST)
    public String updateFlight(Flight flight, Map<String, Object> map) {
        int result = flightService.updateFlight(flight);
        if (result != 1) {
            map.put("code", 500);
            map.put("msg", "修改失败");
            return "adminflightupdate";
        }
        map.put("code", 200);
        map.put("msg", "修改成功");
        return "adminflyDesign";
    }

    //    显示所有航班列表
    @RequestMapping(value = "queryAllFlight", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> queryAllFlight(@RequestParam("pageNo") String pageNo, @RequestParam("pageSize") String pageSize) throws IOException {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String msg = "queryUsers success";
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

        List<Flight> flights = flightService.queryAllFlight(Integer.parseInt(pageNo) - 1, Integer.parseInt(pageSize));


        if (flights == null || flights.size() == 0) {
            resultMap.put("msg", "query fail");
            resultMap.put("code", 500);
        } else {
            resultMap.put("msg", "query success");
            resultMap.put("code", 200);
        }
        resultMap.put("data", flights);


        return resultMap;
    }

    //    根据flightId查询航班
    @RequestMapping(value = "queryFlightById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> queryFlightById(@RequestParam("flightId") String flightId,
                                               HttpServletRequest req){

        Flight flight = flightService.queryFlightById(Integer.parseInt(flightId));
        Map<String, Object> resultMap = new HashMap<String, Object>();

        resultMap.put("data", flight);
        String msg = "query success";
        String code = "200";
        if (flightId == null || flightId.equals("")) {
            msg = "参数错误";
            code = "500";
            resultMap.put("msg", msg);
            resultMap.put("code", code);
            return resultMap;
        }
        resultMap.put("msg", msg);
        resultMap.put("code", code);
        resultMap.put("user", flight);

        req.getSession().setAttribute("flight", flight);

        return resultMap;
    }

//    根据航班AirId查询航班信息
    @RequestMapping(value = "queryFlightByAirId",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> queryFlightByAirId(@RequestParam("airId")String airId,HttpServletRequest req){
        Flight flight = flightService.queryFlightByAirId(airId);
        Map<String, Object> resultMap = new HashMap<String, Object>();

        resultMap.put("data", flight);
        String msg = "query success";
        String code = "200";
        if (airId == null || airId.equals("")) {
            msg = "参数错误";
            code = "500";
            resultMap.put("msg", msg);
            resultMap.put("code", code);
            return resultMap;
        }
        resultMap.put("msg", msg);
        resultMap.put("code", code);
        resultMap.put("user",flight);

        req.getSession().setAttribute("flight", flight);

        return resultMap;
    }




}
