package com.poly.phucdhp.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.phucdhp.entity.Category;
import com.poly.phucdhp.entity.OrderDetail;
import com.poly.phucdhp.entity.Product;
import com.poly.phucdhp.entity.Report;

import java.util.List;




public interface ProductDAO extends JpaRepository<Product, Integer>{
	/*
	 * @Query("SELECT p.name, p.price,p.image, odd.quantity  FROM OrderDetails odd JOIN od.product p  WHERE odd.username=?1"
	 * ) List<Object[]> findAllProducts(@Param("username") String username);
	 */
	
	@Query("SELECT new Report(o.category, sum(o.price), count(o)) "
			+ " FROM Product o "
			+ " GROUP BY o.category"
			+ " ORDER BY sum(o.price) DESC")
	List<Report> getInventoryByCategory();
	
	@Query("SELECT COUNT(p) FROM Product p")
    int getProductCount();

	@Query("SELECT p FROM Product p ORDER BY p.createDate DESC")
	List<Product> findTop10ProductsByDate();

	
	@Query("SELECT p FROM Product p ORDER BY p.createDate DESC")
    List<Product> findTop8ProductsByDate();
	
	@Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
	Page<Product> findByKeywords(String keywords, Pageable pageable);
	
	@Query(value="SELECT * FROM Products WHERE name LIKE ?1",nativeQuery = true)
	List<Product> findByKeywordName(String keyword);
	
	@Query("SELECT p FROM Product p ORDER BY p.price ASC")
	List<Product> findAllByOrderByPriceAsc();
	 
	@Query("SELECT p FROM Product p WHERE p.price > ?1 ORDER BY p.price DESC")
	List<Product> findByPrice1(double min);
		
	@Query("SELECT p FROM Product p WHERE p.price > ?1")
	List<Product> findByPrice2(double min, Sort sort);
		
	Page<Product> findByCategory(Category category, Pageable pageable);
	Page<Product> findByCategoryAndNameContaining(Category category, String keyword, Pageable pageable);


}
