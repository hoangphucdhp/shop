package com.poly.phucdhp.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.phucdhp.dao.AccountDAO;
import com.poly.phucdhp.entity.Account;
import com.poly.phucdhp.entity.Product;
import com.poly.phucdhp.service.ParamService;

import javax.servlet.ServletContext;
@Controller
public class AccountController {
	@Autowired
	ServletContext app;
	@Autowired
	AccountDAO dao;
	@Autowired
	ParamService paramService;
	
	 @RequestMapping("admin/accounts") 
	public String index(Model model, Optional<Integer> p) {
		Account account = new Account();
		model.addAttribute("account", account);
		List<Account> accounts = dao.findAll();
		model.addAttribute("accounts", accounts);
		
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
        Page<Account> page = dao.findAll(pageable);
        model.addAttribute("page", page);
		return "admin/accounts";
	}
	
	 @RequestMapping("/account/edit/{id}") 
	 public String edit(@PathVariable("id") String id, Model model) { 
	Account account = dao.findById(id).orElse(new Account());
	  model.addAttribute("account", account); 
	  List<Account> accounts =dao.findAll(); 
	  model.addAttribute("accounts", accounts);
	  return "/admin/accounts"; 
	  }
	  
	 @PostMapping("/account/create")
	 public String create(Account account, ModelMap model, @ModelAttribute Account image,
	                      @RequestParam("file") MultipartFile file) {
		 if (account.getUsername() == null || account.getUsername().isEmpty()) {
		        model.addAttribute("message", "Vui lòng nhập fullname!");
		        return "admin/accounts"; 
		    }
		 if (account.getFullname() == null || account.getFullname().isEmpty()) {
		        model.addAttribute("message", "Vui lòng nhập fullname!");
		        return "admin/accounts"; 
		    }
		 
		 if (account.getPassword() == null ) {
		        model.addAttribute("message", "Vui lòng nhập password!");
		        return "admin/accounts"; 
		    }
		 
		 if (account.getEmail() == null ) {
		        model.addAttribute("message", "Vui lòng nhập email!");
		        return "admin/accounts"; 
		    }
		 

		 if(file.isEmpty()){
				model.addAttribute("message", "Vui lòng chọn file !");
			}
			else{
				try {
					String filename = file.getOriginalFilename();
					//String path = app.getRealPath("/images/"+filename);
					File files = new File(app.getRealPath("/images/"+filename));
					file.transferTo(files);
					model.addAttribute("name", file.getOriginalFilename());
					model.addAttribute("type", file.getContentType());
					model.addAttribute("size", file.getSize());
					image.setPhoto(filename);
				} 
				catch (Exception e) {
					model.addAttribute("message", "Lỗi lưu file !");
				}
			}

	     // Kiểm tra nếu giá trị 'photo' của đối tượng 'image' là null, gán giá trị mặc định
	     if (image.getPhoto() == null) {
	         image.setPhoto("unknown.jpg"); // Giá trị mặc định cho cột 'Photo'
	     }

	     dao.save(account);
	     return "redirect:/admin/accounts";
	 }

	  
	  @PostMapping("/account/update") 
	  public String update(Account account) {
	  	  
	  dao.save(account); 
	  return "redirect:/admin/accounts"+account.getUsername(); }
	  
	  @GetMapping("/account/delete/{id}") public String delete(@PathVariable("id")
	  String id) { dao.deleteById(id); return "redirect:/admin/accounts"; }
	 
	  
	 

	   
}
