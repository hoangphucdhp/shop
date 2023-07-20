package com.poly.phucdhp.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poly.phucdhp.dao.CategoryDAO;
import com.poly.phucdhp.dao.ProductDAO;
import com.poly.phucdhp.entity.Category;
import com.poly.phucdhp.entity.Product;
import com.poly.phucdhp.service.SessionService;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
@Controller

public class HomeController {
	@Autowired
	CategoryDAO categorydao;
	@Autowired
	ProductDAO productdao;
	
	@Autowired
	SessionService session;
	
	
	@GetMapping("/user/index")
	public String list(Model model) {
	    List<Product> items = productdao.findAll();
	    model.addAttribute("items", items);
	    List<Category> categories = categorydao.findAll();
	    model.addAttribute("categories", categories);
	    return "user/index";
	}
	
	@RequestMapping("/category/{id}")
	public String filterProductsByCategory(@PathVariable("id") String categoryId,
	                                       @RequestParam("p") Optional<Integer> p,
	                                       @RequestParam("field") Optional<String> field,
	                                       HttpSession session,
	                                       Model model) {
	    Category category = categorydao.findById(categoryId).orElse(null);
	    if (category != null) {
	        String savedKeyword = (String) session.getAttribute("keywords");
	        Pageable pageable = PageRequest.of(p.orElse(0), 6, Sort.Direction.DESC, field.orElse("price"));
	        Page<Product> page;
	        if (savedKeyword != null && !savedKeyword.isEmpty()) {
	            page = productdao.findByCategoryAndNameContaining(category, savedKeyword, pageable);
	        } else {
	            page = productdao.findByCategory(category, pageable);
	        }
	        model.addAttribute("page", page);
	        model.addAttribute("products", page.getContent());
	        model.addAttribute("field", field.orElse("price").toUpperCase());
	    }
	    return "user/shop";
	}


}
