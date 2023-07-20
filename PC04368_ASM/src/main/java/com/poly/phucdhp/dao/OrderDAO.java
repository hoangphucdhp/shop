package com.poly.phucdhp.dao;

import java.util.Date;
import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.poly.phucdhp.entity.Order;


@Repository
public interface OrderDAO extends JpaRepository<Order, Long> {
	/*
	 * @Modifying
	 * 
	 * @Query(value =
	 * "INSERT INTO Orders (address, Createdate, Username) VALUES (:address, :createDate, :username)"
	 * , nativeQuery = true) void saveOrder(@Param("address") String
	 * address, @Param("createDate") Date createDate, @Param("username") String
	 * username);
	 */
	
	 List<Order> findByAccount_Username(String username);

	    
	   }

