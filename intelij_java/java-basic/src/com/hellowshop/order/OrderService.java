package com.hellowshop.order;

import com.hellowshop.product.Product;
import com.hellowshop.user.User;

public class OrderService {
    public void order(){
        User user = new User();
        Product product = new Product();
        Order order = new Order(user, product);
    }
}
