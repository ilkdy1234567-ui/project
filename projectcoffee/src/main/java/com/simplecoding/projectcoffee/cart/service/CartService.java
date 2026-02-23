package com.simplecoding.projectcoffee.cart.service;

import com.simplecoding.projectcoffee.cart.mapper.CartMapper;
import com.simplecoding.projectcoffee.cart.vo.Cart;
import com.simplecoding.projectcoffee.cart.vo.CartItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class CartService {
    @Autowired
    private CartMapper cartMapper;
    public List<?> selectCartList(String cartId) {
        return cartMapper.selectCartList(cartId);
    }
    @Transactional
    public void insert(Cart cart) {
//        1. 부모 insert
        String cartId=UUID.randomUUID().toString();    //uuid 만들기
        cart.setCartId(cartId);// uuid에 cartId를 저장해줌
        cartMapper.insertP(cart);
//        2. 자식 insert
        for (int i = 0; i < cart.getPUuid().length; i++) {
//            자식 CartItem 에 클래스에 값 저장후 db에 insert
            CartItem cartItem=new CartItem();            // 새로 만든것 : 아무것도 없음
            cartItem.setPUuid(cart.getPUuid()[i]);       // 배열 제품
            cartItem.setQuantity(cart.getQuantity()[i]); // 배열 개수
            cartItem.setCartId(cartId);

            cartMapper.insertC(cartItem);
        }
    }
    }

