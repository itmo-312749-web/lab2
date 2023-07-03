package com.itmo.web.lab2.point;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Point implements Serializable {
    private double x;
    private double y;
    private double r;
    private boolean hit;
    private long executionTime; //in nanoseconds
    private LocalDateTime timestamp;

    public Point() {}

    public Point(double x, double y, double r) {
        this.x = x;
        this.y = y;
        this.r = r;
    }

    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public double getR() {
        return r;
    }

    public void setR(double r) {
        this.r = r;
    }

    public boolean isHit() {
        return hit;
    }

    public void setHit(boolean hit) {
        this.hit = hit;
    }

    public long getExecutionTime() {
        return executionTime;
    }

    public void setExecutionTime(long executionTime) {
        this.executionTime = executionTime;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public String getHumanReadableTimestamp() {
        String pattern = "hh:mm:ss dd.MM.yyyy";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        return timestamp.format(formatter);
    }

    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }

    @Override
    public String toString() {
        return "Dot{" +
                "x=" + x +
                ", y=" + y +
                ", r=" + r +
                ", hit=" + hit +
                ", executionTime=" + executionTime +
                ", timestamp=" + timestamp +
                '}';
    }
}
