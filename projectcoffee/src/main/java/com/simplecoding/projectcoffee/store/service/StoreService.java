package com.simplecoding.projectcoffee.store.service;

import com.simplecoding.projectcoffee.store.mapper.StoreMapper;
import com.simplecoding.projectcoffee.store.vo.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StoreService {
    @Autowired
    private StoreMapper storeMapper;
    public List<Store>findAll(){
        return storeMapper.selectStoreList();
    }
}
