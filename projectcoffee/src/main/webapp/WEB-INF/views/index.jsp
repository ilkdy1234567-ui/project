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
  <title>여운 커피 | YEOWUN COFFEE</title>

  <!-- 외부 폰트 및 라이브러리 -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Playfair+Display:wght@400;700&family=Cormorant+Garamond:wght@400;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

  <!-- 커스텀 CSS -->
  <link rel="stylesheet" href="/css/style.css">
</head>
<iframe name="cartHiddenFrame" id="cartHiddenFrame" style="display:none;"></iframe>
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
      <c:forEach var="item" items="${mainMenus}">
        <div class="card" data-aos="fade-up">
          <div class="thumb-box">
            <div class="thumb-img"
                 style="background-image: url('${item.imgUrl}')"></div>
            <div class="overlay">
              <button class="btn-add-cart"
                      onclick="addToCart('${item.puuid}','${item.pname}', ${item.price})">
                담기
              </button>
            </div>
          </div>

          <h4>${item.pname}</h4>
          <p class="subtitle">${item.subtitle}</p>
          <p class="description">${item.description}</p>
          <p class="price">
            <fmt:formatNumber value="${item.price}" pattern="#,###"/>원
          </p>
        </div>
      </c:forEach>
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
    <h2 style="color:#ddb86e; text-align:center; font-family:'Playfair Display'; font-size:2.5rem; margin-bottom:50px;">
      YEOWUN Goods
    </h2>

    <div class="goods-grid">
      <c:forEach var="item" items="${mainGoods}">
        <div class="card" data-aos="fade-up">
          <div class="thumb-box" style="height:220px;">
            <div class="thumb-img" style="background-image:url('${item.imgUrl}')"></div>

            <!-- overlay는 thumb-box 안에 있어야 덮임 -->
            <div class="overlay">
              <button class="btn-add-cart"
                      type="button"
                      onclick="addToCart('${item.puuid}','${item.pname}', ${item.price})">
                담기
              </button>
            </div>
          </div>

          <h4>${item.pname}</h4>
          <p class="price">
            <fmt:formatNumber value="${item.price}" pattern="#,###" />원
          </p>

        </div>
      </c:forEach>
    </div>
  </div>
</section>

<div class="order-modal" id="entranceModal" style="display: flex; align-items: center; justify-content: center; background: rgba(0,0,0,0.85); position: fixed; top: 0; left: 0; width: 100%; height: 100%; z-index: 9999;">
  <div class="order-paper" style="width: 400px; text-align: center;">
    <h3 style="letter-spacing: 5px;">GUEST CHECK-IN</h3>
    <p style="margin: 20px 0; color: #666;">원활한 서비스 이용을 위해<br>연락처를 입력해 주세요.</p>

    <form action="/customer/login" method="post">
      <div class="order-form-group">
        <input type="text" name="cuNumber" class="order-input" placeholder="010-0000-0000" required style="text-align: center; font-size: 1.2rem;">
      </div>
      <button type="submit" class="btn-final-order">여운 커피 입장하기</button>
    </form>
  </div>
</div>

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
  <div class="float-item top-btn" id="top-btn" onclick="window.scrollTop(0,0)"><i class="fas fa-arrow-up"></i></div>
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

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 외부 스크립트 -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="../js/script.js"></script>

</body>
</html>