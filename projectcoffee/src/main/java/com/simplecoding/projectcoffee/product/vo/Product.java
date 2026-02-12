package com.simplecoding.projectcoffee.product.vo;

import com.simplecoding.projectcoffee.common.Criteria;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@EqualsAndHashCode(callSuper = false)
public class Product extends Criteria {     // 각 테이블에 대한 객체
    private String uuid;
    private int storeId;
    private int categoryId;
    private String productName;
    private String description;
    private int price;
    private Integer stockQuantity; // 메뉴는 null 가능
    private String imageUrl="https://placehold.co/600x400";
    private String isAvailable;
    private String productType;
    private Date createdDate;
    private MultipartFile fileData;
}
