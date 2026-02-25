<%--
  Created by IntelliJ IDEA.
  User: khuser
  Date: 26. 2. 12.
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공지사항 | YEOWUN COFFEE</title>

  <!-- 외부 폰트 및 라이브러리 -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Playfair+Display:wght@400;700&family=Cormorant+Garamond:wght@400;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

  <!-- 커스텀 CSS -->
  <link rel="stylesheet" href="/css/style.css">
</head>
<iframe name="cartHiddenFrame" id="cartHiddenFrame" style="display:none;"></iframe>
<body>

<!-- 상단 네비게이션 -->
<%--모바일 사이드바--%>
<jsp:include page="/common/header.jsp"></jsp:include>

<!-- 공지사항 섹션 -->
<section class="section">
  <div class="container" style="max-width: 1200px;">

    <!-- 검색 바 -->
    <div style="margin-bottom: 40px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 20px;" data-aos="fade-up">
      <div>
        <p style="color: #666;">총 <strong style="color: var(--accent-gold);">10,000</strong>건의 공지사항이 있습니다.</p>
      </div>
      <div style="display: flex; gap: 10px;">
        <input type="text" placeholder="검색어를 입력하세요" style="padding: 12px 20px; border: 1px solid #ddd; border-radius: 25px; width: 300px; font-size: 0.95rem;">
        <button style="padding: 12px 30px; background: var(--accent-gold); color: white; border: none; border-radius: 25px; cursor: pointer; font-weight: 600;">
          <i class="fas fa-search"></i> 검색
        </button>
      </div>
    </div>

    <!-- 공지사항 테이블 -->
    <div style="background: white; border-radius: 15px; overflow: hidden; box-shadow: 0 2px 15px rgba(0,0,0,0.05);" data-aos="fade-up">
      <table style="width: 100%; border-collapse: collapse;">
        <thead>
        <tr style="background: #f8f5f0; border-bottom: 2px solid #e5e5e5;">
          <th style="padding: 20px; text-align: center; width: 80px; font-weight: 600; color: var(--text-dark);">번호</th>
          <th style="padding: 20px; text-align: left; font-weight: 600; color: var(--text-dark);">제목</th>
          <th style="padding: 20px; text-align: center; width: 120px; font-weight: 600; color: var(--text-dark);">작성일</th>
          <th style="padding: 20px; text-align: center; width: 100px; font-weight: 600; color: var(--text-dark);">조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="notice" items="${noticeList}">
          <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;"
              onclick="location.href='/notice/detail?noticeId=${notice.noticeId}';">

              <%-- 번호 또는 중요 표시 --%>
            <td style="padding: 18px; text-align: center;">
              <c:choose>
                <c:when test="${notice.important eq 'Y'}">
                  <span style="color: var(--accent-gold); font-weight: 600;"><i class="fas fa-star"></i></span>
                </c:when>
                <c:otherwise>
                  ${notice.noticeId}
                </c:otherwise>
              </c:choose>
            </td>

              <%-- 제목 --%>
            <td style="padding: 18px;">
              <c:if test="${notice.important eq 'Y'}">
                <span style="color: var(--accent-gold); font-weight: 600;">[필독]</span>
              </c:if>
                ${notice.title}
            </td>

              <%-- 날짜 --%>
            <td style="padding: 18px; text-align: center; color: #999;">${notice.CDate}</td>

              <%-- 조회수 --%>
            <td style="padding: 18px; text-align: center; color: #999;">${notice.viewCount}</td>
          </tr>
        </c:forEach>

        <%-- 데이터가 없을 때 처리 --%>
        <c:if test="${empty noticeList}">
          <tr>
            <td colspan="4" style="padding: 50px; text-align: center; color: #999;">등록된 공지사항이 없습니다.</td>
          </tr>
        </c:if>
        </tbody>
      </table>
    </div>

    <!-- 페이지네이션 -->
    <div style="display: flex; justify-content: center; align-items: center; margin-top: 50px;" data-aos="fade-up">
      <button style="padding: 10px 15px; border: 1px solid var(--accent-gold); background: var(--accent-gold); color: white; font-weight: 600; cursor: pointer; border-radius: 5px;">1</button>
    </div>

  </div>
</section>

<!-- 푸터 -->
<jsp:include page="/common/footer.jsp"></jsp:include>
<!-- 플로팅 버튼 (장바구니 & TOP) -->
<form id="addForm" name="addForm" method="post" target="cartHiddenFrame">
<div id="floating-btns">
  <div class="cart-dashboard" id="cart-dashboard">
    <div style="background:var(--text-dark); color:#fff; padding:15px; text-align:center; font-weight:700;">SHOPPING BAG</div>
    <div id="cart-items-list"></div>
    <div style="padding:20px; border-top:1px solid #eee;">
      <div style="display:flex; justify-content:space-between; margin-bottom:15px; font-weight:700;"><span>최종 합계</span><span id="total-price-display" style="color:var(--accent-gold);">0원</span></div>
      <button type="button" class="btn-order-now" onclick="processOrder()">주문하기</button>
    </div>
  </div>
  <div class="float-item cart-btn" onclick="toggleDashboard()"><i class="fas fa-shopping-bag"></i><span class="cart-count" id="cart-count">0</span></div>
  <div class="float-item top-btn" id="top-btn" onclick="window.scrollTo({top:0, behavior:'smooth'})"><i class="fas fa-arrow-up"></i></div>
</div>
</form>
<!-- 주문서 모달 -->
<div class="order-modal" id="orderModal">
  <div class="order-paper">
    <h3>ORDER SHEET</h3>

    <!-- 주문 메뉴 리스트 추가 -->
    <div class="order-form-group">
      <label><i class="fas fa-shopping-cart"></i> 주문 메뉴</label>
      <div id="order-menu-list" style="background: #f8f5f0; padding: 15px; border-radius: 10px; max-height: 150px; overflow-y: auto; font-size: 0.9rem;"></div>
    </div>

    <div class="order-form-group">
      <label><i class="fas fa-phone"></i> 연락처</label>
      <input type="text"
             class="order-input"
             id="order-phone"
             name="cuNumber"
             value="${sessionScope.cuNumber}"
             placeholder="010-0000-0000 (숫자만 입력)">
    </div>jquery
    <div class="order-form-group">
      <label><i class="fas fa-clock"></i> 픽업 예정 시간</label>
      <select class="order-select" id="order-time">
        <option value="10분 후">10분 후</option>
        <option value="20분 후">20분 후</option>
        <option value="30분 후">30분 후</option>
      </select>
    </div>
    <div class="order-form-group">
      <label><i class="fas fa-pen"></i> 추가 요청사항</label>
      <textarea class="order-textarea" id="order-memo" placeholder="예: 이 번호로 적립해주세요 / 시럽 빼주세요"></textarea>
    </div>
    <div class="order-summary">
      <div class="order-row"><span>주문 내역</span><span id="final-item-count">0건</span></div>
      <div class="order-row" style="font-weight: 700; color: var(--accent-gold); border-top: 1px solid #ddd; margin-top: 10px; padding-top: 10px;">
        <span>최종 결제 금액</span><span id="final-order-price">0원</span>
      </div>
    </div>
    <button class="btn-final-order" onclick="confirmFinalOrder()">주문 확정하기</button>
    <p onclick="closeOrderModal()" style="text-align:center; margin-top:15px; font-size:0.8rem; color:#aaa; cursor:pointer; text-decoration:underline;">취소하고 돌아가기</p>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 외부 스크립트 -->
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="/js/script.js"></script>

</body>
</html>