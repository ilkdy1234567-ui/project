package com.simplecoding.simpleservice.emp.service;
// 퀴즈: 1) 사원 service 전체 조회 메소드를 작성하세요
// @Service : IOC 기능, 스프링이 대신 객체 생성함(실행 버튼 누르면)
// @Autowired : DI 기능, 스프링이 만든 객체 1개 가져오기
import com.simplecoding.simpleservice.common.Criteria;
import com.simplecoding.simpleservice.emp.vo.EmpVO;
import com.simplecoding.simpleservice.testdata.mapper.EmpMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

// db 객체: EmpMapper(사원)
// db 함수: 1) 전체조회 함수           : selectAll(), 결과: 배열
//         1-2) 전체조회 함수         : selectEmpList(Criteria), 결과: 배열
//         2) 사원번호(eno)로 조회 함수: selectEmp(사원번호값), 결과:부서 객체
//         3) 사원 추가              : insert(사원 객체), db 저장
//         4) 사원 수정              : update(사원 객체), db 수정
//         5) 사원 삭제              : delete(사원번호), db 삭제
@Service
public class EmpService {
//    사원 db 함수 -> 사원 db 객체
    @Autowired
    private EmpMapper empMapper;

//    업무용 함수
//    1) 사원 전체 조회
    public List<?> selectEmpList(Criteria criteria){
        return empMapper.selectEmpList(criteria);
    }

//    ②퀴즈) 아래 요건에 따라 service 추가 메소드를 작성하세요
    public void insert(EmpVO empVO){
//        db 사원 insert 함수 -> 객체(empMapper)
        empMapper.insert(empVO);
    }

//  ②퀴즈) 아래 요건에 따라 service 상세조회, 수정 메소드를 작성하세요
//    1) 상세조회: 기본키로(사원번호, eno) 조회, 결과: 1개 사원 객체
    public EmpVO selectEmp(long eno){
//        db 상세조회: selectEmp, empMapper(사원 db 객체)
        return empMapper.selectEmp(eno);
    }
//    2) 사원(EmpVO) 수정
    public void update(EmpVO empVO){
        empMapper.update(empVO);
    }
}
