package com.poly.phucdhp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.phucdhp.dao.AccountDAO;
import com.poly.phucdhp.entity.Account;
import com.poly.phucdhp.service.SessionService;

@Controller
public class LoginController {
    private final AccountDAO accountDAO;
@Autowired
SessionService session;
    
    @Autowired
    public LoginController(AccountDAO accountDAO) {
        this.accountDAO = accountDAO;
    }

    @GetMapping("/user/login")
    public String showLoginForm() {
        return "user/login";
    }

    @PostMapping("/user/login")
    public String login(HttpServletRequest request, ModelMap model) {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    if (username != null) {
        // Kiểm tra đăng nhập
        Account account = accountDAO.findByUsernameAndPassword(username, password);
        System.out.println(username);
        if (account != null) {
            HttpSession session = request.getSession();
            session.setAttribute("account", account);

            if (account.isAdmin()) {
                // Nếu là admin, chuyển hướng đến trang admin
                return "redirect:/admin/index";
            } else {
                // Nếu không phải admin, chuyển hướng đến trang home
                session.setAttribute("username", account.getUsername()); // Lưu tên người dùng vào session
                return "redirect:/user/index";
            }
        }
    }

    model.addAttribute("error", "Invalid username or password");
    return "user/login";
    }


 
	/*
	 * @GetMapping("/admin/index") public String showAdminPage() { return
	 * "admin/index"; }
	 */

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("account");
        return "redirect:/user/login";
    }

}
