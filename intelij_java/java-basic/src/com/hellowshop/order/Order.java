package com.hellowshop.order;

import com.hellowshop.product.Product;
import com.hellowshop.user.User;

public class Order {

    User user;
    Product product;

    public Order(User user, Product product){
        this.user = user;
        this.product = product;
    }
}
