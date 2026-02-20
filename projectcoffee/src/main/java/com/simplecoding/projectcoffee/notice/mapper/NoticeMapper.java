package com.simplecoding.projectcoffee.notice.mapper;

import com.simplecoding.projectcoffee.common.Criteria;
import com.simplecoding.projectcoffee.notice.vo.Notice;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeMapper {
    // 1. 공지사항 리스트 (중요 공지가 상단에 오도록 정렬 필요)
    List<Notice> selectNoticeList(Criteria criteria);

    // 2. 전체 개수 (페이징용)
    int selectNoticeListTotCnt(Criteria criteria);

    // 3. 공지 상세 조회
    Notice selectNotice(int noticeId);

    // 4. 조회수 증가
    void incrementViewCount(int noticeId);

    // 5. 공지 등록 (관리자용)
    int insert(Notice notice);
}