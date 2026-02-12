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
  <title>여운 커피 | YEOWUN COFFEE</title>

  <!-- 외부 폰트 및 라이브러리 -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Playfair+Display:wght@400;700&family=Cormorant+Garamond:wght@400;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

  <!-- 커스텀 CSS -->
  <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%--상단 네비게이션바--%>
<jsp:include page="/common/header.jsp"></jsp:include>
<!-- 메인 히어로 슬라이더 -->
<header class="hero">
  <div class="swiper mainSwiper main-slider">
    <div class="swiper-wrapper">
      <div class="swiper-slide" style="background-image:url('../img/main1.jpg')"></div>
      <div class="swiper-slide" style="background-image:url('../img/main2.jpg')"></div>
      <div class="swiper-slide" style="background-image:url('../img/main3.jpg')"></div>
      <div class="swiper-slide" style="background-image:url('../img/main4.jpg')"></div>
      <div class="swiper-slide" style="background-image:url('../img/main5.jpg')"></div>
    </div>
    <div class="swiper-pagination"></div>
  </div>
</header>

<!-- 여운 컬렉션 섹션 (4개씩 2줄) -->
<section class="section">
  <div class="container">
    <div class="section-header" data-aos="fade-up">
      <h2 style="color: #ddb86e;">YEOWUN Collection</h2>
    </div>

    <div class="menu-grid">
      <!-- 커피 1 -->
      <div class="card" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('./img/커피01.png')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('콜드브루 라떼', 3500)">담기</button>
          </div>
        </div>
        <h4>콜드브루 라떼</h4>
        <p class="subtitle">Cold Brew Latte</p>
        <p class="description">폼 밀크속에 진한 콜드브루 조합<br>달콤한 깊함에 부드럽게 즐기는커피</p>
        <p class="price">3,500원</p>
      </div>

      <!-- 커피 2 -->
      <div class="card" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('./img/커피02.png')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('시그니처 바닐라라떼', 4800)">담기</button>
          </div>
        </div>
        <h4>시그니처 바닐라라떼</h4>
        <p class="subtitle">Signature Vanilla Latte</p>
        <p class="description">바닐라의 깊은 향과 여운(餘韻)의<br>시그니처 원두의 조화를 즐기는 커피</p>
        <p class="price">4,800원</p>
      </div>

      <!-- 커피 3 -->
      <div class="card" data-aos="fade-up" data-aos-delay="200">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('./img/커피03.png')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('아이스 아메리카노', 3200)">담기</button>
          </div>
        </div>
        <h4>아이스 아메리카노</h4>
        <p class="subtitle">Iced Americano</p>
        <p class="description">여운(餘韻) 시그니처 원두의 깊은<br>풍미와 고급짐을 느낄수있는 커피</p>
        <p class="price">3,200원</p>
      </div>

      <!-- 커피 4 -->
      <div class="card" data-aos="fade-up" data-aos-delay="300">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('./img/커피05.png')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('여운 더블코코베리', 6000)">담기</button>
          </div>
        </div>
        <h4>여운 더블코코베리</h4>
        <p class="subtitle">Yeowoon Double Cocoberry</p>
        <p class="description">진한 초콜릿 베이스 라떼 속에 설향<br>스트로베리 청을 더한 시즌 음료</p>
        <p class="price">6,000원</p>
      </div>

      <!-- 커피 5 -->
      <div class="card" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=600')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('카페라떼', 4000)">담기</button>
          </div>
        </div>
        <h4>카페라떼</h4>
        <p class="subtitle">Cafe Latte</p>
        <p class="description">부드러운 우유와<br>에스프레소의 완벽한 밸런스</p>
        <p class="price">4,000원</p>
      </div>

      <!-- 커피 6 -->
      <div class="card" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1534778101976-62847782c213?w=600')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('카푸치노', 4200)">담기</button>
          </div>
        </div>
        <h4>카푸치노</h4>
        <p class="subtitle">Cappuccino</p>
        <p class="description">풍부한 우유 거품과<br>진한 에스프레소</p>
        <p class="price">4,200원</p>
      </div>

      <!-- 커피 7 -->
      <div class="card" data-aos="fade-up" data-aos-delay="200">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=600')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('바닐라라떼', 4500)">담기</button>
          </div>
        </div>
        <h4>바닐라라떼</h4>
        <p class="subtitle">Vanilla Latte</p>
        <p class="description">달콤한 바닐라 향의<br>부드러운 라떼</p>
        <p class="price">4,500원</p>
      </div>

      <!-- 커피 8 -->
      <div class="card" data-aos="fade-up" data-aos-delay="300">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1485808191679-5f86510681a2?w=600')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('아메리카노', 3500)">담기</button>
          </div>
        </div>
        <h4>아메리카노</h4>
        <p class="subtitle">Americano</p>
        <p class="description">깊고 진한<br>에스프레소의 풍미</p>
        <p class="price">3,500원</p>
      </div>
    </div>
  </div>
