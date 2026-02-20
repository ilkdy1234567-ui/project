<%--
  Created by IntelliJ IDEA.
  User: khuser
  Date: 26. 2. 12.
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>커피 메뉴 | YEOWUN COFFEE</title>

  <!-- 외부 폰트 및 라이브러리 -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Playfair+Display:wght@400;700&family=Cormorant+Garamond:wght@400;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

  <!-- 커스텀 CSS -->
  <link rel="stylesheet" href="../css/style.css">
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
<header class="page-header" style="background-image: url('https://images.unsplash.com/photo-1511920170033-f8396924c348?w=1200'); background-position: center;">
  <div class="page-header-content">
    <h1 data-aos="fade-up">COFFEE MENU</h1>
    <p data-aos="fade-up" data-aos-delay="100">여운이 준비한 시그니처 커피를 만나보세요</p>
    <div class="breadcrumb" data-aos="fade-up" data-aos-delay="200">
      <a href="./index.html">HOME</a> <i class="fas fa-chevron-right"></i>
      <a href="#">메뉴</a> <i class="fas fa-chevron-right"></i>
      <span>커피</span>
    </div>
  </div>
</header>

<!-- 커피 메뉴 섹션 -->
<section class="section">
  <div class="container">

    <!-- 카테고리 필터 (HOT / ICE만) -->
    <div class="menu-filter" data-aos="fade-up">
      <button class="filter-btn active" onclick="filterMenu('all')">전체</button>
      <button class="filter-btn" onclick="filterMenu('hot')">HOT</button>
      <button class="filter-btn" onclick="filterMenu('ice')">ICE</button>
    </div>

    <!-- 커피 메뉴 그리드 (4x4 = 16개) -->
    <div class="menu-grid">

      <!-- 커피 1 - ICE -->
      <div class="card menu-item" data-category="ice" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('아이스 아메리카노', 3200)">담기</button>
          </div>
        </div>
        <h4>아이스 아메리카노</h4>
        <p class="subtitle">Iced Americano</p>
        <p class="description">여운(餘韻) 시그니처 원두의 깊은<br>풍미와 고급짐을 느낄수있는 커피</p>
        <p class="price">3,200원</p>
      </div>

      <!-- 커피 2 - ICE -->
      <div class="card menu-item" data-category="ice" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1517487881594-2787fef5ebf7?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('콜드브루 라떼', 3500)">담기</button>
          </div>
        </div>
        <h4>콜드브루 라떼</h4>
        <p class="subtitle">Cold Brew Latte</p>
        <p class="description">폼 밀크속에 진한 콜드브루 조합<br>달콤한 깊함에 부드럽게 즐기는커피</p>
        <p class="price">3,500원</p>
      </div>

      <!-- 커피 3 - ICE -->
      <div class="card menu-item" data-category="ice" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('아이스 카페라떼', 3800)">담기</button>
          </div>
        </div>
        <h4>아이스 카페라떼</h4>
        <p class="subtitle">Iced Cafe Latte</p>
        <p class="description">부드러운 우유와 에스프레소의<br>시원한 조화</p>
        <p class="price">3,800원</p>
      </div>

      <!-- 커피 4 - ICE -->
      <div class="card menu-item" data-category="ice" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1485808191679-5f86510681a2?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('바닐라 라떼', 4200)">담기</button>
          </div>
        </div>
        <h4>바닐라 라떼</h4>
        <p class="subtitle">Vanilla Latte</p>
        <p class="description">바닐라의 달콤함과<br>커피의 깊은 맛의 조화</p>
        <p class="price">4,200원</p>
      </div>

      <!-- 커피 5 - ICE -->
      <div class="card menu-item" data-category="ice" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1569976710208-b52636b52c09?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('아이스 카라멜 마끼아또', 4500)">담기</button>
          </div>
        </div>
        <h4>아이스 카라멜 마끼아또</h4>
        <p class="subtitle">Iced Caramel Macchiato</p>
        <p class="description">달콤한 카라멜과<br>에스프레소의 시원한 만남</p>
        <p class="price">4,500원</p>
      </div>

      <!-- 커피 6 - ICE -->
      <div class="card menu-item" data-category="ice" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1562329265-95a6d7a83440?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('아이스 모카', 4300)">담기</button>
          </div>
        </div>
        <h4>아이스 모카</h4>
        <p class="subtitle">Iced Mocha</p>
        <p class="description">초콜릿과 커피의<br>달콤쌉싸름한 조화</p>
        <p class="price">4,300원</p>
      </div>

      <!-- 커피 7 - ICE -->
      <div class="card menu-item" data-category="ice" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('돌체 콜드브루', 4600)">담기</button>
          </div>
        </div>
        <h4>돌체 콜드브루</h4>
        <p class="subtitle">Dolce Cold Brew</p>
        <p class="description">달콤한 돌체와 진한<br>콜드브루의 프리미엄 조합</p>
        <p class="price">4,600원</p>
      </div>

      <!-- 커피 8 - ICE -->
      <div class="card menu-item" data-category="ice" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1511920170033-f8396924c348?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('아인슈페너', 4800)">담기</button>
          </div>
        </div>
        <h4>아인슈페너</h4>
        <p class="subtitle">Einspanner</p>
        <p class="description">진한 에스프레소 위<br>부드러운 생크림의 비엔나 커피</p>
        <p class="price">4,800원</p>
      </div>

      <!-- 커피 9 - HOT -->
      <div class="card menu-item" data-category="hot" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('핫 아메리카노', 3000)">담기</button>
          </div>
        </div>
        <h4>핫 아메리카노</h4>
        <p class="subtitle">Hot Americano</p>
        <p class="description">따뜻한 여운 원두의<br>깊고 진한 풍미</p>
        <p class="price">3,000원</p>
      </div>

      <!-- 커피 10 - HOT -->
      <div class="card menu-item" data-category="hot" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1514481538271-cf9f99627ab4?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('카페라떼', 3800)">담기</button>
          </div>
        </div>
        <h4>카페라떼</h4>
        <p class="subtitle">Cafe Latte</p>
        <p class="description">부드러운 우유와 에스프레소의<br>완벽한 조화</p>
        <p class="price">3,800원</p>
      </div>

      <!-- 커피 11 - HOT -->
      <div class="card menu-item" data-category="hot" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('카푸치노', 3800)">담기</button>
          </div>
        </div>
        <h4>카푸치노</h4>
        <p class="subtitle">Cappuccino</p>
        <p class="description">풍성한 우유 거품과<br>진한 에스프레소의 만남</p>
        <p class="price">3,800원</p>
      </div>

      <!-- 커피 12 - HOT -->
      <div class="card menu-item" data-category="hot" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1578374173704-4a3ab32eff0d?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('카페모카', 4200)">담기</button>
          </div>
        </div>
        <h4>카페모카</h4>
        <p class="subtitle">Cafe Mocha</p>
        <p class="description">진한 초콜릿과 에스프레소의<br>달콤쌉싸름한 조화</p>
        <p class="price">4,200원</p>
      </div>

      <!-- 커피 13 - HOT -->
      <div class="card menu-item" data-category="hot" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1556742044-3c52d6e88c62?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('핫 바닐라라떼', 4200)">담기</button>
          </div>
        </div>
        <h4>핫 바닐라라떼</h4>
        <p class="subtitle">Hot Vanilla Latte</p>
        <p class="description">따뜻한 바닐라의 달콤함과<br>부드러운 우유의 조화</p>
        <p class="price">4,200원</p>
      </div>

      <!-- 커피 14 - HOT -->
      <div class="card menu-item" data-category="hot" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1542385262-1f70c24bfaf2?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('헤이즐넛 라떼', 4500)">담기</button>
          </div>
        </div>
        <h4>헤이즐넛 라떼</h4>
        <p class="subtitle">Hazelnut Latte</p>
        <p class="description">고소한 헤이즐넛 향과<br>부드러운 라떼의 조화</p>
        <p class="price">4,500원</p>
      </div>

      <!-- 커피 15 - HOT -->
      <div class="card menu-item" data-category="hot" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1559056199-641a0ac8b55e?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('핫 카라멜 마끼아또', 4500)">담기</button>
          </div>
        </div>
        <h4>핫 카라멜 마끼아또</h4>
        <p class="subtitle">Hot Caramel Macchiato</p>
        <p class="description">따뜻한 카라멜의 달콤함과<br>에스프레소의 깊은 맛</p>
        <p class="price">4,500원</p>
      </div>

      <!-- 커피 16 - HOT -->
      <div class="card menu-item" data-category="hot" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1549007994-cb92caebd54b?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('화이트 모카', 4800)">담기</button>
          </div>
        </div>
        <h4>화이트 모카</h4>
        <p class="subtitle">White Mocha</p>
        <p class="description">부드러운 화이트 초콜릿과<br>에스프레소의 고급스러운 만남</p>
        <p class="price">4,800원</p>
      </div>

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

    <!-- 주문 메뉴 리스트 추가 -->
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
<script src="../js/script.js"></script>

<!-- 메뉴 필터링 스크립트 -->
<script>
  function filterMenu(category) {
    const items = document.querySelectorAll('.menu-item');
    const buttons = document.querySelectorAll('.filter-btn');

    // 버튼 active 상태 변경
    buttons.forEach(btn => btn.classList.remove('active'));
    event.target.classList.add('active');

    // CSS 전환 효과 설정
    items.forEach(item => {
      item.style.transition = 'all 0.4s ease';
    });

    // 먼저 모두 페이드아웃
    items.forEach(item => {
      item.style.opacity = '0';
      item.style.transform = 'scale(0.95)';
    });

    // 400ms 후 필터링 적용
    setTimeout(() => {
      let delay = 0;

      items.forEach((item) => {
        const itemCategory = item.getAttribute('data-category');

        if (category === 'all' || itemCategory === category) {
          item.style.display = 'block';

          setTimeout(() => {
            item.style.opacity = '1';
            item.style.transform = 'scale(1)';
          }, delay);

          delay += 50;
        } else {
          item.style.display = 'none';
        }
      });
    }, 400);
  }
</script>


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

