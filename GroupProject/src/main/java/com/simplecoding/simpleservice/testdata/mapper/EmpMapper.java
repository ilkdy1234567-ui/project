package com.simplecoding.simpleservice.testdata.mapper;

import com.simplecoding.simpleservice.common.Criteria;
import com.simplecoding.simpleservice.emp.vo.EmpVO;
import com.simplecoding.simpleservice.testdata.SampleEmp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * author : simple-coding
 * date : 2023/07/13
 * description : 가짜 회원 DB CRUD 함수 정의 
 * 요약 : 실습용 미리 제공되는 클래스 , 수정 하지 마세요
 */
@Repository
public class EmpMapper {

    @Autowired
    SampleEmp sampleEmp;

    //    모든 샘를 데이터 조회 함수
    public List<EmpVO> selectAll() {
        List<EmpVO> list = sampleEmp.getList();

        return list;
    }

    //    아이디로 조회하는 함수
    public EmpVO selectEmp(long eno) {
        List<EmpVO> list = sampleEmp.getList();

        EmpVO resDept = null;

//        id에 해당하는 값 찾기
        for (EmpVO element : list) {
            if(element.getEno() == eno) {
                resDept = element;
            }
        }

        return resDept;
    }

//    데이터를 저장하는 함수
    public List<EmpVO> insert(EmpVO emp) {

        List<EmpVO> list = sampleEmp.getList();

        int count = selectAll().size(); // 전체 건수
        int newId = count + 8000;
        emp.setEno(newId); // 새로운 번호 저장

        list.add(emp);

        sampleEmp.setList(list);

        return sampleEmp.getList();
    }

//    데이터를 수정하는 함수
    public List<EmpVO> update(EmpVO emp) {

        List<EmpVO> list = sampleEmp.getList();

        if(emp.getEno() != null) {
            //            수정
            for (EmpVO element : list) {
                if ((int)element.getEno() == (int)emp.getEno()) {
                    element.setEname(emp.getEname());
                    element.setJob(emp.getJob());
                    element.setManager(emp.getManager());
                    element.setUpdateTime(emp.getUpdateTime());
                }
            }
        }

        return list;
    }

//  데이터를 삭제하는 함수
    public int delete(long id) {
        List<EmpVO> list = sampleEmp.getList();

        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getEno() == id) {
                list.remove(i);
                return 1;
            }
        }

        return 0;
    }
    
    //    이름 like 조회하는 함수
    public List<?> selectEmpList(Criteria criteria) {
        List<EmpVO> list = sampleEmp.getList();

        List<EmpVO> resList =new ArrayList<EmpVO>();
        
        if(criteria.getSearchKeyword() == "") return list;

//        ename 해당하는 값을 찾으면 새로운 배열에 넣기
        for (EmpVO data : list) {
            if(data.getEname().contains(criteria.getSearchKeyword())) {
            	resList.add(data);
            }
        }

        return resList;
    }
}











