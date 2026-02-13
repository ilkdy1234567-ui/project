package com.simplecoding.projectcoffee.menu.service;

import com.simplecoding.projectcoffee.common.Criteria;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Log4j2
class MenuServiceTest {
    @Autowired
    MenuService menuService;

    @Test
//    전체조회 테스트
    void selectMenuList() {
        //  TODO: 여기
//        1) 준비: 매개변수들에 가짜 값 넣기: Criteria(페이지 번호 넣기)
        Criteria criteria = new Criteria();
        criteria.setSearchKeyword(""); // 테스트용 검색어 넣기
//      TODO: 아래 2개 추가하세요 (페이징 조건)
        criteria.setOffset(3);         // 오프셋 넣기(자료의 순번)
        criteria.setSize(3);           // 화면에 보일 개수
//        2) 실행-> FileDb 배열
        List<?> list = menuService.selectMenuList(criteria);
//        3) 결과확인
        log.info(list);
    }

    //    총개수 구하기
    @Test
    void selectMenuListTotCnt() {
        //        1) 준비: 매개변수들에 가짜 값 넣기
        Criteria criteria = new Criteria();
        criteria.setSearchKeyword(""); // 테스트용 검색어 넣기
//      TODO: 아래 2개 추가하세요 (페이징 조건)
        criteria.setOffset(3);         // 오프셋 넣기(자료의 순번)
        criteria.setSize(3);           // 화면에 보일 개수
//        2) 실행-> 부서 배열
        int count = menuService.selectMenuListTotCnt(criteria);
//        3) 결과확인
        log.info(count);
    }
}