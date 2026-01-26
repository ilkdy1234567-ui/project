<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Dept</title>
  <meta charset="UTF-8">
  <meta name="description" content="사원 상세 페이지입니다.">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!--    tailwind cdn  -->
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  <!--    개발자가 만든 css -->
  <link rel="stylesheet" href="/css/style.css">

</head>
<body>
<%-- 머리말: 메뉴 --%>
<jsp:include page="/common/header.jsp"></jsp:include>

<div class="container mx-auto mt-8 px-3" >
  <h1 class="text-2xl font-bold mb-6">사원 상세조회</h1>
  <form id="addForm" name="addForm" method="post">
    <input type="hidden" id="eno" name="eno" value="<c:out value="${empVO.eno}"/>" />
    <div class="mb-4">
      <label for="ename" class="block mb-1">ename</label>
      <input type="text"
             class="w-full border border-gray-300 rounded p-2 focus:outline-none focus:ring focus:ring-blue-500"
             id="ename"
             value=""
             placeholder="사원명">
    </div>

    <div class="mb-4">
      <label for="job" class="block mb-1">job</label>
      <input type="text"
             class="w-full border border-gray-300 rounded p-2 focus:outline-none focus:ring focus:ring-blue-500"
             id="job"
             name="job"
             value=""
             placeholder="직위">
    </div>

    <div class="mb-4">
      <label for="manager" class="block mb-1">manager</label>
      <input type="text"
             class="w-full border border-gray-300 rounded p-2 focus:outline-none focus:ring focus:ring-blue-500"
             id="manager"
             name="manager"
             value=""
             placeholder="관리자사원번호">
    </div>

    <div class="mb-4 flex gap-2">
      <button type="button"
              class="flex-1 bg-green-700 text-white p-2 rounded hover:bg-green-800"
      >
        수정
      </button>
      <button type="button"
              class="flex-1 bg-red-600 text-white p-2 rounded hover:bg-red-700"
      >
        삭제
      </button>
    </div>
  </form>

</div>

</body>
</html>



