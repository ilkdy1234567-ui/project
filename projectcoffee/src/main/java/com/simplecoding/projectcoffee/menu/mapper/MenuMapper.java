package com.simplecoding.projectcoffee.menu.mapper;

import com.simplecoding.projectcoffee.menu.vo.Menu;
import com.simplecoding.projectcoffee.common.Criteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper

public interface MenuMapper {

        List<Menu> selectMenuList(Criteria criteria);
        List<Menu> selectMenuByCategory(int categoryId);//전체조회
        List<Menu> selectMenuByCategoryAndSub(@Param("categoryId") int categoryId,
                                              @Param("subCategory") String subCategory);
        List<Menu> selectMainMenu();
        List<Menu> selectMainGoods();


}

