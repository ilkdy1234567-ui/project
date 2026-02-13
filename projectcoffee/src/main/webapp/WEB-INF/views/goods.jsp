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
  <title>홈카페 굿즈 | YEOWUN COFFEE</title>

  <!-- 외부 폰트 및 라이브러리 -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Playfair+Display:wght@400;700&family=Cormorant+Garamond:wght@400;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

  <!-- 커스텀 CSS -->
  <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<!-- 상단 네비게이션 -->
<%--모바일 사이드바--%>
<jsp:include page="/common/header.jsp"></jsp:include>

<!-- 페이지 헤더 (타이틀 배너) -->
<header class="page-header" style="background-image: url('https://images.unsplash.com/photo-1514481538271-cf9f99627ab4?w=1200'); background-position: center;">
  <div class="page-header-content">
    <h1 data-aos="fade-up">HOME CAFE GOODS</h1>
    <p data-aos="fade-up" data-aos-delay="100">여운의 감성을 담은 홈카페 제품</p>
    <div class="breadcrumb" data-aos="fade-up" data-aos-delay="200">
      <a href="/">HOME</a> <i class="fas fa-chevron-right"></i>
      <a href="#">온라인 숍</a> <i class="fas fa-chevron-right"></i>
      <span>홈카페 굿즈</span>
    </div>
  </div>
</header>

<!-- 굿즈 상품 섹션 -->
<section class="section">
  <div class="container">

    <!-- 카테고리 필터 -->
    <div class="menu-filter" data-aos="fade-up">
      <button class="filter-btn active" onclick="filterMenu('all')">전체</button>
      <button class="filter-btn" onclick="filterMenu('mug')">머그컵</button>
      <button class="filter-btn" onclick="filterMenu('tumbler')">텀블러</button>
      <button class="filter-btn" onclick="filterMenu('tool')">드리퍼/도구</button>
    </div>

    <!-- 굿즈 상품 그리드 (10개) -->
    <div class="menu-grid">

      <!-- 상품 1 -->
      <div class="card menu-item" data-category="mug" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1514481538271-cf9f99627ab4?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('여운 시그니처 머그컵', 18000)">담기</button>
          </div>
        </div>
        <h4>여운 시그니처 머그컵</h4>
        <p class="subtitle">Yeowun Signature Mug</p>
        <p class="description">여운 로고가 새겨진<br>프리미엄 세라믹 머그컵</p>
        <p class="price">18,000원</p>
      </div>

      <!-- 상품 2 -->
      <div class="card menu-item" data-category="mug" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1517256064527-09c73fc73e38?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('미니멀 화이트 머그', 15000)">담기</button>
          </div>
        </div>
        <h4>미니멀 화이트 머그</h4>
        <p class="subtitle">Minimal White Mug</p>
        <p class="description">심플하고 세련된 디자인<br>데일리 머그컵</p>
        <p class="price">15,000원</p>
      </div>

      <!-- 상품 3 -->
      <div class="card menu-item" data-category="mug" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1587080266227-677cc2a4e76e?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('더블월 글라스 머그', 22000)">담기</button>
          </div>
        </div>
        <h4>더블월 글라스 머그</h4>
        <p class="subtitle">Double Wall Glass Mug</p>
        <p class="description">보온 보냉 효과 탁월한<br>프리미엄 글라스 머그</p>
        <p class="price">22,000원</p>
      </div>

      <!-- 상품 4 -->
      <div class="card menu-item" data-category="tumbler" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('스테인리스 텀블러 473ml', 28000)">담기</button>
          </div>
        </div>
        <h4>스테인리스 텀블러 473ml</h4>
        <p class="subtitle">Stainless Steel Tumbler</p>
        <p class="description">6시간 보온/보냉<br>프리미엄 텀블러</p>
        <p class="price">28,000원</p>
      </div>

      <!-- 상품 5 -->
      <div class="card menu-item" data-category="tumbler" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('콜드컵 텀블러 650ml', 25000)">담기</button>
          </div>
        </div>
        <h4>콜드컵 텀블러 650ml</h4>
        <p class="subtitle">Cold Cup Tumbler</p>
        <p class="description">시원한 아이스 음료에 딱!<br>재사용 가능한 콜드컵</p>
        <p class="price">25,000원</p>
      </div>

      <!-- 상품 6 -->
      <div class="card menu-item" data-category="tumbler" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1621939514649-280e2ee25f60?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('휴대용 미니 텀블러 350ml', 19000)">담기</button>
          </div>
        </div>
        <h4>휴대용 미니 텀블러 350ml</h4>
        <p class="subtitle">Mini Portable Tumbler</p>
        <p class="description">가방에 쏙 들어가는<br>컴팩트 사이즈</p>
        <p class="price">19,000원</p>
      </div>

      <!-- 상품 7 -->
      <div class="card menu-item" data-category="tool" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1559056199-641a0ac8b55e?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('세라믹 V60 드리퍼', 32000)">담기</button>
          </div>
        </div>
        <h4>세라믹 V60 드리퍼</h4>
        <p class="subtitle">Ceramic V60 Dripper</p>
        <p class="description">핸드드립의 정석<br>프리미엄 세라믹 드리퍼</p>
        <p class="price">32,000원</p>
      </div>

      <!-- 상품 8 -->
      <div class="card menu-item" data-category="tool" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1551024601-bec78aea704b?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('핸드드립 서버 600ml', 24000)">담기</button>
          </div>
        </div>
        <h4>핸드드립 서버 600ml</h4>
        <p class="subtitle">Hand Drip Server</p>
        <p class="description">내열 유리 재질<br>눈금 표시로 편리한 사용</p>
        <p class="price">24,000원</p>
      </div>

      <!-- 상품 9 -->
      <div class="card menu-item" data-category="tool" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1556742044-3c52d6e88c62?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('핸드밀 그라인더', 45000)">담기</button>
          </div>
        </div>
        <h4>핸드밀 그라인더</h4>
        <p class="subtitle">Hand Mill Grinder</p>
        <p class="description">세라믹 날로 균일한 분쇄<br>휴대 가능한 핸드밀</p>
        <p class="price">45,000원</p>
      </div>

      <!-- 상품 10 -->
      <div class="card menu-item" data-category="tool" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('밀크 프로서 세트', 38000)">담기</button>
          </div>
        </div>
        <h4>밀크 프로서 세트</h4>
        <p class="subtitle">Milk Frother Set</p>
        <p class="description">라떼 아트를 위한<br>전동 프로서와 피처 세트</p>
        <p class="price">38,000원</p>
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
