        package com.simplecoding.projectcoffee.menu.controller;

        import com.simplecoding.projectcoffee.menu.service.MenuService;
        import com.simplecoding.projectcoffee.menu.vo.Menu;
        import com.simplecoding.projectcoffee.common.CommonUtil;
        import com.simplecoding.projectcoffee.common.Criteria;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.http.ContentDisposition;
        import org.springframework.http.HttpHeaders;
        import org.springframework.http.MediaType;
        import org.springframework.http.ResponseEntity;
        import org.springframework.stereotype.Controller;
        import org.springframework.ui.Model;
        import org.springframework.web.bind.annotation.*;

        import java.nio.charset.StandardCharsets;
        import java.util.List;

        @Controller
        public class MenuController {

            @Autowired
            MenuService menuService;
            @Autowired
            CommonUtil commonUtil;

            @GetMapping("/menu/all")                                // 인터넷주소
            public String selectMenuList(Model model,
                                         @ModelAttribute Criteria criteria) {
                //      TODO: 1) 오프셋(배열 순번) 자동계산 함수 실행: 매개변수(현재페이지)
                criteria.setPageOffset(criteria.getPage());
                //      TODO: 2) 총개수 구하기 함수 실행
                int count = menuService.selectMenuListTotCnt(criteria);
                criteria.calculateTotalPage(count);                   // 총페이지수 구해주는 함수: 매개변수(총개수)
                model.addAttribute("criteria", criteria); // jsp 전송(criteria 객체)

                //        업무용 부서 서비스객체: 부서 전체조회 실행 -> 결과: 부서 배열
                List<Menu> list = menuService.selectMenuList(criteria);
                model.addAttribute("list", list);
                // jsp로 배열(list) 전송

                return "/menu";                           // dept(폴더명), dept_all(jsp명)
            }

            //  TODO: 여기
            //    2) 추가 페이지 열기 함수(조회)
            //    URL     @GetMapping("/fileDb/addition")
            //    메소드   createFileDbView
            //    매개변수 없음
            //    JSP     fileDb/add_fileDb
            @GetMapping("/add") // 추가 인터넷주소
            public String createFileDbView() {
                return "menu/add_menu";   // fileDb(폴더명), add_fileDb(jsp명)
            }

            //    TODO: 저장
            //   3) 저장버튼을 누르면 db에 저장하기(325페이지)
            //    url      @PostMapping("/fileDb/add")
            //    메소드    insert
            //    매개변수  @ModelAttribute FileDb fileDb
            //    JSP      redirect:/fileDb
            //    파일을 다루면 예외처리를 반드시 해야 합니다. : 1) try/catch 2) throws
            @PostMapping("/save")   // 인터넷주소
            public String insert(@ModelAttribute Menu menu) throws Exception { // 의미: 화면에서 입력한 정보를 fileDb 임시저장
                menuService.insert(menu);
                return "redirect:/save_menu";   // 강제로 페이지이동(redirect) => 전체조회 페이지 주소(/dept)
            }

            // 이미지 인터넷 주소: http://localhost:8080/download/fileDb/이미지명(uuid)
            // commonUtil.generateUrl("fileDb",uuid); 함수가 만듬(서비스에서 코딩됨)
            @GetMapping("/download")
            @ResponseBody
            public ResponseEntity<byte[]> fileDownload(@RequestParam(defaultValue = "") String uuid) throws Exception {

                // pc에 저장된 파일 uuid(이미지명)로 가져오기
                byte[] file = commonUtil.readFile(uuid);

                // ContentDisposition 사용 (브라우저 호환성 보장) : 첨부파일 설명 만들기(이미지명 등)
                ContentDisposition contentDisposition = ContentDisposition.attachment()         // 첨부파일 설명 넣기 준비
                        .filename(uuid, StandardCharsets.UTF_8)                                 // 이미지명(uuid)
                        .build();                                                               // 위 설정 만듬

                return ResponseEntity.ok()                                                      // ok 신호(200번) ,
                        .contentType(MediaType.APPLICATION_OCTET_STREAM)                        // 문서종류: 이진 파일(이미지, 동영상 등)
                        .header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition.toString()) // 위에서 만든 첨부파일 설명 넣기(이미지명 등)
                        .body(file);                                                            // 실제 첨부파일(file)
            }

            @PostMapping("/delete")   // 인터넷주소
            public String delete(@RequestParam(defaultValue = "") String uuid) {
                menuService.delete(uuid);     //        db 서비스 FileDb 삭제
                return "redirect:/delete_menu";      // redirect(강제페이지 이동:/fileDb(전체조회페이지))
            }
            // ================== 메뉴 화면 이동 ==================

            @GetMapping("/menu")
            public String menu(Model model) {
                model.addAttribute("list", menuService.getMenuByCategory(1));
                return "menu";
            }

            @GetMapping("/beverage")
            public String beverage(Model model) {
                model.addAttribute("list",
                        menuService.getMenuByCategory(2));
                return "beverage";
            }

            @GetMapping("/dessert")
            public String dessert(Model model) {
                model.addAttribute("list",
                        menuService.getMenuByCategory(3));
                return "dessert";
            }

            @GetMapping("/goods")
            public String goods(Model model) {
                model.addAttribute("list",
                        menuService.getMenuByCategory(5));
                return "goods";
            }

            @GetMapping("/shop")
            public String shop(Model model) {
                model.addAttribute("list",
                        menuService.getMenuByCategory(4));
                return "shop";
            }
        }


