    package com.simplecoding.projectcoffee.menu.service;

    import com.simplecoding.projectcoffee.menu.mapper.MenuMapper;
    import com.simplecoding.projectcoffee.menu.vo.Menu;
    import com.simplecoding.projectcoffee.common.CommonUtil;
    import com.simplecoding.projectcoffee.common.Criteria;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Service;

    import java.util.List;
    import java.util.UUID;

    // @Service
    // - IOC 컨테이너가 실행 시 ProductService 객체를 생성
    // - 상품 비즈니스 로직을 담당
    @Service
    public class MenuService {

        @Autowired
        MenuMapper menuMapper;
        @Autowired
         CommonUtil commonUtil;

        // 1️⃣ 상품 전체 조회
        public List<Menu> selectMenuList(Criteria criteria) {
            return menuMapper.selectMenuList(criteria);
        }
    //총개수 구하기
        public int selectMenuListTotCnt(Criteria criteria){
            return menuMapper.selectMenuListTotCnt(criteria);
        }


        public void insert(Menu menu)throws Exception {
    //        uuid
            String uuid = UUID.randomUUID().toString();
            menu.setPUuid(uuid);
            //  2) 첨부파일을 올릴때만 아래를 실행: (첨부파일 크기>0)
            if (menu.getFileData().getSize() >0) { // 첨부파일 크기>0
    //        - 가) 이미지의 인터넷 주소(사용자가 다운로드 받는 주소) 만들기, fileDb setter 로 임시저장
    //            사용법) commonUtil.generateUrl("폴더명",이미지파일명);
                String url = commonUtil.generateUrl("menu", uuid);
                menu.setImgUrl(url);
    //        - 나) pc 의 특정 위치에 이미지를 저장( 이미지 파일명이 중복이 되면 안됨(uuid:이미지파일명))
    //          사용법) commonUtil.saveFile(첨부파일,이미지파일명);
                commonUtil.saveFile(menu.getFileData(), uuid);

            }
            menuMapper.insert(menu);  // db 저장
        }
        public void delete(String uuid) {
            commonUtil.deleteFile(uuid);  // 1) pc 이미지도 삭제
            menuMapper.delete(uuid);    // 2) db 삭제
        }
    }
