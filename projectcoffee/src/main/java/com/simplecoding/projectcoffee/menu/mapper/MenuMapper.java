package com.simplecoding.projectcoffee.menu.mapper;

import com.simplecoding.projectcoffee.menu.vo.Menu;
import com.simplecoding.projectcoffee.common.Criteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper

public interface MenuMapper {

        List<Menu> selectMenuList(Criteria criteria); //메뉴 전체조회
        List<Menu> selectMenuByCategory(int categoryId);// 카체고리별로 상세조회
        List<Menu> selectMenuByCategoryAndSub(@Param("categoryId") int categoryId,
                                              @Param("subCategory") String subCategory);
        List<Menu> selectMainMenu(); //메인화면에 메뉴 조회
        List<Menu> selectMainGoods(); //메인화면에 굿즈 조회


}

