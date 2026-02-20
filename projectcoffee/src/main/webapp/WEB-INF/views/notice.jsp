<%--
  Created by IntelliJ IDEA.
  User: khuser
  Date: 26. 2. 12.
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<body>

<!-- 상단 네비게이션 -->
<nav id="navbar">
  <div class="mobile-menu-btn" onclick="toggleSidebar()"><i class="fas fa-bars"></i></div>

  <ul class="nav-menu">
    <li class="nav-item"><a href="#">브랜드</a><div class="dropdown"><a href="/brand.html">여운 스토리</a></div></li>
    <li class="nav-item"><a href="#">메뉴</a><div class="dropdown"><a href="/menu.html">커피 (Coffee)</a><a href="/beverage.html">음료 (Beverage)</a><a href="./dessert.html">디저트 (Dessert)</a></div></li>
    <li class="nav-item"><a href="#">온라인 숍</a><div class="dropdown"><a href="/shop.html">원두/드립백</a><a href="/goods.html">홈카페 굿즈</a></div></li>
    <li class="nav-item"><a href="#">매장안내</a><div class="dropdown"><a href="/store.html">매장 찾기</a></div></li>
    <li class="nav-item"><a href="#">고객지원</a><div class="dropdown"><a href="/notice.html">공지사항</a><a href="/contact.html">1:1 문의</a></div></li>
  </ul>

  <a href="./index.html" class="logo">YEOWUN<span>餘韻</span></a>

  <div class="nav-sns">
    <div class="sns-box" id="user-icon-btn" onclick="handleUserIcon()" style="cursor:pointer;">
      <i class="fas fa-user" id="user-icon"></i>
      <span class="sns-tooltip" id="user-tooltip">로그인</span>
    </div>
    <div class="sns-box"><i class="fab fa-instagram"></i><span class="sns-tooltip">Instagram</span></div>
    <div class="sns-box"><i class="fas fa-comment"></i><span class="sns-tooltip">KakaoTalk</span></div>
    <div class="sns-box"><i class="fab fa-facebook-f"></i><span class="sns-tooltip">Facebook</span></div>
  </div>
</nav>

<!-- 모바일 사이드바 -->
<div class="mobile-sidebar" id="mobileSidebar">
  <div class="mobile-sidebar-close" onclick="toggleSidebar()"><i class="fas fa-times"></i></div>
  <ul>
    <li>
      <a href="#" style="cursor: default;">브랜드</a>
      <div class="mobile-submenu">
        <a href="/brand.html">여운 스토리</a>
      </div>
    </li>
    <li>
      <a href="#" style="cursor: default;">메뉴</a>
      <div class="mobile-submenu">
        <a href="/menu.html">커피 (Coffee)</a>
        <a href="/beverage.html">음료 (Beverage)</a>
        <a href="/dessert.html">디저트 (Dessert)</a>
      </div>
    </li>
    <li>
      <a href="#" style="cursor: default;">온라인 숍</a>
      <div class="mobile-submenu">
        <a href="/shop.html">원두/드립백</a>
        <a href="/goods.html">홈카페 굿즈</a>
      </div>
    </li>
    <li>
      <a href="#" style="cursor: default;">매장안내</a>
      <div class="mobile-submenu">
        <a href="/store.html">매장 찾기</a>
      </div>
    </li>
    <li>
      <a href="#" style="cursor: default;">고객지원</a>
      <div class="mobile-submenu">
        <a href="/notice.html">공지사항</a>
        <a href="/contact.html">1:1 문의</a>
      </div>
    </li>
  </ul>
  <div class="footer-sns-icons" style="margin-top: 40px; justify-content: flex-start;">
    <a href="#" class="f-icon"><i class="fab fa-instagram"></i></a>
    <a href="#" class="f-icon"><i class="fab fa-facebook-f"></i></a>
    <a href="#" class="f-icon"><i class="fas fa-comment"></i></a>
  </div>
</div>

<!-- 페이지 헤더 (타이틀 배너) -->
<header class="page-header" style="background-image: url('https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?w=1200'); background-position: center;">
  <div class="page-header-content">
    <h1 data-aos="fade-up">NOTICE</h1>
    <p data-aos="fade-up" data-aos-delay="100">여운의 새로운 소식을 확인하세요</p>
    <div class="breadcrumb" data-aos="fade-up" data-aos-delay="200">
      <a href="./index.html">HOME</a> <i class="fas fa-chevron-right"></i>
      <a href="#">고객지원</a> <i class="fas fa-chevron-right"></i>
      <span>공지사항</span>
    </div>
  </div>
