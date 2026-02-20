package com.simplecoding.projectcoffee.customer.controller;

import com.simplecoding.projectcoffee.customer.service.CustomerService;
import com.simplecoding.projectcoffee.customer.vo.Customer;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    // 기존 login 메서드를 교체.
    @PostMapping("/login")
    public String login(@RequestParam("cuNumber") String cuNumber, HttpSession session) {

        // 1. 유효성 검사: 번호를 입력하지 않고 버튼을 누른 경우 처리
        if (cuNumber == null || cuNumber.trim().isEmpty()) {
            return "redirect:/"; // 메인(입력창)으로 다시 보냄
        }

        try {
            Customer customer = new Customer();
            customer.setCuNumber(cuNumber);

            // 2. 서비스 호출 (내부적으로 중복 체크 후 INSERT 수행)
            customerService.insert(customer);

            // 3. 세션에 번호 저장 (이 브라우저가 닫히기 전까지 고객 식별)
            session.setAttribute("cuNumber", cuNumber);

            // 4. 성공 시 메뉴 페이지로 이동
            return "redirect:/menu";

        } catch (Exception e) {
            e.printStackTrace();
            return "common/error"; // 예외 발생 시 에러 페이지로
        }
    }

    /**
     * 고객 퇴장 (세션 삭제)
     */
    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 서버가 기억하는 번호 삭제
        return "redirect:/"; // 첫 화면으로 이동
    }
}