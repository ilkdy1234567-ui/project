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
    @PostMapping("/login")
    public String login(@RequestParam("cuNumber") String cuNumber, HttpSession session) {
        try {
            Customer customer = new Customer();
            customer.setCuNumber(cuNumber);

            customerService.insert(customer);

            session.setAttribute("cuNumber", cuNumber);

            return "redirect:/menu"; //우선은 메뉴로 가게 하였으니, 추후 수정하여 메인페이지로 가게 하여도됨.

        } catch (Exception e) {
            e.printStackTrace();
            return "common/error"; // 에러 발생 시 에러 페이지로
        }
    }

    /**
     * 고객 로그아웃 (세션 삭제)
     */
    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 정보 모두 삭제
        return "redirect:/"; // 첫 화면으로 이동
    }
}
