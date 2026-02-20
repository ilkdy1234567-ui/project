package com.simplecoding.projectcoffee.inquiry.mapper;

import com.simplecoding.projectcoffee.inquiry.vo.Inquiry;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface InquiryMapper {
    // 1. 내 문의 내역 보기 (전화번호 기준)
    List<Inquiry> selectMyInquiryList(String cuNumber);

    // 2. 문의하기 (등록)
    int insertInquiry(Inquiry inquiry);

    // 3. 문의 상세 보기
    Inquiry selectInquiryDetail(int inquiryId);
}