package com.poly.phucdhp.controller;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.phucdhp.dao.AccountDAO;
import com.poly.phucdhp.dao.OrderDAO;
/*import com.poly.phucdhp.service.OrderDetailService;
import com.poly.phucdhp.service.OrderService;*/
import com.poly.phucdhp.service.ParamService;
import com.poly.phucdhp.service.ShoppingCartService;

import com.poly.phucdhp.entity.*;
import com.poly.phucdhp.dao.OrderDetailDAO;


@Controller
public class ShoppingCartController {
	@Autowired
	ShoppingCartService cart;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	OrderDetailDAO orderDetailDAO;
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	ParamService param;
	/*
	 * @Autowired OrderService orderService;
	 */

	/*
	 * @Autowired OrderDetailService orderDetailService;
	 */
	@RequestMapping("/user/cart")
	public String view(Model model) {
		model.addAttribute("cart", cart);

		if (cart.isEmpty()) {
	        model.addAttribute("emptyCartMessage", "Bạn chưa thêm sản phẩm nào vào giỏ hàng.");
	    }
		
		// Lấy số lượng sản phẩm trong giỏ hàng và gán vào attribute "cartSize"
		 int cartSize = cart.getCartSize();
		    model.addAttribute("cartSize", cartSize);
		
		return "user/cart";
	}

@RequestMapping("/cart/add/{id}")
public String add(@PathVariable("id") Integer id) {
	cart.add(id);
	return "redirect:/user/cart";
}

@RequestMapping("/cart/remove/{id}")
public String remove(@PathVariable("id") Integer id) {
	cart.remove(id);
	return "redirect:/user/cart";
}
@RequestMapping("/cart/update")
public String update() {
	Integer id = param.getInt("id", 0);
	int qty = param.getInt("qty", 0);
	cart.update(id, qty);
	return "redirect:/user/cart";
}

@RequestMapping("/cart/clear")
public String clear() {
	cart.clear();
	return "redirect:/user/cart";
}




@Transactional
@PostMapping("/checkout")
public String checkout(@ModelAttribute("order") Order order, Model model, HttpServletRequest request, @RequestParam("address") String address) {

    List<CartItem> cartItems = cart.getCartItems();
    cartItems = new ArrayList<>(cart.getCartItems());

    // Lấy tài khoản người dùng từ session
    HttpSession session = request.getSession();
    String username = (String) session.getAttribute("username");

    // Kiểm tra xem người dùng đã đăng nhập hay chưa
    if (username == null) {
        // Chuyển hướng người dùng đến trang đăng nhập
        return "redirect:/user/login?message=notloggedin";
    }

    // Kiểm tra giỏ hàng có rỗng hay không
    if (cart == null || cart.isEmpty()) {
        // Chuyển hướng người dùng đến trang giỏ hàng và truyền thông báo giỏ hàng trống
        return "redirect:/user/cart?message=empty";
    }

    // Lấy tài khoản từ cơ sở dữ liệu
    Account account = accountDAO.findByUsername(username);

    order.setAccount(account);
    order.setStatus("Đang xử lý");
    System.out.println(cartItems);
    // Create order details
    List<OrderDetail> orderDetails = new ArrayList<>();
    for (CartItem cartItem : cartItems) {
        // Kiểm tra giá trị Price không phải null trước khi tạo OrderDetail
        if (cartItem.getProduct().getPrice() != null) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrder(order);
            orderDetail.setProduct(cartItem.getProduct());
            orderDetail.setPrice(cartItem.getProduct().getPrice());
            orderDetail.setQuantity(cartItem.getQuantity());
            orderDetails.add(orderDetail);
        }
    }

    // Set the order details for the order
    order.setOrderDetails(orderDetails);

    // Save the order and order details to the database
 // Save the order and order details to the database
    orderDAO.save(order);


    // Xóa giỏ hàng sau khi thanh toán thành công
    cart.clear();

    // Chuyển hướng người dùng đến trang xác nhận đơn hàng hoặc thông báo thành công
    return "redirect:/user/cart";
}



}

