package com.simplecoding.simpleservice.emp.controller;

import com.simplecoding.simpleservice.common.Criteria;
import com.simplecoding.simpleservice.emp.service.EmpService;
import com.simplecoding.simpleservice.emp.vo.EmpVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class EmpController {
    @Autowired
    private EmpService empService;

//    사원 전체 조회
    @GetMapping("/emp")
    public String selectEmpList(@ModelAttribute Criteria criteria,
                                Model model){
//        db 사원 전체조회 함수 실행
        List<?> list=empService.selectEmpList(criteria);
        model.addAttribute("list",list);
        return "emp/emp_all";
    }

//  컨트롤러 역할: url(인터넷주소) 과 jsp(화면)을 연결하는 곳
//  퀴즈) 1) 아래 요건에 따라 controller 추가 페이지 열기 메소드
    @GetMapping("/emp/addition")
    public String addEmpView() {
        return "emp/add_emp";  // emp(폴더),add_emp(jsp)
    }

// 2) 아래 요건에 따라 controller 저장 메소드(저장 버튼 클릭시 실행)
    @PostMapping("/emp/add")
    public String insert(@ModelAttribute EmpVO empVO){
//        1) db 저장: 사원 객체 저장(empVO)
        empService.insert(empVO);
//      리다이렉트: 강제 페이지 이동, /emp(사원 전체조회 인터넷 주소)
//      사용법: return "redirect:이동페이지url"
        return "redirect:/emp";
    }

//    퀴즈) ④퀴즈) 아래 요건에 따라 controller 상세 조회 페이지 열기, 수정 메소드 작성하세요
//    1) 상세조회
    @GetMapping("/emp/edition")
    public String updateMemberView(Model model,
                                   @RequestParam(defaultValue = "0") long eno){
//        상세조회: 기본키로(사원번호, eno) 조회
        EmpVO empVO=empService.selectEmp(eno);
        model.addAttribute("empVO",empVO);

        return "emp/update_emp";   // emp(폴더), update_emp(jsp)
    }
}
