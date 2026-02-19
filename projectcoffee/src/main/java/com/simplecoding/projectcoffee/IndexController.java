package com.simplecoding.projectcoffee;

import com.simplecoding.projectcoffee.menu.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @Autowired
    private MenuService menuService;

    @GetMapping("/")
    public String index(Model model) {

        // 메뉴 8개 (1,2,3 섞어서)
        model.addAttribute("mainMenus", menuService.getMainMenu());

        // 굿즈 5개 (4,5 섞어서)
        model.addAttribute("mainGoods", menuService.getMainGoods());

        return "index";
    }
}
