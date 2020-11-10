package com.yg.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Date;
import java.sql.Timestamp;

public class Flight {

  private int flightId;
  private String origin;
  private String destination;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
  private Date originTime;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
  private Date destinationTime;
  private double price;
  private String airId;

  public Flight(int flightId, String origin, String destination, Date originTime, Date destinationTime, double price, String airId) {
    this.flightId = flightId;
    this.origin = origin;
    this.destination = destination;
    this.originTime = originTime;
    this.destinationTime = destinationTime;
    this.price = price;
    this.airId = airId;
  }

  public Flight() {
  }

  public int getFlightId() {
    return flightId;
  }

  public void setFlightId(int flightId) {
    this.flightId = flightId;
  }


  public String getOrigin() {
    return origin;
  }

  public void setOrigin(String origin) {
    this.origin = origin;
  }


  public String getDestination() {
    return destination;
  }

  public void setDestination(String destination) {
    this.destination = destination;
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


  public String getAirId() {
    return airId;
  }

  public void setAirId(String airId) {
    this.airId = airId;
  }

  @Override
  public String toString() {
    return "Flight{" +
            "flightId=" + flightId +
            ", origin='" + origin + '\'' +
            ", destination='" + destination + '\'' +
            ", originTime=" + originTime +
            ", destinationTime=" + destinationTime +
            ", price=" + price +
            ", airId='" + airId + '\'' +
            '}';
  }
}
