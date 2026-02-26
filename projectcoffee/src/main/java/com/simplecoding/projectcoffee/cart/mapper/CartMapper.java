package com.simplecoding.projectcoffee.cart.mapper;

import com.simplecoding.projectcoffee.cart.vo.Cart;
import com.simplecoding.projectcoffee.cart.vo.CartItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CartMapper {
    List<?> selectCartList(String cartId);  //카트에 담긴 상품 전체 조회
//    cart 테이블과 cart_item 테이블 모두 사용하기 때문에 insrt문 두 개 사용
    int insertP(Cart cart);  //cart(부모) 테이블 insert(항목추가)
    int insertC(CartItem cartItem);   //cart-item(자식) 테이블 insert(항목추가)
}