<%--
  Created by IntelliJ IDEA.
  User: khuser
  Date: 26. 2. 12.
  Time: 오전 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>디저트 메뉴 | YEOWUN COFFEE</title>

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
    <li class="nav-item"><a href="#">브랜드</a><div class="dropdown"><a href="#">여운 스토리</a></div></li>
    <li class="nav-item"><a href="#">메뉴</a><div class="dropdown"><a href="./menu.html">커피 (Coffee)</a><a href="./beverage.html">음료 (Beverage)</a><a href="./dessert.html">디저트 (Dessert)</a></div></li>
    <li class="nav-item"><a href="#">온라인 숍</a><div class="dropdown"><a href="./shop.html">원두/드립백</a><a href="./goods.html">홈카페 굿즈</a></div></li>
    <li class="nav-item"><a href="#">매장안내</a><div class="dropdown"><a href="./store.html">매장 찾기</a></div></li>
    <li class="nav-item"><a href="#">고객지원</a><div class="dropdown"><a href="./notice.html">공지사항</a><a href="./contact.html">1:1 문의</a></div></li>
  </ul>

  <a href="./index.html" class="logo">YEOWUN<span>餘韻</span></a>

  <div class="nav-sns">
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
        <a href="./brand.html">여운 스토리</a>
      </div>
    </li>
    <li>
      <a href="#" style="cursor: default;">메뉴</a>
      <div class="mobile-submenu">
        <a href="./menu.html">커피 (Coffee)</a>
        <a href="./beverage.html">음료 (Beverage)</a>
        <a href="./dessert.html">디저트 (Dessert)</a>
      </div>
    </li>
    <li>
      <a href="#" style="cursor: default;">온라인 숍</a>
      <div class="mobile-submenu">
        <a href="./shop.html">원두/드립백</a>
        <a href="./goods.html">홈카페 굿즈</a>
      </div>
    </li>
    <li>
      <a href="#" style="cursor: default;">매장안내</a>
      <div class="mobile-submenu">
        <a href="./store.html">매장 찾기</a>
      </div>
    </li>
    <li>
      <a href="#" style="cursor: default;">고객지원</a>
      <div class="mobile-submenu">
        <a href="./notice.html">공지사항</a>
        <a href="./contact.html">1:1 문의</a>
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
<header class="page-header" style="background-image: url('https://images.unsplash.com/photo-1464349095431-e9a21285b5f3?w=1200'); background-position: center;">
  <div class="page-header-content">
    <h1 data-aos="fade-up">DESSERT MENU</h1>
    <p data-aos="fade-up" data-aos-delay="100">달콤한 디저트로 여운을 더욱 특별하게</p>
    <div class="breadcrumb" data-aos="fade-up" data-aos-delay="200">
      <a href="./index.html">HOME</a> <i class="fas fa-chevron-right"></i>
      <a href="#">메뉴</a> <i class="fas fa-chevron-right"></i>
      <span>디저트</span>
    </div>
  </div>
</header>

