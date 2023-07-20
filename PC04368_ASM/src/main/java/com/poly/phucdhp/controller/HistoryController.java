package com.poly.phucdhp.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.phucdhp.dao.OrderDAO;
import com.poly.phucdhp.entity.Order;
import com.poly.phucdhp.entity.OrderDetail;
@Controller
public class HistoryController {
	@Autowired
	OrderDAO dao;
	
	 @RequestMapping("/order/history")
	    public String orderHistory(Model model, HttpServletRequest request) {
	        HttpSession session = request.getSession();
	        String username = (String) session.getAttribute("username");

	        if (username != null) {
	            // Lấy danh sách đơn hàng của người dùng
	            List<Order> orders2 = dao.findByAccount_Username(username);
	            model.addAttribute("orders", orders2);
	        }

	        return "user/history"; // Chỉ định tên trang hiển thị lịch sử mua hàng
	    }
	 
	 @RequestMapping("/history/{id}")
	    public String viewOrderDetails(@PathVariable("id") Long orderId, Model model) {
	        Optional<Order> optionalOrder = dao.findById(orderId);
	        if (optionalOrder.isEmpty()) {
	            // Handle when order is not found
	            return "redirect:/order";
	        }
	        Order order = optionalOrder.get();
	        List<OrderDetail> orderDetails = order.getOrderDetails();
	        model.addAttribute("order", order);
	        model.addAttribute("orderDetails", orderDetails);
	        
	        return "user/historyDetail";
	    }
}
