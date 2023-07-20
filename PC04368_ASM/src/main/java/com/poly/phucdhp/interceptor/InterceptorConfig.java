package com.poly.phucdhp.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    @Autowired
    AuthInterceptor interceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(interceptor)
                .addPathPatterns("/admin/**") // Kiểm tra xác thực cho các URL bắt đầu bằng "/admin/"
                //.addPathPatterns("/user/**") // Kiểm tra xác thực cho URL "/user/index"
                //.addPathPatterns("**/product/**")
                
                .excludePathPatterns("/user/login") // Loại trừ URL "/user/login" khỏi việc kiểm tra xác thực
                .excludePathPatterns("/user/login/*"); // Loại trừ tất cả các URL con của "/user/login" khỏi việc kiểm tra xác thực
    }
}


