package com.poly.phucdhp.service;

import java.util.Collection;
import java.util.List;

import com.poly.phucdhp.entity.CartItem;
import com.poly.phucdhp.entity.Product;

public interface ShoppingCartService {
    /**
     * Thêm mặt hàng vào giỏ hoặc tăng số lượng lên 1 nếu đã tồn tại
     * 
     * @param id mã mặt hàng cần thêm
     * @return mặt hàng đã được thêm vào hoặc cập nhật số lượng
     */
    Product add(Integer id);

    /**
     * Xóa mặt hàng khỏi giỏ
     * 
     * @param id mã mặt hàng cần xóa
     */
    void remove(Integer id);

    /**
     * Thay đổi số lượng của mặt hàng trong giỏ
     * 
     * @param id  mã mặt hàng
     * @param qty số lượng mới
     * @return mặt hàng đã được thay đổi số lượng
     */
    Product update(Integer id, int qty);

    /**
     * Xóa sạch các mặt hàng trong giỏ
     */
    void clear();

    /**
     * Lấy tất cả các mặt hàng trong giỏ
     */
    Collection<Product> getItems();

    /**
     * Lấy tổng số lượng các mặt hàng trong giỏ
     */
    int getCount();

    /**
     * Lấy tổng số tiền tất cả các mặt hàng trong giỏ
     */
    double getAmount();

    /**
     * Kiểm tra xem giỏ hàng có rỗng hay không
     * 
     * @return true nếu giỏ hàng rỗng, ngược lại trả về false
     */
    boolean isEmpty();

    /**
     * Lấy số lượng sản phẩm trong giỏ hàng
     * 
     * @return số lượng sản phẩm trong giỏ hàng
     */
    int getCartSize();

    /**
     * Lấy số lượng sản phẩm của mặt hàng trong giỏ hàng
     * 
     * @param product mặt hàng cần kiểm tra số lượng
     * @return số lượng sản phẩm của mặt hàng trong giỏ hàng
     */
    Integer getQuantity(Product product);

    /**
     * Lấy danh sách các mặt hàng trong giỏ hàng
     * 
     * @return danh sách các mặt hàng trong giỏ hàng
     */
    List<Product> getProducts();
    
    List<CartItem> getCartItems();

	int size();

	CartItem get(int i);
}
