package com.poly.phucdhp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.phucdhp.dao.ProductDAO;
import com.poly.phucdhp.entity.Report;
@Controller
public class ReportController {
	
	@Autowired
	ProductDAO dao;
	@RequestMapping("/admin/reports")
	public String inventory(Model model) {
		List<Report> items = dao.getInventoryByCategory();
		model.addAttribute("items", items);
		return "admin/reports";
	}
}
