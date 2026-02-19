package com.simplecoding.projectcoffee.store.vo;

import com.simplecoding.projectcoffee.common.Criteria;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@EqualsAndHashCode(callSuper = false)
public class Store extends Criteria {
    private int storeId;
    private String storeName;
    private String address;
    private String phone;
    private String oTime;
    private String cDate;
}
