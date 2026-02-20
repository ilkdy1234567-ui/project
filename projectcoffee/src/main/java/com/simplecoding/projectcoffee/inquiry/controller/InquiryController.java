package com.simplecoding.projectcoffee.inquiry.controller;

import com.simplecoding.projectcoffee.inquiry.service.InquiryService;
import com.simplecoding.projectcoffee.inquiry.vo.Inquiry;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/contact")
public class InquiryController {

    @Autowired
    private InquiryService inquiryService;

    // 내 문의 내역 리스트 페이지
    @GetMapping("")
    public String list(HttpSession session, Model model) {
        // 1. 세션에서 입장 시 기록한 번호 꺼내기
        String cuNumber = (String) session.getAttribute("cuNumber");

        // 2. 번호가 없으면 입구로 쫓아내기 (비로그인 식별 안됨)
        if (cuNumber == null) return "redirect:/";

        // 3. 내 번호에 해당하는 문의글만 가져오기
        List<Inquiry> list = inquiryService.getMyInquiries(cuNumber);
        model.addAttribute("inquiryList", list);

        return "contact";
    }

    // 문의글 작성 처리
    @PostMapping("/write")
    public String write(Inquiry inquiry, HttpSession session) {
        String cuNumber = (String) session.getAttribute("cuNumber");
        if (cuNumber == null) return "redirect:/";

        // 작성자 번호 세팅 후 저장
        inquiry.setCuNumber(cuNumber);
        inquiryService.createInquiry(inquiry);

        return "redirect:/contact";
    }
}