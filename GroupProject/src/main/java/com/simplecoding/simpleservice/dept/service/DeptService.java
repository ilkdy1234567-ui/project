package com.simplecoding.simpleservice.dept.service;

// 컨트롤러 역할: url(인터넷주소)과 jsp(화면)을 연결하는 곳
// 서비스   역할: db (crud:조회/추가/수정/삭제) 함수를 이용해서 업무용 함수를 만드는 곳
// MVC 디자인 패턴: M(모델(Model), 서비스 포함), V(뷰(View),화면(jsp 등))
//                C(컨트롤러(Controller), 위 정의)
// db 객체: DeptMapper(부서), EmpMapper(사원)
// db 함수: 1) 전체조회 함수           : selectAll(), 결과: 배열
//         1-2) 전체조회 함수         : selectDeptList(Criteria), 결과: 배열
//         2) 부서번호(dno)로 조회 함수: selectDept(부서번호값), 결과:부서 객체
//         3) 부서 추가              : insert(부서 객체), db 저장
//         4) 부서 수정              : update(부서 객체), db 수정
//         5) 부서 삭제              : delete(부서번호), db 삭제

// 클래스(객체) 3요소: 1)필드 2) 생성자 3) 메소드
// 자바 : 객체지향 언어: 객체를 불러다가 코딩하는것
// 1) @Service : 클래스 위에 붙임,
//     코딩: new 객체생성자() 만들어야 했음(개발자)
//  스프링 : 위의 코드를(객체 생성) 스프링합니다.(언제? 실행버튼 누를때)
//      단, @Service 붙은 클래스만 합니다.( 예)@Component, @Mapper 등)
//   IOC: (Inversion of Control), 객체 생성을 개발자가 아니라 스프링이 해주는 것을 말함

// 2) @Autowired: 변수(필드) 위에 붙임,
//    스프링은 실행버튼을 누르면 @Service 가 붙은 객체를 생성합니다.(IOC 기능)
//   DI:(Dependency Injection) 생성해 놓은 객체를 필드명과 같은 것을 가져와서 변수에 저장합니다.
import com.simplecoding.simpleservice.common.Criteria;
import com.simplecoding.simpleservice.dept.vo.DeptVO;
import com.simplecoding.simpleservice.testdata.mapper.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptService {
//    db 함수: db 객체
    @Autowired
    private DeptMapper deptMapper;

//  TODO: 업무용 함수
//    1) 전체 조회 함수: 결과: 여러개(배열) -> 값: 부서객체(db:1행)
//     Criteria: 검색어 넣기, 페이지번호 관련 클래스(전자정부 제공)
    public List<?> selectDeptList(Criteria criteria){
        return deptMapper.selectDeptList(criteria);  // db 전체조회 함수 실행
    }


//    2) 추가 기능 만들기 : 132p
//   ①아래 요건에 따라 service 추가 메소드를 작성하세요
    public void insert(DeptVO deptVO){
//        db insert 함수 실행 -> db 객체(deptMapper)
        deptMapper.insert(deptVO);
    }

//    3) 상세 조회: 기본키(부서번호, dno)로 조회하기 : 결과: 1개(부서 객체)
    public DeptVO selectDept(long dno){
//        DB 상세조회: -> DB 객체(deptMapper)
        return deptMapper.selectDept(dno);
    }
//    4) 수정: 부서 객체 수정 , 결과: 없음
    public void update(DeptVO deptVO){
//        db 수정 함수: -> DB 객체(deptMapper), update
        deptMapper.update(deptVO);
    }
}
