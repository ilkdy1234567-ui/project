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

        String cuNumber = (String) session.getAttribute("cuNumber");

        model.addAttribute("mainMenus", menuService.getMainMenu());
        model.addAttribute("mainGoods", menuService.getMainGoods());

        return "index";
    }
}