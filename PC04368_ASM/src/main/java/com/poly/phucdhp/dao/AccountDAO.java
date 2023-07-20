package com.poly.phucdhp.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.phucdhp.entity.Account;
import com.poly.phucdhp.entity.Product;

import java.util.List;
import java.util.Optional;




public interface AccountDAO extends JpaRepository<Account, String>{

	Account findByUsername(String username);

	Account findByUsernameAndPassword(String username, String password);
	
	@Query("SELECT a FROM Account a WHERE a.fullname LIKE %?1%")
    Page<Account> findByKeywords(String keywords, Pageable pageable);

	Account findByEmail(String email);

	
}
