package com.srp.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface FileService {
    void downloadFile(String path, HttpServletRequest request, HttpServletResponse response);
}
