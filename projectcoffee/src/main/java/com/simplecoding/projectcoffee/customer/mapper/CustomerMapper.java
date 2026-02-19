package com.simplecoding.projectcoffee.customer.mapper;

import com.simplecoding.projectcoffee.customer.vo.Customer;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CustomerMapper {
    int insert(Customer customer);
    int delete(String cuNumber);
    Customer selectCustomer(String cuNumber);
}
