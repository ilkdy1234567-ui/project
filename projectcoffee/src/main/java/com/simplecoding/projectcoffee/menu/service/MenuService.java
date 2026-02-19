    package com.simplecoding.projectcoffee.menu.service;
    import com.simplecoding.projectcoffee.menu.mapper.MenuMapper;
    import com.simplecoding.projectcoffee.menu.vo.Menu;
    import com.simplecoding.projectcoffee.common.Criteria;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Service;
    import java.util.List;


    // @Service
    // - IOC 컨테이너가 실행 시 ProductService 객체를 생성
    // - 상품 비즈니스 로직을 담당
    @Service
    public class MenuService {

        @Autowired
        MenuMapper menuMapper;


        // 1️⃣ 상품 전체 조회
        public List<Menu> selectMenuList(Criteria criteria) {
            return menuMapper.selectMenuList(criteria);
        }

        public List<Menu> getMenuByCategory(int categoryId) {
            return menuMapper.selectMenuByCategory(categoryId);
        }

        // 큰 카테고리 + 작은 분류(버튼)
        public List<Menu> getMenuByCategoryAndSub(int categoryId, String subCategory) {
            return menuMapper.selectMenuByCategoryAndSub(categoryId, subCategory);
        }
        // ✅ index 상단 메뉴 8개 (카테고리 1,2,3 섞어서)
        public List<Menu> getMainMenu() {
            return menuMapper.selectMainMenu();
        }

        // ✅ index 하단 굿즈 5개 (카테고리 4,5 섞어서)
        public List<Menu> getMainGoods() {
            return menuMapper.selectMainGoods();
        }
    }

