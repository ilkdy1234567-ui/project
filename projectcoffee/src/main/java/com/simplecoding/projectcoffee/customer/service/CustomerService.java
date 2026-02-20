package com.simplecoding.projectcoffee.customer.service;

import com.simplecoding.projectcoffee.customer.mapper.CustomerMapper;
import com.simplecoding.projectcoffee.customer.vo.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerService {
    @Autowired
    CustomerMapper customerMapper;

    // 추가: 특정 고객이 이미 있는지 확인하는 메서드
    public Customer selectCustomer(String cuNumber) {
        return customerMapper.selectCustomer(cuNumber);
    }

    public void insert(Customer customer) throws Exception {
        // [수정] 중복 체크 로직 추가
        Customer existing = customerMapper.selectCustomer(customer.getCuNumber());
        if (existing == null) {
            customerMapper.insert(customer);
        }
        // 이미 존재한다면 insert를 건너뛰어 에러를 방지합니다.
    }

    public void delete(String cuNumber) {
        customerMapper.delete(cuNumber);
    }
}