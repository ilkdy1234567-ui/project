<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Dept</title>
    <meta charset="UTF-8">
    <meta name="description" content="부서 조회 페이지입니다.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--    tailwind cdn: 인터넷주소  -->
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <!--    개발자가 만든 css: 공통 css -->
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%--머리말--%>
<jsp:include page="/common/header.jsp"></jsp:include>
<%-- 테일윈드 css: 미리 css 를 만들어 놓았음, 디자이너(개발자) -> 태그에 해당 class 이름만 넣으면 됨(css 프레임워크)  --%>
<%-- container : 가상의 박스를 임의의 지정함: width:100% 등 --%>
<%-- mt-8      : m(margin), t(top) 8칸 디자인 예) mt, ml(왼쪽), mr(오른쪽), mb(아래) 등 --%>
<%-- px-3      : p(padding), x(좌우), y(상하) --%>
<%-- font-bold : 글자 두껍게 --%>
<%-- 찾기 단축키: ctrl + f --%>
${list}
<%--  form 태그: action="컨트롤러 메소드의 인터넷주소", method="get" : get , 일반 조회 등은 get 방식 사용  --%>
<form class="container mx-auto mt-8 px-3" id="listForm" name="listForm" action="" method="get">

    <h1 class="text-2xl font-bold mb-6">부서 조회</h1>

    <div class="flex justify-center mb-4">
        <input type="text"
               class="w-full border border-gray-300 rounded-l p-2 focus:outline-none focus:ring focus:ring-blue-500"
               id="searchKeyword"
               name="searchKeyword"
               placeholder="부서명입력"
        >
<%--     검색 버튼: onclick="함수명()", 클릭하면 함수가 실행됩니다.   --%>
        <button class="bg-blue-700 text-white hover:bg-blue-800 px-4 py-2 rounded-r min-w-[5rem]"
                type="button"
                onclick="selectList()"
        >
            검색
        </button>
    </div>

    <table class="w-[100%] border border-gray-200">
        <%--  테이블 제목  --%>
        <thead class="bg-blue-700 text-white">
        <tr>
            <th scope="col" class="px-4 py-2 border-b">dno</th>
            <th scope="col" class="px-4 py-2 border-b">dname</th>
            <th scope="col" class="px-4 py-2 border-b">loc</th>
        </tr>
        </thead>
        <%--  테이블 내용: 부서 --%>
        <tbody>
        <%--  여기: 반복문 왜? tr태그 반복(행 반복)  --%>
<%--     자동정렬 단축키: ctrl + alt + l   --%>
<%--     반복문 사용법: <c:forEach var="변수" items="배열">   --%>
        <c:forEach var="data" items="${list}">
            <tr class="hover:bg-gray-50">
                <td class="px-4 py-2 border-b text-center">
<%--    클릭하면 상세조회 페이지 열림: 기본키(부서번호,dno) 전송   --%>
<%--    jsp 해킹방어:  <c:out ~> :보안강화 적용합시다.             --%>

                    <a href='/dept/edition?dno=<c:out value="${data.dno}" />'><c:out value="${data.dno}" /></a>
                </td>
                <td class="px-4 py-2 border-b"><c:out value="${data.dname}" /></td>
                <td class="px-4 py-2 border-b"><c:out value="${data.loc}" /></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</form>

<%-- js 코딩: selectList() --%>
<%-- jquery 인터넷 주소 --%>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>

<script>
    function selectList() {
        // 1) form 태그를(#listForm) 선택해서 action 속성에 /dept(벡엔드 주소) 넣고, 2) 벡엔드 조회 요청
        // 참고) input 태그의 값이 전송됩니다.(검색어) : name="searchKeyword", 벡엔드에서 이름으로 전달받습니다.
        $("#listForm").attr("action","/dept")  // 1) 코딩
            .submit();                         // 2) 벡엔드 조회 요청
    }
</script>
</body>
</html>



