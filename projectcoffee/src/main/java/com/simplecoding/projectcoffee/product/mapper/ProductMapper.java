package com.simplecoding.projectcoffee.product.mapper;

import com.simplecoding.projectcoffee.product.vo.Product;
import com.simplecoding.projectcoffee.common.Criteria;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper

public interface ProductMapper {

        List<?> selectProductList(Criteria criteria);   //전체조회
        int selectProductListTotCnt(Criteria criteria);  //총개수 구하기
        int insert(Product product);  //추가
        int delete(String uuid);
}

