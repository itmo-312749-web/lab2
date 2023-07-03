package com.itmo.web.lab2;

import com.itmo.web.lab2.check.AbstractChecker;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.io.IOException;

@WebServlet(name = "areaCheck", value = "/area-check")
public class AreaCheckServlet extends HttpServlet {

    private List<AbstractChecker> checkerList;

    @Override
    public void init() throws ServletException {
        checkerList = Arrays.asList(
                new AbstractChecker() {
                    @Override
                    public boolean makeCheck(double x, double y, double r) {
                        return 0 <= x && 0 <= y && (x * x) + (y * y) <= (r * r);
                    }
                },
                new AbstractChecker() {
                    @Override
                    public boolean makeCheck(double x, double y, double r) {
                        return -r <= x && 0 <= y  && x <= 0 && y <= r;
                    }
                },
                new AbstractChecker() {
                    @Override
                    public boolean makeCheck(double x, double y, double r) {
                        return x <= 0 && y <= 0 && (-x - (r/2)) <= y;
                    }
                }
        );
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        double x = (Double) request.getAttribute("doubleX");
        double y = (Double) request.getAttribute("doubleY");
        double r = (Double) request.getAttribute("doubleR");
        boolean isPointInsideArea = checkerList.stream()
                .anyMatch(checker -> checker.makeCheck(x, y, r));

        request.setAttribute("isPointInsideArea", isPointInsideArea);

    }
}
