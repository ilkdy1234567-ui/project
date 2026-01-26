package com.simplecoding.simpleservice.dept.controller;

// 컨트롤러 역할: url(인터넷주소)와 jsp(화면)을 연결하는곳, @Controller

import com.simplecoding.simpleservice.common.Criteria;
import com.simplecoding.simpleservice.dept.service.DeptService;
import com.simplecoding.simpleservice.dept.vo.DeptVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class DeptController {
//    부서 업무용 함수 -> 부서 업무용 객체(DeptService)
    @Autowired
    private DeptService deptService;

//    전체 조회 컨트롤러 함수, 검색 조회
    @GetMapping("/dept")     // 추가 인터넷주소
    public String selectDeptList(@ModelAttribute Criteria criteria,
                                 Model model){
//        부서 업무용 전체 조회 함수 실행 : 결과 (배열)
       List<?> list=deptService.selectDeptList(criteria);
       model.addAttribute("list",list);  // 배열 -> jsp 전송

       return "dept/dept_all"; // dept(폴더), dept_all(jsp)
    }

// ③아래 요건에 따라 controller 추가 페이지 열기 메소드, 저장 메소드를 작성하세요
//    1) 추가 페이지 열기 메소드
    @GetMapping("/dept/addition")
    public String addDeptView(){
        return "dept/add_dept";
    }

//   2) 저장 메소드: 137페이지
//    인터넷 전송 약속(method): 조회(GET), 저장/수정/삭제(POST)
//  @PostMapping : 저장/수정/삭제 시 사용하는 어노테이션, 인터넷 주소 넣기
    @PostMapping("/dept/add")
    public String insert(@ModelAttribute DeptVO deptVO){
//      db 저장: 부서 객체 저장
        deptService.insert(deptVO);
//      redirect: 강제 페이지 이동, /dept(전체 조회 페이지)
        return "redirect:/dept";
    }

//   3) 상세조회: 기본키로(부서번호, dno) 조회
//      상세조회 페이지 열기
//    테스트 url: http://localhost:8080/dept/edition?dno=값
    @GetMapping("/dept/edition")            // 추가인터넷 주소
    public String updateDeptView(Model model,
                                 @RequestParam(defaultValue = "0") long dno){
//        db 상세조회: 결과 - DeptVO(부서 객체) 1개
         DeptVO deptVO=deptService.selectDept(dno);
         model.addAttribute("deptVO",deptVO); // jsp 전송

        return "dept/update_dept";            // dept(폴더),update_dept(jsp)
    }

}
