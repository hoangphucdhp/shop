package com.poly.phucdhp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.phucdhp.entity.Account;
import com.poly.phucdhp.service.EmailService;
import com.poly.phucdhp.dao.AccountDAO;

@Controller
public class ForgotPasswordController {
	@Autowired
	private AccountDAO dao;
	@Autowired
	private EmailService emailService;

	@PostMapping("/user/forgotPassword")
	public String forgotPassword(@RequestParam("email") String email) {
	    // Tìm tài khoản với email tương ứng
	    Account account = dao.findByEmail(email);
	    if (account == null) {
	        // Xử lý khi không tìm thấy tài khoản
	        return "redirect:/user/forgotPassword?error=1";
	    }

	    // Gửi email chứa đường link để thay đổi mật khẩu
	    String resetLink = "http://localhost:8080/user/resetPassword?email=" + email;
	    emailService.sendResetPasswordEmail(email, resetLink);

	    // Xử lý khi gửi email thành công
	    return "redirect:/user/forgotPassword?success";
	}

	@PostMapping("/user/resetPassword")
	public String resetPassword(@RequestParam("email") String email,
	                            @RequestParam("newPassword") String newPassword,
	                            @RequestParam("confirmPassword") String confirmPassword) {
	    // Kiểm tra mật khẩu mới và xác nhận mật khẩu có khớp không
	    if (!newPassword.equals(confirmPassword)) {
	        // Xử lý khi mật khẩu không khớp
	        return "redirect:/user/resetPassword?email=" + email + "&error=1";
	    }

	    // Tìm tài khoản với email tương ứng
	    Account account = dao.findByEmail(email);
	    if (account == null) {
	        // Xử lý khi không tìm thấy tài khoản
	        return "redirect:/user/resetPassword?email=" + email + "&error=2";
	    }

	    // Cập nhật mật khẩu mới cho tài khoản
	    account.setPassword(newPassword);
	    dao.save(account);

	    // Xử lý khi đổi mật khẩu thành công
	    return "redirect:/user/login?success";
	}

	@RequestMapping("user/resetPassword")
	public String showResetPasswordForm(@RequestParam("email") String email, Model model) {
	    model.addAttribute("email", email);
	    return "user/resetPassword";
	}


	@RequestMapping("user/forgotPassword")
	public String showForgotPasswordForm(Model model) {
	    return "user/forgotPassword";
	}

}
