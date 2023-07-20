package com.poly.phucdhp.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.format.annotation.DateTimeFormat;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;


import com.poly.phucdhp.dao.CategoryDAO;
import com.poly.phucdhp.dao.OrderDetailDAO;
import com.poly.phucdhp.dao.ProductDAO;
import com.poly.phucdhp.entity.Account;
import com.poly.phucdhp.entity.Category;
import com.poly.phucdhp.entity.OrderDetail;
import com.poly.phucdhp.entity.Product;
import com.poly.phucdhp.entity.Report;
import com.poly.phucdhp.service.ParamService;
import com.poly.phucdhp.service.SessionService;

@Controller
public class ProductController {

	@Autowired
	ServletContext app;
	@Autowired
	ProductDAO dao;
	@Autowired
	SessionService session;
	@Autowired
	CategoryDAO categorydao;
	@Autowired
	OrderDetailDAO orderdao;
	@Autowired
	ParamService paramService;
	
	
	@Autowired
	public ProductController(ProductDAO dao) {
	    this.dao = dao;
	}
	@RequestMapping("admin/products")
	public String index(Model model, 
	        @RequestParam("name") Optional<String> name,
	        @RequestParam("p") Optional<Integer> p,
	        HttpSession session) {
	    Product product = new Product();
	    model.addAttribute("product", product);
	    
	    String keywords = name.orElse("");
	    if (!keywords.isEmpty()) {
	        session.setAttribute("keywords", keywords);
	    } else {
	        session.removeAttribute("keywords");
	    }
	    
	    String savedKeyword = (String) session.getAttribute("keywords");
	    if (savedKeyword == null) {
	        savedKeyword = "";
	    }
	    
	    List<Product> products;
	    if (!savedKeyword.isEmpty()) {
	        products = dao.findByKeywords("%" + savedKeyword + "%", Pageable.unpaged()).getContent();
	    } else {
	        products = dao.findAll();
	    }
	    model.addAttribute("products", products);
	    
	    List<Category> categories = categorydao.findAll();
	    model.addAttribute("categories", categories);
	    
	    Pageable pageable = PageRequest.of(p.orElse(0), 5);
	    Page<Product> page = dao.findByKeywords("%"+savedKeyword+"%", pageable);
	    model.addAttribute("page", page);
	    
	    return "admin/products";
	}


	
	

	@RequestMapping("/product/edit/{id}")
	public String edit(@PathVariable("id") Integer id, Model model) {
		Product product = dao.findById(id).orElse(new Product());
		model.addAttribute("product", product);
		List<Product> products = dao.findAll();
		model.addAttribute("products", products);
		List<Category> categories = categorydao.findAll();
		model.addAttribute("categories", categories);
		
		 // Truyền tên hình hiện tại của sản phẩm đến view
	    model.addAttribute("currentImage", product.getImage());
		return "/admin/products";
	}

	@PostMapping("/product/create")
	public String createProduct(Product product, ModelMap model, @ModelAttribute Product image,
            @RequestParam("file") MultipartFile file) {
		
		
		
		if (product.getName() == null || product.getName().isEmpty()) {
	        model.addAttribute("message", "Vui lòng nhập tên sản phẩm!");
	        return "admin/products"; 
	    }

	    if (product.getPrice() == null) {
	        model.addAttribute("message", "Vui lòng nhập giá sản phẩm!");
	        return "admin/products"; 
	    }
	    if (file.isEmpty()) {
	        model.addAttribute("message", "Vui lòng chọn file hình ảnh!");
	        return "admin/products"; 
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
		image.setImage(filename);
	} 
	catch (Exception e) {
		model.addAttribute("message", "Lỗi lưu file !");
	}
}

// Kiểm tra nếu giá trị 'photo' của đối tượng 'image' là null, gán giá trị mặc định
if (image.getImage()== null) {
image.setImage("unknown.jpg"); // Giá trị mặc định cho cột 'Photo'
}


		// Lưu sản phẩm vào cơ sở dữ liệu
		dao.save(product);

		return "redirect:/admin/products";
	}

	
	@PostMapping("/product/update")
	public String updateProduct(@ModelAttribute("product") Product product, ModelMap model) {
	    // Kiểm tra nếu tên sản phẩm hoặc giá sản phẩm không hợp lệ, trả về trang cập nhật sản phẩm với thông báo lỗi
	    if (product.getName() == null || product.getName().isEmpty()) {
	        model.addAttribute("message", "Vui lòng nhập tên sản phẩm!");
	        return "admin/products";
	    }
	    if (product.getPrice() == null) {
	        model.addAttribute("message", "Vui lòng nhập giá sản phẩm!");
	        return "admin/products";
	    }

	    // Lấy sản phẩm hiện tại từ cơ sở dữ liệu
	    Optional<Product> optionalProduct = dao.findById(product.getId());
	    if (optionalProduct.isPresent()) {
	        Product existingProduct = optionalProduct.get();
	        // Gán hình ảnh của sản phẩm hiện tại vào sản phẩm được cập nhật
	        product.setImage(existingProduct.getImage());
	    }

	    // Lưu sản phẩm vào cơ sở dữ liệu
	    dao.save(product);

	    return "redirect:/admin/products";
	}


	
	@GetMapping("/product/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
	    dao.deleteById(id);
	    return "redirect:/admin/products";
	}

	
	
	
	
	@RequestMapping("/product/detail/{id}")
    public String productDetail(@PathVariable("id") int id, Model model) {
		 Optional<Product> optionalProduct = dao.findById(id);
	        if (optionalProduct.isPresent()) {
	            Product product = optionalProduct.get();
	            model.addAttribute("product", product);
	            return "user/detail";
	        } else {
	            model.addAttribute("errorMessage", "Product not found!");
	            return "errorPage";
	        }
    }
	
	


}
