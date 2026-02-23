package com.simplecoding.projectcoffee.store.controller;

import com.simplecoding.projectcoffee.store.service.StoreService;
import com.simplecoding.projectcoffee.store.vo.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class StoreController {
    @Autowired
    private StoreService storeService;
    @GetMapping("/store/list")
    public String getStoreList(Model model){
        List<Store> list= storeService.findAll();
        model.addAttribute("stores",list);
        return "storeList";
    }
}
