package com.poly.phucdhp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.phucdhp.dao.CategoryDAO;
import com.poly.phucdhp.entity.Category;
import com.poly.phucdhp.service.ParamService;


@Controller
public class CategoryController {
	@Autowired
	CategoryDAO dao;
	@Autowired
	ParamService paramService;
	
	@RequestMapping("/admin/categories")
	public String index(Model model) {
		Category category = new Category();
		model.addAttribute("category", category);
		List<Category> categories = dao.findAll();
		model.addAttribute("categories", categories);
		return "/admin/categories";
	}
	@RequestMapping("/category/edit/{id}")
	public String edit(@PathVariable("id") String id, Model model) {
		Category category = dao.findById(id).get();
		model.addAttribute("category", category);
		List<Category> categories = dao.findAll();
		model.addAttribute("categories", categories);
		return "/admin/categories";
	}
	@PostMapping("/category/create")
	public String create(@Validated @ModelAttribute("category") Category category, BindingResult bindingResult, Model model) {
		if (category.getId() == null || category.getId().isEmpty()) {
	        model.addAttribute("message", "Vui lòng nhập mã loại!");
	        return "admin/categories"; 
	    }
		if (category.getName() == null || category.getName().isEmpty()) {
	        model.addAttribute("message", "Vui lòng nhập tên loại!");
	        return "admin/categories"; 
	    }
		dao.save(category);
		return "redirect:/admin/categories";
	}
	@PostMapping("/category/update")
	public String update(Category category) {
		dao.save(category);
		return "redirect:/admin/categories"+category.getId();
	}
	@GetMapping("/category/delete/{id}")
	public String delete(@PathVariable("id") String id) {
		dao.deleteById(id);
		return "redirect:/admin/categories";
	}
}
