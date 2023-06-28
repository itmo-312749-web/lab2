package com.itmo.web.lab2.validation;

import com.itmo.web.lab2.validation.HttpRequestValidator;
import jakarta.servlet.http.HttpServletRequest;

import java.util.Arrays;

public class UserDataValidator extends HttpRequestValidator {

    private Double x;
    private Double y;
    private Double r;

    public UserDataValidator(HttpServletRequest request) {
        super(request);
        setXFromRequest();
        setYFromRequest();
        setRFromRequest();
    }

    private void setXFromRequest() {
        x = (Double) request.getAttribute("doubleX");
    }

    private void setYFromRequest() {
        y = (Double) request.getAttribute("doubleY");
    }

    private void setRFromRequest() {
        r = (Double) request.getAttribute("doubleR");
    }

    private boolean isXValid() {
        double[] validValues = new double[]{-2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2};
        return Arrays.stream(validValues)
                .anyMatch(num -> num == x);
    }

    private boolean isYValid() {
        return -5 <= y && y <= 5;
    }

    private boolean isRValid() {
        double[] validValues = new double[]{1, 2, 3, 4, 5};
        return Arrays.stream(validValues)
                .anyMatch(num -> num == r);
    }

    @Override
    public boolean isValid() {
        return isXValid() && isYValid() && isRValid();
    }
}
