package com.simplecoding.simpleservice.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

/**
 * @author : GGG
 * @fileName : Criteria
 * @since : 2024-04-02 description : 
 *      공통 클래스 
 *      페이징처리 목적
 *      전자정부 프레임워크에서 가져옴
 */
@Getter
@Setter
@ToString
public class Criteria implements Serializable {
	/**
	 * serialVersion UID, 안하면 @SuppressWarnings("serial") 사용해야함
	 */
	private static final long serialVersionUID = -858838578081269359L;

	/** 검색조건 */
	private String searchCondition = "";

	/** TODO: 검색Keyword가 저장됨 : 벡엔드(String searchKeyword) == 프론트(name="searchKeyword") */
	private String searchKeyword = "";

	/** 검색사용여부 */
	private String searchUseYn = "";

	/** 현재페이지 */
	private int pageIndex = 1;

	/** 페이지갯수 */
	private int pageUnit = 10;

	/** 페이지사이즈 */
	private int pageSize = 10;

	/** firstIndex */
	private int firstIndex = 1;

	/** lastIndex */
	private int lastIndex = 1;

	/** recordCountPerPage : 1페이지당 화면에 보일 개수 */
	private int recordCountPerPage = 10;

	private String insertTime;

	private String updateTime;

}
