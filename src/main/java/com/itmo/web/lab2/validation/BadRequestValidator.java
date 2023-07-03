package com.itmo.web.lab2.validation;

import jakarta.servlet.http.HttpServletRequest;

public class BadRequestValidator extends HttpRequestValidator{

    public BadRequestValidator(HttpServletRequest request) {
        super(request);
    }

    @Override
    public boolean isValid() {
        String strX = request.getParameter("x");
        boolean isXValid = true;
        try {
            Double x = Double.parseDouble(strX);
            request.setAttribute("doubleX", x);
        } catch (NumberFormatException | NullPointerException e) {
            isXValid = false;
        }

        String strY = request.getParameter("y");
        boolean isYValid = true;
        try {
            Double y = Double.parseDouble(strY);
            request.setAttribute("doubleY", y);
        } catch (NumberFormatException | NullPointerException e) {
            isYValid = false;
        }

        String strR = request.getParameter("r");
        boolean isRValid = true;
        try {
            Double r = Double.parseDouble(strR);
            request.setAttribute("doubleR", r);
        } catch (NumberFormatException | NullPointerException e) {
            isRValid = false;
        }

        return isXValid && isYValid && isRValid ;
    }
}
