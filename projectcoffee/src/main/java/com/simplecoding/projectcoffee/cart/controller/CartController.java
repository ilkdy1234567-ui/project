package com.simplecoding.projectcoffee.cart.controller;

import com.simplecoding.projectcoffee.cart.service.CartService;
import com.simplecoding.projectcoffee.cart.vo.Cart;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Controller
public class CartController {
    @Autowired
    private CartService cartService;

    @GetMapping("/cart")
    public String selectCartList(@PathVariable String cartId, Model model) {

        List<?> cart = cartService.selectCartList(cartId);

        log.info("테스트", cart);
        model.addAttribute("cart", cart);
        return "cart/cart_all";
    }

    /**
     * 장바구니 저장(부모+자식 insert)
     * - CartService.insert(cart) 내부에서 UUID 생성 + 부모/자식 insert 처리
     * - JSP 폼 전송 또는 AJAX 폼 전송 둘 다 가능
     */
    @PostMapping("/cart/insert")
    public String insert(@ModelAttribute Cart cart) {
        // 1) 서비스 호출 (부모/자식 insert)
        cartService.insert(cart);
        // 2) 저장 후 이동 (예: 장바구니 목록 페이지로 리다이렉트)
        return "redirect:/ok";
    }
}

