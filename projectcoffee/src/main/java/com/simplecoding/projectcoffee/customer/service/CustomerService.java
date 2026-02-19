package com.simplecoding.projectcoffee.customer.service;

import com.simplecoding.projectcoffee.customer.mapper.CustomerMapper;
import com.simplecoding.projectcoffee.customer.vo.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerService {
    @Autowired
    CustomerMapper customerMapper;
    public void insert(Customer customer) throws Exception {
        customerMapper.insert(customer); // 이름 수정
    }
    public void delete(String cuNumber) {
        customerMapper.delete(cuNumber); // 이름 수정
    }
}