</section>

<!-- 품질 섹션 -->
<section class="quality-section">
  <div class="container">
    <h2 style="font-family: 'Playfair Display'; font-size: 2.5rem;" data-aos="fade-up">The Quality Difference</h2>
    <div class="quality-grid">
      <div class="quality-item" style="text-align: left;" data-aos="fade-right">
        <h3>Golden Ratio</h3>
        <p>수만 번의 테스팅을 거쳐 탄생한 여운만의 황금 비율 레시피는 원두 본연의 풍미를 극대화합니다. 숙련된 바리스타가 매일 아침 환경에 맞춰 추출 설정을 조정합니다.</p>
        <br><br>
        <h3>Artisan Roasting</h3>
        <p>대량 생산이 아닌, 원두의 특성에 맞춘 소량 직화 로스팅을 고집합니다. 갓 볶은 신선한 원두만을 사용하여 입안 가득 퍼지는 섬세한 향을 약속드립니다.</p>
      </div>
      <div class="quality-item" data-aos="zoom-in">
        <img src="https://images.unsplash.com/photo-1534778101976-62847782c213?w=600" class="quality-center-img">
      </div>
      <div class="quality-item" style="text-align: right;" data-aos="fade-left">
        <h3>Pure Source</h3>
        <p>세계 3대 커피로 불리는 예멘 하라즈 고산지대의 야생 커피나무에서 채취한 최상급 생두만을 사용합니다. 화학 비료 없이 자연이 길러낸 순수한 에너지를 담았습니다.</p>
        <br><br>
        <h3>Sensory Experience</h3>
        <p>커피는 단순한 음료를 넘어선 경험입니다. 여운의 공간은 혀끝의 감각뿐만 아니라 시각적인 조형미, 코끝에 닿는 아로마까지 조화롭게 설계되었습니다.</p>
      </div>
    </div>
  </div>
</section>

<!-- 굿즈 섹션 (5개 배치 - 슬라이드 제거) -->
<section class="section" style="background: var(--bg-cream);">
  <div class="container">
    <h2 style="color: #ddb86e; text-align: center; font-family: 'Playfair Display'; font-size: 2.5rem; margin-bottom: 50px;">YEOWUN Goods</h2>

    <div class="goods-grid">
      <!-- 굿즈 1 -->
      <div class="card" data-aos="fade-up">
        <div class="thumb-box" style="height: 220px;">
          <div class="thumb-img" style="background-image: url('../img/goods_01.png')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('굿즈 1', 25000)">담기</button>
          </div>
        </div>
        <h4>굿즈 1</h4>
        <p class="price">25,000원</p>
      </div>

      <!-- 굿즈 2 -->
      <div class="card" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box" style="height: 220px;">
          <div class="thumb-img" style="background-image: url('../img/goods_02.png')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('굿즈 2', 25000)">담기</button>
          </div>
        </div>
        <h4>굿즈 2</h4>
        <p class="price">25,000원</p>
      </div>

      <!-- 굿즈 3 -->
      <div class="card" data-aos="fade-up" data-aos-delay="200">
        <div class="thumb-box" style="height: 220px;">
          <div class="thumb-img" style="background-image: url('../img/goods_03.png')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('굿즈 3', 25000)">담기</button>
          </div>
        </div>
        <h4>굿즈 3</h4>
        <p class="price">25,000원</p>
      </div>

      <!-- 굿즈 4 -->
      <div class="card" data-aos="fade-up" data-aos-delay="300">
        <div class="thumb-box" style="height: 220px;">
          <div class="thumb-img" style="background-image: url('../img/goods_04.png')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('굿즈 4', 25000)">담기</button>
          </div>
        </div>
        <h4>굿즈 4</h4>
        <p class="price">25,000원</p>
      </div>

      <!-- 굿즈 5 -->
      <div class="card" data-aos="fade-up" data-aos-delay="400">
        <div class="thumb-box" style="height: 220px;">
          <div class="thumb-img" style="background-image: url('../img/goods_06w.png')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('굿즈 5', 25000)">담기</button>
          </div>
        </div>
        <h4>굿즈 5</h4>
        <p class="price">25,000원</p>
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
      <p style="font-size: 0.85rem; color: #888;">평일 09:00 - 18:00 (주말/공휴일 휴무)<br>yeowun_coffee@brand.com</p>
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
  <div class="float-item top-btn" id="top-btn" onclick="window.scrollTo(0,0)"><i class="fas fa-arrow-up"></i></div>
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
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="../js/script.js"></script>

</body>
</html>