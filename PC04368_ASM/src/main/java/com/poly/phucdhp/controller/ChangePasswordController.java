package com.poly.phucdhp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.phucdhp.dao.AccountDAO;
import com.poly.phucdhp.entity.Account;

@Controller
public class ChangePasswordController {

    @Autowired
    private AccountDAO accountDAO;

    @GetMapping("/user/changePassword")
    public String showChangePasswordForm() {
        return "user/changePassword";
    }

    @PostMapping("/user/changePassword")
    public String changePassword(HttpServletRequest request, ModelMap model) {
        String username = request.getParameter("username");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Kiểm tra và xử lý thay đổi mật khẩu
        Account account = accountDAO.findByUsername(username);

        if (account != null && account.getPassword().equals(currentPassword)) {
            if (newPassword.equals(confirmPassword)) {
                account.setPassword(newPassword);
                accountDAO.save(account);
                return "redirect:/user/login?passwordChanged=true";
            } else {
                model.addAttribute("error", "New password and confirm password do not match.");
            }
        } else {
            model.addAttribute("error", "Invalid username or current password.");
        }

        return "user/changePassword";
    }
}
