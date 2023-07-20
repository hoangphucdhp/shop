package com.poly.phucdhp.utils;


import com.poly.phucdhp.dao.ProductDAO;
import com.poly.phucdhp.entity.Product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class DB implements CommandLineRunner {
    private final ProductDAO itemRepository;

    @Autowired
    public DB(ProductDAO itemRepository) {
        this.itemRepository = itemRepository;
    }

    @Override
    public void run(String... args) {
        Map<Integer, Product> items = new HashMap<>();
        itemRepository.findAll().forEach(item -> items.put(item.getId(), item));
        // Sử dụng biến items ở các phần khác của lớp DB hoặc lớp khác
    }
}
