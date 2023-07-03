package com.itmo.web.lab2;

import com.itmo.web.lab2.point.Point;
import com.itmo.web.lab2.point.PointService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

@WebServlet(name = "controller", value = "/controller")
public class ControllerServlet extends HttpServlet {

    private final String pointServiceAttrName = "pointService";

    private void setSessionScopedPointService(
            HttpServletRequest request
    ) {
        request.getSession().setAttribute(
                pointServiceAttrName,
                new PointService()
        );
    }

    private void setSessionScopedPointServiceIfNotExists(
            HttpServletRequest request
    ) {
        if (request.getSession().getAttribute(pointServiceAttrName) == null)
            setSessionScopedPointService(request);
    }

    private PointService getSessionScopedPointService(
            HttpServletRequest request
    ) {
        return (PointService) request.getSession().getAttribute(pointServiceAttrName);
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        setSessionScopedPointServiceIfNotExists(request);
        ServletContext servletContext = getServletContext();

        servletContext
                .getRequestDispatcher("/results.jsp")
                .include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        setSessionScopedPointServiceIfNotExists(request);
        ServletContext servletContext = getServletContext();

        PointService pointService = getSessionScopedPointService(request);

        double x = Double.parseDouble(request.getParameter("x"));
        double y = Double.parseDouble(request.getParameter("y"));
        double r = Double.parseDouble(request.getParameter("r"));
        Point point = new Point(x, y, r);

        servletContext
                .getRequestDispatcher("/area-check")
                .include(request, response);

        long startComputeTime = System.nanoTime();

        point.setHit((boolean) request.getAttribute("isPointInsideArea"));
        point.setTimestamp(LocalDateTime.now());
        point.setExecutionTime(System.nanoTime() - startComputeTime);

        pointService.getPointList().add(point);

        servletContext
                .getRequestDispatcher("/results.jsp")
                .forward(request, response);
    }



    @Override
    protected void service(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        String method = request.getMethod();
        if (method.equals("GET")) {
            doGet(request, response);
        } else if (method.equals("POST")) {
            doPost(request, response);
        } else {
            PrintWriter out = response.getWriter();
            out.println("<h1>Method not allowed</h1>");
        }
    }
}
