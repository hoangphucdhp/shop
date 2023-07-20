package com.poly.phucdhp.dao;



import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.poly.phucdhp.entity.OrderDetail;


@Repository
public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long> {
	
}




