package com.itmo.web.lab2;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class PointService implements Serializable {
    private final List<PointBean> pointBeanList;

    public PointService() {
        this.pointBeanList = new ArrayList<>();
    }
    public PointService(PointBean[] pointBeans) {
        this.pointBeanList = Arrays.asList(pointBeans);
    }
    public PointService(List<PointBean> pointBeanList) {
        this.pointBeanList = pointBeanList;
    }

    public List<PointBean> getPointBeanList() {
        return pointBeanList;
    }

}
