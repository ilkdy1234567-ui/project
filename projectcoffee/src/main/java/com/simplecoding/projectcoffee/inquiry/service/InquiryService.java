package com.simplecoding.projectcoffee.inquiry.service;

import com.simplecoding.projectcoffee.inquiry.mapper.InquiryMapper;
import com.simplecoding.projectcoffee.inquiry.vo.Inquiry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InquiryService {
    @Autowired
    private InquiryMapper inquiryMapper;

    public List<Inquiry> getMyInquiries(String cuNumber) {
        return inquiryMapper.selectMyInquiryList(cuNumber);
    }

    public void createInquiry(Inquiry inquiry) {
        inquiryMapper.insertInquiry(inquiry);
    }
}