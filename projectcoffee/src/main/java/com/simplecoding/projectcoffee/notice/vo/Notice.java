package com.simplecoding.projectcoffee.notice.vo;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Notice {
    private int noticeId;       // 공지사항 ID (PK)
    private String title;       // 제목
    private String cont;        // 내용 (CLOB)
    private int viewCount;      // 조회수
    private String important;   // 중요공지 여부 (Y/N)
    private String cDate;       // 작성일
    private String updatedDate; // 수정일
}