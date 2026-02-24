package com.simplecoding.projectcoffee;

import com.simplecoding.projectcoffee.menu.service.MenuService;
import jakarta.servlet.http.HttpSession; // 추가
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @Autowired
    private MenuService menuService;

    @GetMapping("/")
    public String index(HttpSession session, Model model) { // HttpSession 추가

        // 1. 세션에 고객 번호(cuNumber)가 있는지 확인
        String cuNumber = (String) session.getAttribute("cuNumber");

        // 2. 이미 번호를 입력한 상태라면 메인 페이지를 건너뛰고 메뉴로 이동
        if (cuNumber != null) {
            return "redirect:/menu";
        }

        // 3. 번호가 없는 경우에만 메인 메뉴들을 가져와서 index 페이지 보여줌
        model.addAttribute("mainMenus", menuService.getMainMenu());
        model.addAttribute("mainGoods", menuService.getMainGoods());

        return "index";
    }
}