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
    // NoticeController.java에 추가
    @GetMapping("/notice/detail")
    public String detail(int noticeId, Model model) {
        // Service에서 조회수 증가 + 상세 조회를 한 번에 처리
        Notice notice = noticeService.getNoticeDetail(noticeId);
        model.addAttribute("notice", notice);

        return "notice_detail"; // notice_detail.jsp 파일을 새로 만들어야 합니다.
    }
}