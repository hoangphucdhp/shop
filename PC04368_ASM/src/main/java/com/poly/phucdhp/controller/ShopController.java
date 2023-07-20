package com.poly.phucdhp.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.phucdhp.dao.ProductDAO;
import com.poly.phucdhp.entity.Product;
import com.poly.phucdhp.service.SessionService;

@Controller
public class ShopController {
	@Autowired
	SessionService session;
	@Autowired
	ProductDAO dao;

	
	
	@GetMapping("/user/shop")
	public String list(Model model,
	                   @RequestParam("name") Optional<String> name,
	                   @RequestParam("p") Optional<Integer> p,
	                   @RequestParam("field") Optional<String> field,
	                   HttpSession session) {
	    Product product = new Product();
	    model.addAttribute("product", product);

	    String keyword = name.orElse("");
	    if (!keyword.isEmpty()) {
	        session.setAttribute("keywords", keyword);
	    } else {
	        session.removeAttribute("keywords");
	    }

	    String savedKeyword = (String) session.getAttribute("keywords");
	    if (savedKeyword == null) {
	        savedKeyword = "";
	    }

	    List<Product> products;
	    if (!savedKeyword.isEmpty()) {
	        products = dao.findByKeywordName("%" + savedKeyword + "%");
	    } else {
	        products = dao.findAll();
	    }
	    model.addAttribute("products", products);

	    Pageable pageable = PageRequest.of(p.orElse(0), 6, Sort.Direction.DESC, field.orElse("price"));
	    Page<Product> page = dao.findByKeywords("%" + savedKeyword + "%", pageable);
	    model.addAttribute("page", page);

	    model.addAttribute("field", field.orElse("price").toUpperCase());

	    List<Product> items = page.getContent();
	    model.addAttribute("items", items);

	    return "user/shop";
	}


	
	//----------Sắp xếp-------------------------------
	
	 
}
