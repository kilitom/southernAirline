package com.yg.service;

import com.yg.pojo.Flight;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.List;
import java.util.Map;


public interface FlightService {
    //    增加一个航班
    int addFlight(Flight flight);

    //    删除航班信息
    int deleteFlight(int flightId);

    //    更新航班信息
    int updateFlight(Flight flight);

    //    根据Id查询航班信息
    Flight queryFlightById(int flightId);

    //    查询所有航班信息
    List<Flight> queryAllFlight(@Param("pageNo") int pageNo, @Param("pageSize") int pageSize);

    //    根据出发地到达地出发时间模糊查询
    List<Flight> queryFlightInformation(@Param("origin") String origin, @Param("destination") String destination, @Param("originTime") Date originTime);
   //   根据飞机编号查询
    Flight queryFlightByAirId(String airId);
}
