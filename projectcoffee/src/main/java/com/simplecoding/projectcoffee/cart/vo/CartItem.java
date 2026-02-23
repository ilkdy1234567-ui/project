package com.simplecoding.projectcoffee.cart.vo;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class CartItem {
    private int cartItemId;   //자식 기본키
    private String pUuid;
    private String cartId;    //부모 기본키  uuid
    private int quantity;
}
