package com.itmo.web.lab2.point;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class PointService implements Serializable {
    private final List<Point> pointList;

    public PointService() {
        this.pointList = new ArrayList<>();
    }
    public PointService(Point[] points) {
        this.pointList = Arrays.asList(points);
    }
    public PointService(List<Point> pointList) {
        this.pointList = pointList;
    }

    public List<Point> getPointList() {
        return pointList;
    }

}
