package com.itmo.web.lab2.filter;

import com.itmo.web.lab2.validation.BadRequestValidator;
import com.itmo.web.lab2.validation.HttpRequestValidator;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

public class BadRequestFilter implements Filter {

    @Override
    public void doFilter(
            ServletRequest request,
            ServletResponse response,
            FilterChain chain
    ) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;

        if (httpRequest.getMethod().equals("POST")) {
            HttpRequestValidator requestValidator = new BadRequestValidator(httpRequest);
            if (!requestValidator.isValid()) {
                httpRequest.getRequestDispatcher("/errors/badRequest.jsp").forward(httpRequest, response);
                return;
            }
        }

        chain.doFilter(request, response);
    }
}
