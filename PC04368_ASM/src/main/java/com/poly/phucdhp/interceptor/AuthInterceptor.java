package com.poly.phucdhp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.poly.phucdhp.entity.Account;
import com.poly.phucdhp.service.SessionService;
@Service
public class AuthInterceptor implements HandlerInterceptor{
@Autowired
SessionService session;
	
@Override
public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
    String uri = req.getRequestURI();
    Account user = (Account) session.get("account");
    String error = "";

    if (user == null) {
        error = "Please login";
    } else if (!user.isAdmin() && uri.startsWith("/admin/")) {
        error = "Access denied";
    }
    
    
   
    if (error.length() > 0) {
        session.set("security", uri);
        resp.sendRedirect("/user/login?error=" + error);
        return false; // Ngừng xử lý các interceptor và controller khác
    }

    return true;
}

}
