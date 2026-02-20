package com.simplecoding.projectcoffee.notice.controller;

import com.simplecoding.projectcoffee.common.Criteria;
import com.simplecoding.projectcoffee.notice.service.NoticeService;
import com.simplecoding.projectcoffee.notice.vo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @GetMapping("/notice")
    public String list(Criteria criteria, Model model) {
        List<Notice> list = noticeService.selectNoticeList(criteria);
        model.addAttribute("noticeList", list);

        return "notice";
    }
}