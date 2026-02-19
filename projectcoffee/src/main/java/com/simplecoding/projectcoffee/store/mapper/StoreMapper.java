package com.simplecoding.projectcoffee.store.mapper;

import com.simplecoding.projectcoffee.store.vo.Store;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StoreMapper {
    List<Store> selectStoreList();
}
