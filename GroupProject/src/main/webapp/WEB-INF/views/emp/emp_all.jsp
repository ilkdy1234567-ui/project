<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Dept</title>
    <meta charset="UTF-8">
    <meta name="description" content="사원 조회 페이지입니다.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 	tailwind cdn  -->
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <!-- 	개발자가 만든 css -->
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%-- 퀴즈: 사원에 검색기능을 추가해 주세요. 벡엔드: /emp --%>
<%--머리말 --%>
<jsp:include page="/common/header.jsp"></jsp:include>
${list}
<%-- 1) action, method 속성 --%>
<form class="container mx-auto mt-8 px-3" id="listForm" name="listForm" action="" method="get">

    <h1 class="text-2xl font-bold mb-6">사원 조회</h1>

    <div class="flex justify-center mb-4">
        <input type="text"
               class="w-full border border-gray-300 rounded-l p-2 focus:outline-none focus:ring focus:ring-blue-500"
               id="searchKeyword"
               name="searchKeyword"
               placeholder="사원명입력"
        >
<%--    2) onclick="함수명" --%>
        <button class="bg-blue-700 text-white hover:bg-blue-800 px-4 py-2 rounded-r min-w-[5rem]"
                type="button"
                onclick="selectList()"
        >
            검색
        </button>
    </div>

    <table class="w-[100%] border border-gray-200">
        <%--     사원 테이블 제목   --%>
        <thead class="bg-blue-700 text-white">
        <tr>
            <th scope="col" class="px-4 py-2 border-b">eno</th>
            <th scope="col" class="px-4 py-2 border-b">ename</th>
            <th scope="col" class="px-4 py-2 border-b">job</th>
            <th scope="col" class="px-4 py-2 border-b">manager</th>
        </tr>
        </thead>
        <%--    사원 테이블 데이터 --%>
        <tbody>
        <%--     TODO: 여기 반복문 실행(행 반복)   --%>
        <c:forEach var="data" items="${list}">
            <tr class="hover:bg-gray-50">
                <td class="px-4 py-2 border-b text-center">
<%--        클릭하면 상세조회 페이지 열기: 기본키(사원번호, eno) 전송            --%>
<%--        보안코딩: <c:out ~>            --%>
                    <a href='/emp/edition?eno=<c:out value="${data.eno}" />'><c:out value="${data.eno}" /></a>
                </td>
                <td class="px-4 py-2 border-b"><c:out value="${data.ename}" /></td>
                <td class="px-4 py-2 border-b"><c:out value="${data.job}" /></td>
                <td class="px-4 py-2 border-b"><c:out value="${data.manager}" /></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</form>

<%-- js 코딩: selectList()--%>
<%-- jquery 인터넷 주소 --%>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>

<script>
    function selectList() {
        $("#listForm").attr("action","/emp")
            .submit();                       // 벡엔드 요청: searchKeyword 값(input) 전송
    }
</script>

</body>
</html>



