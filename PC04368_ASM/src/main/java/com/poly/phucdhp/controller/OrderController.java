package com.poly.phucdhp.controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.phucdhp.dao.OrderDAO;
import com.poly.phucdhp.entity.Order;
import com.poly.phucdhp.entity.OrderDetail;

@Controller
public class OrderController {
    @Autowired 
    OrderDAO dao;
    
    @RequestMapping("/order")
    public String index(Model model, HttpServletRequest request) {
        Order order = new Order();
        model.addAttribute("order", order);
        List<Order> orders = dao.findAll();
        model.addAttribute("orders", orders);

        //Trạng thái đơn hàng
        String orderIdParam = request.getParameter("orderId");
        String status = request.getParameter("status");

        if (orderIdParam != null) {
            try {
                Long orderId = Long.parseLong(orderIdParam);
                Optional<Order> optionalOrder = dao.findById(orderId);
				/*
				 * Optional là một lớp trong Java được sử dụng để bao bọc một giá trị có thể
				 * null. Nó cung cấp các phương thức để kiểm tra và truy xuất giá trị bên trong
				 * một cách an toàn mà không gây ra lỗi NullPointerException.
				 */
                if (optionalOrder.isPresent()) {
					/*
					 * Nếu đơn hàng tồn tại (được tìm thấy), 
					 * đoạn mã existingOrder.setStatus(status)
					 * sẽ cập nhật trạng thái của đơn hàng thành giá trị status từ request
					 */
                    Order existingOrder = optionalOrder.get();
					/*
					 * optionalOrder.get() được gọi để lấy giá trị đơn hàng từ Optional object. Nếu
					 * đơn hàng tồn tại, giá trị đơn hàng sẽ được trả về và gán cho biến
					 * existingOrder kiểu Order.
					 */
                    existingOrder.setStatus(status);
                    dao.save(existingOrder);
                }
            } catch (NumberFormatException e) {
                // Xử lý ngoại lệ khi không thể chuyển đổi orderId thành số nguyên
                // ...
            }
        } else {
            // Xử lý khi orderId là null
            // ...
        }
        
        
        
        model.addAttribute("order", order);
        List<Order> orders1 = dao.findAll();
        model.addAttribute("orders", orders);

        return "admin/order";
    }

    
    @RequestMapping("/order/{id}")
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
        
        return "admin/detail";
    }
    
   



    
    
}
