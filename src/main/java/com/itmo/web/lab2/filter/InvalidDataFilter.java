package com.itmo.web.lab2.filter;

import com.itmo.web.lab2.validation.HttpRequestValidator;
import com.itmo.web.lab2.validation.UserDataValidator;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

public class InvalidDataFilter implements Filter {
    @Override
    public void doFilter(
            ServletRequest request,
            ServletResponse response,
            FilterChain chain
    ) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;

        if (httpRequest.getMethod().equals("POST")) {
            HttpRequestValidator dataValidator = new UserDataValidator(httpRequest);
            if (!dataValidator.isValid())
                httpRequest.getRequestDispatcher("/errors/invalidParameters.jsp").forward(request, response);
        }

        chain.doFilter(request, response);
    }
}
