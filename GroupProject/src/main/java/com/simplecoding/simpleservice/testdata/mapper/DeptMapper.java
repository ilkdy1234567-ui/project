package com.simplecoding.simpleservice.testdata.mapper;


import com.simplecoding.simpleservice.common.Criteria;
import com.simplecoding.simpleservice.dept.vo.DeptVO;
import com.simplecoding.simpleservice.testdata.SampleDept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * author : simple-coding
 * date : 2023/07/13
 * description : 가짜 부서 DB CRUD 함수 정의 
 * 요약 : 실습용 미리 제공되는 클래스 , 수정 하지 마세요
 */
@Repository
public class DeptMapper {

    @Autowired
    SampleDept SampleDept;

    //    모든 샘를 데이터 조회 함수
    public List<DeptVO> selectAll() {
        List<DeptVO> list = SampleDept.getList();

        return list;
    }

    //    아이디로 조회하는 함수
    public DeptVO selectDept(long dno) {
        List<DeptVO> list = SampleDept.getList();

        DeptVO resDept = null;

//        id에 해당하는 값 찾기
        for (DeptVO dpt : list) {
            if(dpt.getDno() == dno) {
                resDept = dpt;
            }
        }

        return resDept;
    }

//    데이터를 저장하는 함수
    public List<DeptVO> insert(DeptVO dept) {

        List<DeptVO> list = SampleDept.getList();

        int count = selectAll().size(); // 전체 건수
        int newId = (count + 1) * 10;
        dept.setDno(newId); // 새로운 번호 저장

        list.add(dept);

        SampleDept.setList(list);

        return SampleDept.getList();
    }

//    데이터를 수정하는 함수
    public List<DeptVO> update(DeptVO dept) {

        List<DeptVO> list = SampleDept.getList();

        if(dept.getDno() != null) {
            //            수정
            for (DeptVO dpt : list) {
                if ((int)dpt.getDno() == (int)dept.getDno()) {
                    dpt.setDname(dept.getDname());
                    dpt.setLoc(dept.getLoc());
                    dpt.setUpdateTime(dept.getUpdateTime());
                }
            }
        }

        return list;
    }

//  데이터를 삭제하는 함수
    public int delete(long id) {
        List<DeptVO> list = SampleDept.getList();

        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getDno() == id) {
                list.remove(i);
                return 1;
            }
        }

        return 0;
    }
    
    //    이름 like 조회하는 함수
    public List<?> selectDeptList(Criteria criteria) {
        List<DeptVO> list = SampleDept.getList();

        List<DeptVO> resList =new ArrayList<DeptVO>();
        
        if(criteria.getSearchKeyword() == "") return list;

//        dname 해당하는 값을 찾으면 새로운 배열에 넣기
        for (DeptVO data : list) {
            if(data.getDname().contains(criteria.getSearchKeyword())) {
            	resList.add(data);
            }
        }

        return resList;
    }
}











