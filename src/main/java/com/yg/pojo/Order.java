package com.yg.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Date;
import java.sql.Timestamp;

public class Order {

  private String orderId;
  private long userId;
  private String airId;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
  private Date originTime;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
  private Date destinationTime;
  private double price;
  private String state;

  public Order(String orderId, long userId, String airId, Date originTime, Date destinationTime, double price, String state) {
    this.orderId = orderId;
    this.userId = userId;
    this.airId = airId;
    this.originTime = originTime;
    this.destinationTime = destinationTime;
    this.price = price;
    this.state = state;
  }

  public Order() {
  }

  public String getOrderId() {
    return orderId;
  }

  public void setOrderId(String orderId) {
    this.orderId = orderId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public String getAirId() {
    return airId;
  }

  public void setAirId(String airId) {
    this.airId = airId;
  }


  public Date getOriginTime() {
    return originTime;
  }

  public void setOriginTime(Date originTime) {
    this.originTime = originTime;
  }


  public Date getDestinationTime() {
    return destinationTime;
  }

  public void setDestinationTime(Date destinationTime) {
    this.destinationTime = destinationTime;
  }


  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }


  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }

  @Override
  public String toString() {
    return "Order{" +
            "orderId='" + orderId + '\'' +
            ", userId=" + userId +
            ", airId='" + airId + '\'' +
            ", originTime=" + originTime +
            ", destinationTime=" + destinationTime +
            ", price=" + price +
            ", state='" + state + '\'' +
            '}';
  }
}
