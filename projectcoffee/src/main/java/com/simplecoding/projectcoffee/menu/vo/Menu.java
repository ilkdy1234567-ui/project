package com.simplecoding.projectcoffee.menu.vo;

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
public class Menu extends Criteria {     // 각 테이블에 대한 객체
    private String pUuid;
    private String pname;        // P_NAME
    private String description;  // DESCRIPTION
    private int price;           // PRICE
    private String imgUrl;       // IMG_URL
    private String isAvailable;  // IS_AVAILABLE
    private Date cDate;          // C_DATE
    private int squantity;
    private int categoryId;      // CATEGORY_ID
    private MultipartFile fileData;
    private String subtitle;

}
