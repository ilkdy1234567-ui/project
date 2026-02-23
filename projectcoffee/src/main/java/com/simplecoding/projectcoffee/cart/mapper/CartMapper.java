package com.simplecoding.projectcoffee.cart.mapper;

import com.simplecoding.projectcoffee.cart.vo.Cart;
import com.simplecoding.projectcoffee.cart.vo.CartItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CartMapper {
    List<?> selectCartList(String cartId);
    int insertP(Cart cart);
    int insertC(CartItem cartItem);   //for 반복문 사용(서비스)
}