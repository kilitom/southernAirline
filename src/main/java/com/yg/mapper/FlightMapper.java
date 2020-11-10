package com.yg.mapper;

import com.yg.pojo.Flight;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/*航班*/
public interface FlightMapper {

//    增加一个航班
    int addFlight(@Param("flight") Flight flight);

//    删除航班信息
    int deleteFlight(@Param("flightId") int flightId);

//    更新航班信息
    int updateFlight(@Param("flight") Flight flight);

//    根据Id查询航班信息
    Flight queryFlightById(@Param("flightId") int flightId);

    //    查询所有航班信息
    List<Flight> queryAllFlight(@Param("pageNo") int pageNo,
                                @Param("pageSize") int pageSize);
//    根据出发地到达地出发时间模糊查询
    List<Flight> queryFlightInformation(@Param("origin") String origin,
                                        @Param("destination") String destination,
                                        @Param("originTime") Date originTime);

//    根据飞机编号查询
    Flight queryFlightByAirId(@Param("airId") String airId);
}
