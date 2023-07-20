package com.poly.phucdhp.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.phucdhp.dao.AccountDAO;
import com.poly.phucdhp.entity.Account;

@Controller
public class RegisterController {
	private final AccountDAO accountDAO;

	@Autowired
	public RegisterController(AccountDAO accountDAO) {
		this.accountDAO = accountDAO;
	}

	@GetMapping("/user/registration")
	public String showRegistrationForm(ModelMap model) {
		model.addAttribute("account", new Account());
		return "user/registration";
	}

	@PostMapping("/user/registration")
	public String register(HttpServletRequest request, @ModelAttribute("account") Account account, ModelMap model,
			@RequestParam("file") MultipartFile file) {
		String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		String password = request.getParameter("password");
		String email = request.getParameter("email");

		account.setUsername(username);
		account.setFullname(fullname);
		account.setPassword(password);
		account.setEmail(email);

		if (file.isEmpty()) {
			model.addAttribute("message", "Vui lòng chọn file!");
		} else {
			try {
				String filename = file.getOriginalFilename();
				// Lưu file vào thư mục upload
				String uploadPath = "/images/"+filename; // Đường dẫn thư mục upload, thay thế bằng đường dẫn thực tế trên server của bạn
				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				File uploadedFile = new File(uploadPath + "/" + filename);
				file.transferTo(uploadedFile);
				account.setPhoto(filename);
			} catch (Exception e) {
				model.addAttribute("message", "Lỗi lưu file!");
			}
		}

		// Kiểm tra nếu giá trị 'photo' của đối tượng 'account' là null, gán giá trị mặc định
		if (account.getPhoto() == null) {
			account.setPhoto("unknown.jpg"); // Giá trị mặc định cho cột 'Photo'
		}

		// Lưu account vào cơ sở dữ liệu
		accountDAO.save(account);

		// Chuyển hướng sau khi đăng ký thành công
		return "redirect:/user/login"; // Điều hướng đến trang đăng nhập
	}
}