<!-- 디저트 메뉴 섹션 -->
<section class="section">
  <div class="container">

    <!-- 카테고리 필터 -->
    <div class="menu-filter" data-aos="fade-up">
      <button class="filter-btn active" onclick="filterMenu('all')">전체</button>
      <button class="filter-btn" onclick="filterMenu('cake')">케이크</button>
      <button class="filter-btn" onclick="filterMenu('cookie')">쿠키</button>
      <button class="filter-btn" onclick="filterMenu('bread')">빵</button>
    </div>

    <!-- 디저트 메뉴 그리드 (4x4 = 16개) -->
    <div class="menu-grid">

      <!-- 디저트 1 -->
      <div class="card menu-item" data-category="cake" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('티라미수 케이크', 6500)">담기</button>
          </div>
        </div>
        <h4>티라미수 케이크</h4>
        <p class="subtitle">Tiramisu Cake</p>
        <p class="description">진한 에스프레소와 마스카포네<br>치즈의 완벽한 조화</p>
        <p class="price">6,500원</p>
      </div>

      <!-- 디저트 2 -->
      <div class="card menu-item" data-category="cake" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1565958011703-44f9829ba187?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('뉴욕 치즈케이크', 6200)">담기</button>
          </div>
        </div>
        <h4>뉴욕 치즈케이크</h4>
        <p class="subtitle">NY Cheesecake</p>
        <p class="description">부드럽고 진한 크림치즈의<br>풍미가 가득한 클래식 케이크</p>
        <p class="price">6,200원</p>
      </div>

      <!-- 디저트 3 -->
      <div class="card menu-item" data-category="cake" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1464349095431-e9a21285b5f3?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('초코 브라우니', 5800)">담기</button>
          </div>
        </div>
        <h4>초코 브라우니</h4>
        <p class="subtitle">Chocolate Brownie</p>
        <p class="description">진한 초콜릿의 풍미와<br>촉촉한 식감</p>
        <p class="price">5,800원</p>
      </div>

      <!-- 디저트 4 -->
      <div class="card menu-item" data-category="cake" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1616690710400-a16d146927c5?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('레드벨벳 케이크', 6800)">담기</button>
          </div>
        </div>
        <h4>레드벨벳 케이크</h4>
        <p class="subtitle">Red Velvet Cake</p>
        <p class="description">부드러운 크림치즈 프로스팅과<br>촉촉한 케이크 시트</p>
        <p class="price">6,800원</p>
      </div>

      <!-- 디저트 5 -->
      <div class="card menu-item" data-category="cake" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('당근 케이크', 6000)">담기</button>
          </div>
        </div>
        <h4>당근 케이크</h4>
        <p class="subtitle">Carrot Cake</p>
        <p class="description">스파이스와 크림치즈 프로스팅의<br>조화로운 맛</p>
        <p class="price">6,000원</p>
      </div>

      <!-- 디저트 6 -->
      <div class="card menu-item" data-category="cake" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1586985289688-ca3cf47d3e6e?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('말차 케이크', 6300)">담기</button>
          </div>
        </div>
        <h4>말차 케이크</h4>
        <p class="subtitle">Green Tea Cake</p>
        <p class="description">진한 말차 향과 부드러운<br>크림의 조화</p>
        <p class="price">6,300원</p>
      </div>

      <!-- 디저트 7 -->
      <div class="card menu-item" data-category="cookie" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1499636136210-6f4ee915583e?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('초코칩 쿠키', 3500)">담기</button>
          </div>
        </div>
        <h4>초코칩 쿠키</h4>
        <p class="subtitle">Chocolate Chip Cookie</p>
        <p class="description">바삭하고 고소한 쿠키에<br>달콤한 초코칩이 가득</p>
        <p class="price">3,500원</p>
      </div>

      <!-- 디저트 8 -->
      <div class="card menu-item" data-category="cookie" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1558961363-fa8fdf82db35?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('마카롱 5입', 8500)">담기</button>
          </div>
        </div>
        <h4>마카롱 5입</h4>
        <p class="subtitle">Macaron Set</p>
        <p class="description">다양한 맛의 프랑스식<br>정통 마카롱</p>
        <p class="price">8,500원</p>
      </div>

      <!-- 디저트 9 -->
      <div class="card menu-item" data-category="cookie" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1590080876876-a38170c67bd6?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('버터 쿠키', 3200)">담기</button>
          </div>
        </div>
        <h4>버터 쿠키</h4>
        <p class="subtitle">Butter Cookie</p>
        <p class="description">고급 버터로 만든<br>고소하고 바삭한 쿠키</p>
        <p class="price">3,200원</p>
      </div>

      <!-- 디저트 10 -->
      <div class="card menu-item" data-category="cookie" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1584473457409-ae5c91632736?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('오트밀 쿠키', 3800)">담기</button>
          </div>
        </div>
        <h4>오트밀 쿠키</h4>
        <p class="subtitle">Oatmeal Cookie</p>
        <p class="description">건강한 오트밀로 만든<br>고소한 쿠키</p>
        <p class="price">3,800원</p>
      </div>

      <!-- 디저트 11 -->
      <div class="card menu-item" data-category="bread" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('크루아상', 3800)">담기</button>
          </div>
        </div>
        <h4>크루아상</h4>
        <p class="subtitle">Croissant</p>
        <p class="description">바삭한 겉면과 부드러운 속<br>프랑스 정통 크루아상</p>
        <p class="price">3,800원</p>
      </div>

      <!-- 디저트 12 -->
      <div class="card menu-item" data-category="bread" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1608198093002-ad4e005484ec?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('스콘', 4200)">담기</button>
          </div>
        </div>
        <h4>스콘</h4>
        <p class="subtitle">Scone</p>
        <p class="description">부드럽고 담백한 맛<br>커피와 완벽한 궁합</p>
        <p class="price">4,200원</p>
      </div>

      <!-- 디저트 13 -->
      <div class="card menu-item" data-category="bread" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1586444248902-2f64eddc13df?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('베이글', 4000)">담기</button>
          </div>
        </div>
        <h4>베이글</h4>
        <p class="subtitle">Bagel</p>
        <p class="description">쫄깃한 식감과<br>고소한 맛의 베이글</p>
        <p class="price">4,000원</p>
      </div>

      <!-- 디저트 14 -->
      <div class="card menu-item" data-category="bread" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1607478900766-efe13248b125?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('식빵 (1근)', 5500)">담기</button>
          </div>
        </div>
        <h4>식빵 (1근)</h4>
        <p class="subtitle">White Bread</p>
        <p class="description">부드럽고 촉촉한<br>매일 아침 구운 신선한 식빵</p>
        <p class="price">5,500원</p>
      </div>

      <!-- 디저트 15 -->
      <div class="card menu-item" data-category="bread" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1603532648955-039310d9ed75?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('마늘바게트', 4500)">담기</button>
          </div>
        </div>
        <h4>마늘바게트</h4>
        <p class="subtitle">Garlic Baguette</p>
        <p class="description">고소한 마늘버터가 듬뿍<br>바삭한 바게트</p>
        <p class="price">4,500원</p>
      </div>

      <!-- 디저트 16 -->
      <div class="card menu-item" data-category="bread" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('크림치즈 베이글', 4800)">담기</button>
          </div>
        </div>
        <h4>크림치즈 베이글</h4>
        <p class="subtitle">Cream Cheese Bagel</p>
        <p class="description">부드러운 크림치즈와<br>쫄깃한 베이글의 조화</p>
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
<script src="/js/script.js"></script>

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

</body>
</html>
