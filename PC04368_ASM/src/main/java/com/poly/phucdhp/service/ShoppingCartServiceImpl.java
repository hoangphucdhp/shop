package com.poly.phucdhp.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.poly.phucdhp.dao.ProductDAO;
import com.poly.phucdhp.entity.CartItem;
import com.poly.phucdhp.entity.Product;

@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
    private final ProductDAO productDAO;
    private final Map<Integer, CartItem> itemMap;
    private List<CartItem> cartItems;

    @Autowired
    public ShoppingCartServiceImpl(ProductDAO productDAO) {
        this.productDAO = productDAO;
        this.itemMap = new HashMap<>();
        this.cartItems = new ArrayList<>();
    }

    @Override
    public List<CartItem> getCartItems() {
        return new ArrayList<>(itemMap.values());
    }


    @Override
    public Product add(Integer id) {
        CartItem cartItem = itemMap.get(id);
        if (cartItem == null) {
            Product product = productDAO.findById(id).orElse(null);
            if (product != null) {
                cartItem = new CartItem(product, 1);
                itemMap.put(id, cartItem);
            }
        } else {
            cartItem.setQuantity(cartItem.getQuantity() + 1);
        }
        return cartItem.getProduct();
    }

    @Override
    public void remove(Integer id) {
        itemMap.remove(id);
    }

    @Override
    public Product update(Integer id, int qty) {
        CartItem cartItem = itemMap.get(id);
        if (cartItem != null) {
            cartItem.setQuantity(qty);
        }
        return cartItem.getProduct();
    }

    @Override
    public void clear() {
        itemMap.clear();
    }

    @Override
    public Collection<Product> getItems() {
        List<Product> products = new ArrayList<>();
        for (CartItem cartItem : itemMap.values()) {
            products.add(cartItem.getProduct());
        }
        return products;
    }

    @Override
    public int getCount() {
        return itemMap.values().stream()
                .mapToInt(CartItem::getQuantity)
                .sum();
    }

    @Override
    public double getAmount() {
        return itemMap.values().stream()
                .mapToDouble(cartItem -> cartItem.getProduct().getPrice() * cartItem.getQuantity())
                .sum();
    }

    @Override
    public boolean isEmpty() {
        return itemMap.isEmpty();
    }

    @Override
    public int getCartSize() {
        return itemMap.size();
    }

    @Override
    public Integer getQuantity(Product product) {
        CartItem cartItem = itemMap.values().stream()
                .filter(item -> item.getProduct().equals(product))
                .findFirst()
                .orElse(null);
        if (cartItem != null) {
            return cartItem.getQuantity();
        }
        return 0;
    }

    @Override
    public List<Product> getProducts() {
        List<Product> products = new ArrayList<>();
        for (CartItem cartItem : itemMap.values()) {
            products.add(cartItem.getProduct());
        }
        return products;
    }

    @Override
    public int size() {
        return itemMap.size();
    }

    @Override
    public CartItem get(int i) {
        List<CartItem> itemList = new ArrayList<>(itemMap.values());
        if (i >= 0 && i < itemList.size()) {
            return itemList.get(i);
        }
        return null;
    }
}
