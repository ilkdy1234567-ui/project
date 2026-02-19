        package com.simplecoding.projectcoffee.menu.controller;
        import com.simplecoding.projectcoffee.menu.service.MenuService;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Controller;
        import org.springframework.ui.Model;
        import org.springframework.web.bind.annotation.*;



        @Controller
        public class MenuController {
            @Autowired
            MenuService menuService;

            @GetMapping("/menu")
            public String menu(@RequestParam(defaultValue = "all") String sub, Model model) {
                int categoryId = 1;

                if ("all".equals(sub)) {
                    model.addAttribute("list", menuService.getMenuByCategory(categoryId));
                } else {
                    model.addAttribute("list", menuService.getMenuByCategoryAndSub(categoryId, sub));
                }
                return "menu";
            }

            @GetMapping("/beverage")
            public String beverage(@RequestParam(defaultValue = "all") String sub, Model model) {
                int categoryId = 2;

                if ("all".equals(sub)) {
                    model.addAttribute("list", menuService.getMenuByCategory(categoryId));
                } else {
                    model.addAttribute("list", menuService.getMenuByCategoryAndSub(categoryId, sub));
                }
                return "beverage";
            }

            @GetMapping("/dessert")
            public String dessert(@RequestParam(defaultValue = "all") String sub, Model model) {
                int categoryId = 3;

                if ("all".equals(sub)) {
                    model.addAttribute("list", menuService.getMenuByCategory(categoryId));
                } else {
                    model.addAttribute("list", menuService.getMenuByCategoryAndSub(categoryId, sub));
                }
                return "dessert";
            }


            @GetMapping("/goods")
            public String goods(@RequestParam(defaultValue = "all") String sub, Model model) {
                int categoryId = 5;

                if ("all".equals(sub)) {
                    model.addAttribute("list", menuService.getMenuByCategory(categoryId));
                } else {
                    model.addAttribute("list", menuService.getMenuByCategoryAndSub(categoryId, sub));
                }
                return "goods";
            }

            @GetMapping("/shop")
            public String shop(@RequestParam(defaultValue = "all") String sub, Model model) {
                int categoryId = 4;

                if ("all".equals(sub)) {
                    model.addAttribute("list", menuService.getMenuByCategory(categoryId));
                } else {
                    model.addAttribute("list", menuService.getMenuByCategoryAndSub(categoryId, sub));
                }
                return "shop";
            }
        }



