package com.simplecoding.projectcoffee.inquiry.vo;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Inquiry {
    private int inquiryId;      // PK
    private String title;       // 제목
    private String cont;        // 내용
    private String inqStatus;   // 대기/답변완료
    private String cDate;       // 작성일
    private String answerContent; // 답변 내용
    private String answerDate;    // 답변일
    private String cuNumber;      // FK (고객 전화번호)
}