</header>

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
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: var(--accent-gold); font-weight: 600;"><i class="fas fa-star"></i></td>
          <td style="padding: 18px;"><span style="color: var(--accent-gold); font-weight: 600;">[필독]</span> 2월 정기 점검 안내</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.02.10</td>
          <td style="padding: 18px; text-align: center; color: #999;">1,234</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">10000</td>
          <td style="padding: 18px;">신규 매장 오픈 안내 (강남 3호점)</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.02.09</td>
          <td style="padding: 18px; text-align: center; color: #999;">856</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9999</td>
          <td style="padding: 18px;">발렌타인데이 특별 이벤트</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.02.08</td>
          <td style="padding: 18px; text-align: center; color: #999;">2,341</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9998</td>
          <td style="padding: 18px;">겨울 시즌 한정 메뉴 출시</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.02.07</td>
          <td style="padding: 18px; text-align: center; color: #999;">1,567</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9997</td>
          <td style="padding: 18px;">멤버십 포인트 적립률 변경 안내</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.02.06</td>
          <td style="padding: 18px; text-align: center; color: #999;">987</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9996</td>
          <td style="padding: 18px;">드립백 신제품 출시 안내</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.02.05</td>
          <td style="padding: 18px; text-align: center; color: #999;">1,423</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9995</td>
          <td style="padding: 18px;">설 연휴 매장 운영 시간 안내</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.02.04</td>
          <td style="padding: 18px; text-align: center; color: #999;">765</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9994</td>
          <td style="padding: 18px;">모바일 앱 업데이트 안내 (v2.1.0)</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.02.03</td>
          <td style="padding: 18px; text-align: center; color: #999;">654</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9993</td>
          <td style="padding: 18px;">온라인 스토어 배송 정책 변경</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.02.02</td>
          <td style="padding: 18px; text-align: center; color: #999;">892</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9992</td>
          <td style="padding: 18px;">1월 이달의 원두 소개</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.02.01</td>
          <td style="padding: 18px; text-align: center; color: #999;">1,123</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9991</td>
          <td style="padding: 18px;">신규 멤버십 등급 혜택 안내</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.01.31</td>
          <td style="padding: 18px; text-align: center; color: #999;">2,015</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9990</td>
          <td style="padding: 18px;">커피 원두 가격 조정 안내</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.01.30</td>
          <td style="padding: 18px; text-align: center; color: #999;">1,678</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9989</td>
          <td style="padding: 18px;">부산 해운대점 리뉴얼 오픈</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.01.29</td>
          <td style="padding: 18px; text-align: center; color: #999;">945</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9988</td>
          <td style="padding: 18px;">겨울 시즌 MD 굿즈 출시</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.01.28</td>
          <td style="padding: 18px; text-align: center; color: #999;">1,234</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9987</td>
          <td style="padding: 18px;">개인정보처리방침 개정 안내</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.01.27</td>
          <td style="padding: 18px; text-align: center; color: #999;">567</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9986</td>
          <td style="padding: 18px;">고객센터 운영 시간 변경 안내</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.01.26</td>
          <td style="padding: 18px; text-align: center; color: #999;">423</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9985</td>
          <td style="padding: 18px;">봄 시즌 신메뉴 사전 공개</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.01.25</td>
          <td style="padding: 18px; text-align: center; color: #999;">3,127</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9984</td>
          <td style="padding: 18px;">로스팅 클래스 2월 일정 안내</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.01.24</td>
          <td style="padding: 18px; text-align: center; color: #999;">1,892</td>
        </tr>
        <tr style="border-bottom: 1px solid #f0f0f0; cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9983</td>
          <td style="padding: 18px;">단체 주문 할인 이벤트</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.01.23</td>
          <td style="padding: 18px; text-align: center; color: #999;">756</td>
        </tr>
        <tr style="cursor: pointer;" onmouseover="this.style.background='#fafafa'" onmouseout="this.style.background='white'" onclick="location.href='./notice_detail.html';">
          <td style="padding: 18px; text-align: center; color: #666;">9982</td>
          <td style="padding: 18px;">결제 시스템 점검 안내</td>
          <td style="padding: 18px; text-align: center; color: #999;">2026.01.22</td>
          <td style="padding: 18px; text-align: center; color: #999;">534</td>
        </tr>
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
<footer class="main-footer">
  <div class="footer-top">
    <div class="footer-brand">
      <a href="#" class="footer-logo">YEOWUN <span>餘韻</span></a>
      <p class="footer-slogan">한 잔의 커피, 그 이상의 깊은 여운을 남깁니다.<br>예멘 고산지대의 순수함을 당신의 일상에 전합니다.</p>
      <div class="footer-sns-icons">
        <a href="#" class="f-icon"><i class="fab fa-instagram"></i></a>
        <a href="#" class="f-icon"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="f-icon"><i class="fas fa-comment"></i></a>
        <a href="#" class="f-icon"><i class="fab fa-youtube"></i></a>
      </div>
    </div>
    <div class="footer-info-col">
      <h5>ABOUT</h5>
      <ul>
        <li>브랜드 스토리</li>
        <li>매장 안내</li>
        <li>원두 이야기</li>
        <li>채용 공고</li>
      </ul>
    </div>
    <div class="footer-info-col">
      <h5>SUPPORT</h5>
      <ul>
        <li>고객센터</li>
        <li>자주 묻는 질문</li>
        <li>1:1 문의</li>
        <li>대량 주문/납품 안내</li>
      </ul>
    </div>
    <div class="footer-info-col">
      <h5>CONTACT US</h5>
      <p style="font-size: 1.5rem; font-weight: 700; color: var(--text-dark); margin-bottom: 10px;">02-123-4567</p>
      <p style="font-size: 0.85rem; color: #888;">평일 09:00 - 18:00 (주말/공휴일 휴무)<br><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="beddd1d0cadfddcafec7dbd1c9cbd090ddd1d3">[email&#160;protected]</a></p>
    </div>
  </div>
  <div class="footer-bottom">
    <div class="company-details">
      (주)여운컴퍼니 | 대표자: 홍길동 | 사업자등록번호: 123-45-67890<br>
      서울특별시 강남구 테헤란로 123 여운빌딩 12층 | 통신판매업신고: 제2026-서울강남-0000호<br>
      <span style="margin-top: 10px; display: inline-block;">&copy; 2026 YEOWUN COFFEE. ALL RIGHTS RESERVED.</span>
    </div>
    <p style="font-size: 0.75rem; color: #aaa;">이용약관 | <strong>개인정보처리방침</strong> | 스팸거부정책</p>
  </div>
</footer>

<!-- 플로팅 버튼 (장바구니 & TOP) -->
<div id="floating-btns">
  <div class="cart-dashboard" id="cart-dashboard">
    <div style="background:var(--text-dark); color:#fff; padding:15px; text-align:center; font-weight:700;">SHOPPING BAG</div>
    <div id="cart-items-list"></div>
    <div style="padding:20px; border-top:1px solid #eee;">
      <div style="margin-bottom:15px;">
        <label style="display:block; margin-bottom:8px; font-size:0.9rem; color:#666;">
          <i class="fas fa-phone"></i> 연락처
        </label>
        <input type="tel" id="cart-phone" placeholder="010-0000-0000" style="width:100%; padding:12px; border:1px solid #ddd; border-radius:8px; font-size:0.95rem;">
      </div>
      <div style="display:flex; justify-content:space-between; margin-bottom:15px; font-weight:700;"><span>최종 합계</span><span id="total-price-display" style="color:var(--accent-gold);">0원</span></div>
      <button class="btn-order-now" onclick="processOrder()">주문하기</button>
    </div>
  </div>
  <div class="float-item cart-btn" onclick="toggleDashboard()"><i class="fas fa-shopping-bag"></i><span class="cart-count" id="cart-count">0</span></div>
  <div class="float-item top-btn" id="top-btn" onclick="window.scrollTo({top:0, behavior:'smooth'})"><i class="fas fa-arrow-up"></i></div>
</div>

<!-- 주문서 모달 -->
<div class="order-modal" id="orderModal">
  <div class="order-paper">
    <h3>ORDER SHEET</h3>

    <div class="order-form-group">
      <label><i class="fas fa-shopping-cart"></i> 주문 메뉴</label>
      <div id="order-menu-list" style="background: #f8f5f0; padding: 15px; border-radius: 10px; max-height: 150px; overflow-y: auto; font-size: 0.9rem;"></div>
    </div>

    <div class="order-form-group">
      <label><i class="fas fa-phone"></i> 연락처</label>
      <input type="text" class="order-input" id="order-phone" placeholder="010-0000-0000 (숫자만 입력)">
    </div>
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

<!-- 외부 스크립트 -->
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="/js/script.js"></script>


<!-- 로그인 모달 -->
<div class="order-modal" id="loginModal">
  <div class="order-paper" style="max-width:400px; margin:auto;">
    <div style="text-align:center; margin-bottom:25px;">
      <div style="width:60px; height:60px; background:var(--accent-gold); border-radius:50%; display:flex; align-items:center; justify-content:center; margin:0 auto 15px;">
        <i class="fas fa-user" style="color:#fff; font-size:1.4rem;"></i>
      </div>
      <h3 style="margin:0; font-size:1.3rem; letter-spacing:3px;">LOGIN</h3>
      <p style="color:#999; font-size:0.85rem; margin-top:8px;">전화번호로 간편하게 로그인하세요</p>
    </div>
    <div class="order-form-group">
      <label><i class="fas fa-phone"></i> 전화번호</label>
      <input type="tel" class="order-input" id="login-phone" placeholder="010-0000-0000 (숫자만 입력)" maxlength="13" oninput="formatPhoneInput(this)">
    </div>
    <button class="btn-final-order" onclick="loginWithPhone()">로그인</button>
    <p onclick="closeLoginModal()" style="text-align:center; margin-top:15px; font-size:0.8rem; color:#aaa; cursor:pointer; text-decoration:underline;">닫기</p>
  </div>
</div>

<!-- 토스트 알림 -->
<div id="login-toast" style="position:fixed; bottom:40px; left:50%; transform:translateX(-50%) translateY(80px); background:#1a1a1a; color:#fff; padding:14px 28px; border-radius:50px; font-size:0.9rem; z-index:99999; transition:all 0.4s ease; opacity:0; pointer-events:none; white-space:nowrap; box-shadow:0 4px 20px rgba(0,0,0,0.3);">
  <i class="fas fa-check-circle" style="color:#ddb86e; margin-right:8px;"></i>
  <span id="login-toast-msg"></span>
</div>

</body>
</html>
