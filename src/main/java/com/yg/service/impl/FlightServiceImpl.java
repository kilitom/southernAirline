package com.yg.service.impl;

import com.yg.mapper.FlightMapper;
import com.yg.pojo.Flight;
import com.yg.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FlightServiceImpl implements FlightService {
    @Autowired
    private FlightMapper flightMapper;

    public void setFlightMapper(FlightMapper flightMapper) {
        this.flightMapper = flightMapper;
    }
//    添加航班
    public int addFlight(Flight flight) {
        return flightMapper.addFlight(flight);
    }
//  删除航班
    public int deleteFlight(int flightId) {
        return flightMapper.deleteFlight(flightId);
    }
//  更新航班
    public int updateFlight(Flight flight) {
        return flightMapper.updateFlight(flight);
    }
//  通过ID查询航班
    public Flight queryFlightById(int flightId) {
        return flightMapper.queryFlightById(flightId);
    }
//  查询所有航班
    public List<Flight> queryAllFlight(int pageNo,int pageSize) {
        return flightMapper.queryAllFlight(pageNo,pageSize);
    }
//  根据出发地到达地出发时间模糊查询
    public List<Flight> queryFlightInformation(String origin, String destination, Date originTime) {
        return flightMapper.queryFlightInformation(origin, destination, originTime);
    }
//  根据飞机编号查询
    public Flight queryFlightByAirId(String airId){return flightMapper.queryFlightByAirId(airId); }
}
