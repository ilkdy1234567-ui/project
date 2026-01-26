<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 26. 1. 23.
  Time: 오후 4:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Dept</title>
    <meta charset="UTF-8">
    <meta name="description" content="부서 추가 페이지입니다.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 	tailwind cdn  -->
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <!-- 	개발자가 만든 css -->
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%--머리말: 메뉴 포함 --%>
<jsp:include page="/common/header.jsp"></jsp:include>

<div  class="container mx-auto mt-8 px-3" >
    <h1 class="text-2xl font-bold mb-6">부서 추가</h1>
<%-- 인터넷 통신 약속(method): 조회(GET), 추가(저장)/수정/삭제(POST)   --%>
<%--    action="컨트롤러-인터넷주소"--%>
    <form id="addForm" name="addForm" action="" method="post">
        <div class="mb-4">
            <label for="dname" class="block mb-1">dname</label>
<%--        벡엔드 전송 값: name 속성의 이름으로 input 태그 값이 전송됨    --%>
            <input type="text"
                   class="w-full border border-gray-300 rounded p-2 focus:outline-none focus:ring focus:ring-blue-500"
                   id="dname"
                   name="dname"
                   placeholder="부서명">
        </div>

        <div class="mb-4">
            <label for="loc" class="block mb-1">loc</label>
            <input type="text"
                   class="w-full border border-gray-300 rounded p-2 focus:outline-none focus:ring focus:ring-blue-500"
                   id="loc"
                   name="loc"
                   placeholder="부서위치">
        </div>

<%--    html 태그의 onclick 속성: 태그을 클릭하면 안에 js 함수가 실행됨    --%>
        <div class="mb-4">
            <button type="button"
                    class="w-full bg-blue-700 text-white p-2 rounded hover:bg-blue-800"
                    onclick="fn_save()"
            >저장
            </button>
        </div>
    </form>
</div>

<%-- jquery 인터넷 주소 넣기 --%>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script>
    function fn_save() {
        // action 속성: 컨트롤러 인터넷주소(저장)
        $("#addForm").attr("action","/dept/add")
            .submit();                            // 저장 요청, /dept/add 컨트롤러에 요청
    }
</script>

</body>
</html>
