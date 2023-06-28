package com.itmo.web.lab2.validation;

import jakarta.servlet.http.HttpServletRequest;

public abstract class HttpRequestValidator {

    protected HttpServletRequest request;

    protected HttpRequestValidator(HttpServletRequest request) {
        this.request = request;
    }

    public abstract boolean isValid();
}
