package com.simplecoding.projectcoffee.notice.service;

import com.simplecoding.projectcoffee.common.Criteria;
import com.simplecoding.projectcoffee.notice.mapper.NoticeMapper;
import com.simplecoding.projectcoffee.notice.vo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    public List<Notice> selectNoticeList(Criteria criteria) {
        return noticeMapper.selectNoticeList(criteria);
    }

    public int selectNoticeListTotCnt(Criteria criteria) {
        return noticeMapper.selectNoticeListTotCnt(criteria);
    }

    @Transactional // 조회수 증가와 조회가 한 번에 일어남
    public Notice getNoticeDetail(int noticeId) {
        // 1. 조회수 1 증가
        noticeMapper.incrementViewCount(noticeId);
        // 2. 상세 내용 반환
        return noticeMapper.selectNotice(noticeId);
    }
}