package com.simplecoding.projectcoffee.cart.service;

import com.simplecoding.projectcoffee.cart.vo.Cart;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@Log4j2
class CartServiceTest {
    @Autowired
    CartService cartService;

    @Test
    void testInsert() {
        Cart cart = new Cart();
        cart.setCDate("1234");
        String[] a = {"UUID1005"};
        cart.setPUuid(a);
        int[] b = {1};
        cart.setQuantity(b);
        cart.setCuNumber("01077600609");
        cartService.insert(cart);
    }
}

