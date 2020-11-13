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
  private String username;
  private String uid;



  public Order(String orderId, long userId, String airId, Date originTime, Date destinationTime, double price, String state,String username,String uid) {
    this.orderId = orderId;
    this.userId = userId;
    this.airId = airId;
    this.originTime = originTime;
    this.destinationTime = destinationTime;
    this.price = price;
    this.state = state;
    this.username = username;
    this.uid = uid;
  }

  public Order() {
  }
  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getUid() {
    return uid;
  }

  public void setUid(String uid) {
    this.uid = uid;
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
