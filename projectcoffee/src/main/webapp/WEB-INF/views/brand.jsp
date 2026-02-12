<%--
  Created by IntelliJ IDEA.
  User: khuser
  Date: 26. 2. 12.
  Time: 오전 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>음료 메뉴 | YEOWUN COFFEE</title>

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
    <li class="nav-item"><a href="#">브랜드</a><div class="dropdown"><a href="./brand.html">여운 스토리</a></div></li>
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
        <a href="#">여운 스토리</a>
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
<header class="page-header" style="background-image: url('https://images.unsplash.com/photo-1546548970-71785318a17b?w=1200'); background-position: center;">
  <div class="page-header-content">
    <h1 data-aos="fade-up">BEVERAGE MENU</h1>
    <p data-aos="fade-up" data-aos-delay="100">신선한 과일로 만든 상큼한 음료를 즐겨보세요</p>
    <div class="breadcrumb" data-aos="fade-up" data-aos-delay="200">
      <a href="./index.html">HOME</a> <i class="fas fa-chevron-right"></i>
      <a href="#">메뉴</a> <i class="fas fa-chevron-right"></i>
      <span>음료</span>
    </div>
  </div>
</header>

<!-- 음료 메뉴 섹션 -->
<section class="section">
  <div class="container">

    <!-- 카테고리 필터 -->
    <div class="menu-filter" data-aos="fade-up">
      <button class="filter-btn active" onclick="filterMenu('all')">전체</button>
      <button class="filter-btn" onclick="filterMenu('ade')">에이드</button>
      <button class="filter-btn" onclick="filterMenu('smoothie')">스무디</button>
    </div>

    <!-- 음료 메뉴 그리드 (4x4 = 16개) -->
    <div class="menu-grid">

      <!-- 음료 1 -->
      <div class="card menu-item" data-category="ade" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1622597467836-f3285f2131b8?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('레몬 에이드', 4500)">담기</button>
          </div>
        </div>
        <h4>레몬 에이드</h4>
        <p class="subtitle">Lemon Ade</p>
        <p class="description">상큼한 레몬의 청량감과<br>달콤함이 어우러진 시원한 음료</p>
        <p class="price">4,500원</p>
      </div>

      <!-- 음료 2 -->
      <div class="card menu-item" data-category="ade" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('자몽 에이드', 4700)">담기</button>
          </div>
        </div>
        <h4>자몽 에이드</h4>
        <p class="subtitle">Grapefruit Ade</p>
        <p class="description">새콤달콤한 자몽의 맛과<br>상큼한 향이 가득한 음료</p>
        <p class="price">4,700원</p>
      </div>

      <!-- 음료 3 -->
      <div class="card menu-item" data-category="ade" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1587334207988-c2a0c7adf798?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('청포도 에이드', 4500)">담기</button>
          </div>
        </div>
        <h4>청포도 에이드</h4>
        <p class="subtitle">Green Grape Ade</p>
        <p class="description">달콤한 청포도의 풍미가<br>가득한 시원한 에이드</p>
        <p class="price">4,500원</p>
      </div>

      <!-- 음료 4 -->
      <div class="card menu-item" data-category="ade" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1603569283847-aa295f0d016a?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('복숭아 아이스티', 4300)">담기</button>
          </div>
        </div>
        <h4>복숭아 아이스티</h4>
        <p class="subtitle">Peach Ice Tea</p>
        <p class="description">달콤한 복숭아와 홍차의<br>완벽한 조화</p>
        <p class="price">4,300원</p>
      </div>

      <!-- 음료 5 -->
      <div class="card menu-item" data-category="ade" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('패션후르츠 에이드', 4800)">담기</button>
          </div>
        </div>
        <h4>패션후르츠 에이드</h4>
        <p class="subtitle">Passion Fruit Ade</p>
        <p class="description">트로피컬한 패션후르츠의<br>진한 향과 맛</p>
        <p class="price">4,800원</p>
      </div>

      <!-- 음료 6 -->
      <div class="card menu-item" data-category="ade" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('라임 모히또', 5000)">담기</button>
          </div>
        </div>
        <h4>라임 모히또</h4>
        <p class="subtitle">Lime Mojito</p>
        <p class="description">상큼한 라임과 민트의<br>청량한 무알콜 모히또</p>
        <p class="price">5,000원</p>
      </div>

      <!-- 음료 7 -->
      <div class="card menu-item" data-category="ade" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('망고 에이드', 4900)">담기</button>
          </div>
        </div>
        <h4>망고 에이드</h4>
        <p class="subtitle">Mango Ade</p>
        <p class="description">달콤한 망고의 풍부한 맛과<br>부드러운 식감</p>
        <p class="price">4,900원</p>
      </div>

      <!-- 음료 8 -->
      <div class="card menu-item" data-category="ade" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1603569283847-aa295f0d016a?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('유자 허니 티', 4200)">담기</button>
          </div>
        </div>
        <h4>유자 허니 티</h4>
        <p class="subtitle">Yuzu Honey Tea</p>
        <p class="description">달콤한 꿀과 향긋한 유자의<br>따뜻한 만남</p>
        <p class="price">4,200원</p>
      </div>

      <!-- 음료 9 - 스무디 -->
      <div class="card menu-item" data-category="smoothie" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1505252585461-04db1eb84625?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('딸기 바나나 스무디', 5200)">담기</button>
          </div>
        </div>
        <h4>딸기 바나나 스무디</h4>
        <p class="subtitle">Strawberry Banana Smoothie</p>
        <p class="description">달콤한 딸기와 바나나의<br>부드러운 조화</p>
        <p class="price">5,200원</p>
      </div>

      <!-- 음료 10 -->
      <div class="card menu-item" data-category="smoothie" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('망고 요거트 스무디', 5500)">담기</button>
          </div>
        </div>
        <h4>망고 요거트 스무디</h4>
        <p class="subtitle">Mango Yogurt Smoothie</p>
        <p class="description">달콤한 망고와 상큼한 요거트의<br>건강한 조합</p>
        <p class="price">5,500원</p>
      </div>

      <!-- 음료 11 -->
      <div class="card menu-item" data-category="smoothie" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1553530666-ba11a7da3888?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('블루베리 스무디', 5300)">담기</button>
          </div>
        </div>
        <h4>블루베리 스무디</h4>
        <p class="subtitle">Blueberry Smoothie</p>
        <p class="description">신선한 블루베리로 만든<br>건강하고 맛있는 스무디</p>
        <p class="price">5,300원</p>
      </div>

      <!-- 음료 12 -->
      <div class="card menu-item" data-category="smoothie" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1623065422902-30a2d299bbe4?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('딸기 스무디', 5000)">담기</button>
          </div>
        </div>
        <h4>딸기 스무디</h4>
        <p class="subtitle">Strawberry Smoothie</p>
        <p class="description">달콤하고 상큼한 딸기의<br>풍부한 맛</p>
        <p class="price">5,000원</p>
      </div>

      <!-- 음료 13 -->
      <div class="card menu-item" data-category="smoothie" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1577805947697-89e18249d767?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('그린 스무디', 5400)">담기</button>
          </div>
        </div>
        <h4>그린 스무디</h4>
        <p class="subtitle">Green Smoothie</p>
        <p class="description">신선한 채소와 과일로 만든<br>건강 스무디</p>
        <p class="price">5,400원</p>
      </div>

      <!-- 음료 14 -->
      <div class="card menu-item" data-category="smoothie" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('믹스베리 스무디', 5600)">담기</button>
          </div>
        </div>
        <h4>믹스베리 스무디</h4>
        <p class="subtitle">Mixed Berry Smoothie</p>
        <p class="description">다양한 베리의 영양과 맛이<br>가득한 스무디</p>
        <p class="price">5,600원</p>
      </div>

      <!-- 음료 15 -->
      <div class="card menu-item" data-category="smoothie" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1615478503562-ec2d8aa0e24e?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('초코 바나나 스무디', 5500)">담기</button>
          </div>
        </div>
        <h4>초코 바나나 스무디</h4>
        <p class="subtitle">Choco Banana Smoothie</p>
        <p class="description">달콤한 초콜릿과 바나나의<br>환상적인 조합</p>
        <p class="price">5,500원</p>
      </div>

      <!-- 음료 16 -->
      <div class="card menu-item" data-category="smoothie" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1622597467836-f3285f2131b8?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('키위 스무디', 5200)">담기</button>
          </div>
        </div>
        <h4>키위 스무디</h4>
        <p class="subtitle">Kiwi Smoothie</p>
        <p class="description">상큼한 키위의 비타민이<br>가득한 건강 음료</p>
        <p class="price">5,200원</p>
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
