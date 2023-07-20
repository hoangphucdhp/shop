package com.poly.phucdhp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.phucdhp.dao.ProductDAO;
import com.poly.phucdhp.entity.Product;

import com.poly.phucdhp.service.*;
@Controller
public class AdminController {
	@Autowired
	ProductDAO dao;
	 @Autowired
	 SessionService sessionService;
	    
	@RequestMapping("/admin/index")
    public String productStats(Model model) {
        int count = dao.getProductCount();
        List<Product> products = dao.findTop10ProductsByDate();
        model.addAttribute("count", count);
        model.addAttribute("products", products);
        
		/*
		 * String username = sessionService.get("username");
		 * model.addAttribute("username", username);
		 */
        return "admin/index";
    }
	
	

}
