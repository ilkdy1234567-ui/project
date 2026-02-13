package com.simplecoding.projectcoffee.menu.mapper;

import com.simplecoding.projectcoffee.menu.vo.Menu;
import com.simplecoding.projectcoffee.common.Criteria;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper

public interface MenuMapper {

        List<Menu> selectMenuList(Criteria criteria);   //전체조회
        int selectMenuListTotCnt(Criteria criteria);  //총개수 구하기
        int insert(Menu product);  //추가
        int delete(String uuid);

    List<?> selectMenulist(Criteria criteria);
}

