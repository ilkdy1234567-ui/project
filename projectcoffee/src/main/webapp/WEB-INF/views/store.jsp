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
  <title>매장 찾기 | YEOWUN COFFEE</title>

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
<header class="page-header" style="background-image: url('https://images.unsplash.com/photo-1445116572660-236099ec97a0?w=1200'); background-position: center;">
  <div class="page-header-content">
    <h1 data-aos="fade-up">STORE LOCATOR</h1>
    <p data-aos="fade-up" data-aos-delay="100">가까운 여운 매장을 찾아보세요</p>
    <div class="breadcrumb" data-aos="fade-up" data-aos-delay="200">
      <a href="/">HOME</a> <i class="fas fa-chevron-right"></i>
      <a href="#">매장안내</a> <i class="fas fa-chevron-right"></i>
      <span>매장 찾기</span>
    </div>
  </div>
</header>

<!-- 매장 찾기 섹션 -->
<section class="section">
  <div class="container">

    <!-- 지역 필터 -->
    <div class="menu-filter" data-aos="fade-up">
      <button class="filter-btn active" onclick="filterStores('all')">전체</button>
      <button class="filter-btn" onclick="filterStores('seoul')">서울</button>
      <button class="filter-btn" onclick="filterStores('gyeonggi')">경기</button>
      <button class="filter-btn" onclick="filterStores('busan')">부산</button>
      <button class="filter-btn" onclick="filterStores('etc')">기타지역</button>
    </div>

    <!-- 지도 영역 -->
    <div style="background: #f0f0f0; height: 400px; border-radius: 15px; margin-bottom: 60px; display: flex; align-items: center; justify-content: center;" data-aos="fade-up">
      <div style="text-align: center; color: #999;">
        <i class="fas fa-map-marked-alt" style="font-size: 4rem; margin-bottom: 20px;"></i>
        <p style="font-size: 1.1rem;">카카오맵 또는 구글맵 API 연동 영역</p>
        <p style="font-size: 0.9rem; margin-top: 10px;">선택한 매장의 위치가 표시됩니다</p>
      </div>
    </div>

    <!-- 매장 카드 그리드 -->
    <div class="menu-grid">

      <!-- 매장 1 - 서울 -->
      <div class="card store-item" data-region="seoul" data-aos="fade-up">
        <div style="padding: 30px;">
          <div style="display: flex; align-items: center; margin-bottom: 20px;">
            <div style="width: 50px; height: 50px; background: var(--accent-gold); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 15px;">
              <i class="fas fa-store" style="color: white; font-size: 1.5rem;"></i>
            </div>
            <div>
              <h4 style="font-size: 1.3rem; margin-bottom: 5px;">강남점</h4>
              <span style="display: inline-block; padding: 3px 10px; background: #f0f0f0; border-radius: 5px; font-size: 0.8rem; color: #666;">서울</span>
            </div>
          </div>
          <p style="color: #666; line-height: 1.7; margin-bottom: 15px;">
            <i class="fas fa-map-marker-alt" style="color: var(--accent-gold); margin-right: 8px;"></i>
            서울시 강남구 테헤란로 123
          </p>
          <p style="color: #666; line-height: 1.7; margin-bottom: 15px;">
            <i class="fas fa-phone" style="color: var(--accent-gold); margin-right: 8px;"></i>
            02-1234-5678
          </p>
          <p style="color: #666; line-height: 1.7;">
            <i class="fas fa-clock" style="color: var(--accent-gold); margin-right: 8px;"></i>
            평일 07:00 - 22:00
          </p>
        </div>
      </div>

      <!-- 매장 2 - 서울 -->
      <div class="card store-item" data-region="seoul" data-aos="fade-up" data-aos-delay="50">
        <div style="padding: 30px;">
          <div style="display: flex; align-items: center; margin-bottom: 20px;">
            <div style="width: 50px; height: 50px; background: var(--accent-gold); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 15px;">
              <i class="fas fa-store" style="color: white; font-size: 1.5rem;"></i>
            </div>
            <div>
              <h4 style="font-size: 1.3rem; margin-bottom: 5px;">홍대점</h4>
              <span style="display: inline-block; padding: 3px 10px; background: #f0f0f0; border-radius: 5px; font-size: 0.8rem; color: #666;">서울</span>
            </div>
          </div>
          <p style="color: #666; line-height: 1.7; margin-bottom: 15px;">
            <i class="fas fa-map-marker-alt" style="color: var(--accent-gold); margin-right: 8px;"></i>
            서울시 마포구 홍익로 45
          </p>
          <p style="color: #666; line-height: 1.7; margin-bottom: 15px;">
            <i class="fas fa-phone" style="color: var(--accent-gold); margin-right: 8px;"></i>
            02-2345-6789
          </p>
          <p style="color: #666; line-height: 1.7;">
            <i class="fas fa-clock" style="color: var(--accent-gold); margin-right: 8px;"></i>
            평일 08:00 - 23:00
          </p>
        </div>
      </div>

      <!-- 매장 3 - 서울 -->
      <div class="card store-item" data-region="seoul" data-aos="fade-up" data-aos-delay="100">
        <div style="padding: 30px;">
          <div style="display: flex; align-items: center; margin-bottom: 20px;">
            <div style="width: 50px; height: 50px; background: var(--accent-gold); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 15px;">
              <i class="fas fa-store" style="color: white; font-size: 1.5rem;"></i>
            </div>
            <div>
              <h4 style="font-size: 1.3rem; margin-bottom: 5px;">이태원점</h4>
              <span style="display: inline-block; padding: 3px 10px; background: #f0f0f0; border-radius: 5px; font-size: 0.8rem; color: #666;">서울</span>
            </div>
          </div>
          <p style="color: #666; line-height: 1.7; margin-bottom: 15px;">
            <i class="fas fa-map-marker-alt" style="color: var(--accent-gold); margin-right: 8px;"></i>
            서울시 용산구 이태원로 67
          </p>
          <p style="color: #666; line-height: 1.7; margin-bottom: 15px;">
            <i class="fas fa-phone" style="color: var(--accent-gold); margin-right: 8px;"></i>
            02-3456-7890
          </p>
          <p style="color: #666; line-height: 1.7;">
            <i class="fas fa-clock" style="color: var(--accent-gold); margin-right: 8px;"></i>
            평일 09:00 - 21:00
          </p>
        </div>
      </div>

      <!-- 매장 4 - 경기 -->
      <div class="card store-item" data-region="gyeonggi" data-aos="fade-up" data-aos-delay="150">
        <div style="padding: 30px;">
          <div style="display: flex; align-items: center; margin-bottom: 20px;">
            <div style="width: 50px; height: 50px; background: var(--accent-gold); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 15px;">
              <i class="fas fa-store" style="color: white; font-size: 1.5rem;"></i>
            </div>
            <div>
              <h4 style="font-size: 1.3rem; margin-bottom: 5px;">판교점</h4>
              <span style="display: inline-block; padding: 3px 10px; background: #f0f0f0; border-radius: 5px; font-size: 0.8rem; color: #666;">경기</span>
            </div>
          </div>
          <p style="color: #666; line-height: 1.7; margin-bottom: 15px;">
            <i class="fas fa-map-marker-alt" style="color: var(--accent-gold); margin-right: 8px;"></i>
            경기도 성남시 분당구 판교로 89
          </p>
          <p style="color: #666; line-height: 1.7; margin-bottom: 15px;">
            <i class="fas fa-phone" style="color: var(--accent-gold); margin-right: 8px;"></i>
            031-1234-5678
          </p>
          <p style="color: #666; line-height: 1.7;">
            <i class="fas fa-clock" style="color: var(--accent-gold); margin-right: 8px;"></i>
            평일 07:30 - 22:00
          </p>
        </div>
      </div>

      <!-- 매장 5 - 경기 -->
      <div class="card store-item" data-region="gyeonggi" data-aos="fade-up">
        <div style="padding: 30px;">
          <div style="display: flex; align-items: center; margin-bottom: 20px;">
            <div style="width: 50px; height: 50px; background: var(--accent-gold); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 15px;">
              <i class="fas fa-store" style="color: white; font-size: 1.5rem;"></i>
            </div>
            <div>
              <h4 style="font-size: 1.3rem; margin-bottom: 5px;">수원점</h4>
              <span style="display: inline-block; padding: 3px 10px; background: #f0f0f0; border-radius: 5px; font-size: 0.8rem; color: #666;">경기</span>
            </div>
          </div>
          <p style="color: #666; line-height: 1.7; margin-bottom: 15px;">
            <i class="fas fa-map-marker-alt" style="color: var(--accent-gold); margin-right: 8px;"></i>
            경기도 수원시 팔달구 권광로 34
          </p>
          <p style="color: #666; line-height: 1.7; margin-bottom: 15px;">
            <i class="fas fa-phone" style="color: var(--accent-gold); margin-right: 8px;"></i>
            031-2345-6789
          </p>
          <p style="color: #666; line-height: 1.7;">
            <i class="fas fa-clock" style="color: var(--accent-gold); margin-right: 8px;"></i>
            평일 08:00 - 21:00
          </p>
        </div>
      </div>

      <!-- 매장 6 - 부산 -->
      <div class="card store-item" data-region="busan" data-aos="fade-up" data-aos-delay="50">
        <div style="padding: 30px;">
          <div style="display: flex; align-items: center; margin-bottom: 20px;">
            <div style="width: 50px; height: 50px; background: var(--accent-gold); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 15px;">
              <i class="fas fa-store" style="color: white; font-size: 1.5rem;"></i>
            </div>
            <div>
              <h4 style="font-size: 1.3rem; margin-bottom: 5px;">해운대점</h4>
              <span style="display: inline-block; padding: 3px 10px; background: #f0f0f0; border-radius: 5px; font-size: 0.8rem; color: #666;">부산</span>
            </div>
          </div>
          <p style="color: #666; line-height: 1.7; margin-bottom: 15px;">
            <i class="fas fa-map-marker-alt" style="color: var(--accent-gold); margin-right: 8px;"></i>
            부산시 해운대구 해운대로 56
          </p>
          <p style="color: #666; line-height: 1.7; margin-bottom: 15px;">
            <i class="fas fa-phone" style="color: var(--accent-gold); margin-right: 8px;"></i>
            051-1234-5678
          </p>
          <p style="color: #666; line-height: 1.7;">
            <i class="fas fa-clock" style="color: var(--accent-gold); margin-right: 8px;"></i>
            평일 08:00 - 22:00
          </p>
        </div>
      </div>

      <!-- 매장 7 - 부산 -->
      <div class="card store-item" data-region="busan" data-aos="fade-up" data-aos-delay="100">
        <div style="padding: 30px;">
          <div style="display: flex; align-items: center; margin-bottom: 20px;">
            <div style="width: 50px; height: 50px; background: var(--accent-gold); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 15px;">
              <i class="fas fa-store" style="color: white; font-size: 1.5rem;"></i>
            </div>
            <div>
              <h4 style="font-size: 1.3rem; margin-bottom: 5px;">서면점</h4>
              <span style="display: inline-block; padding: 3px 10px; background: #f0f0f0; border-radius: 5px; font-size: 0.8rem; color: #666;">부산</span>
            </div>
          </div>
          <p style="color: #666; line-height: 1.7; margin-bottom: 15px;">
            <i class="fas fa-map-marker-alt" style="color: var(--accent-gold); margin-right: 8px;"></i>
            부산시 부산진구 서면로 78
          </p>
          <p style="color: #666; line-height: 1.7; margin-bottom: 15px;">
            <i class="fas fa-phone" style="color: var(--accent-gold); margin-right: 8px;"></i>
            051-2345-6789
          </p>
          <p style="color: #666; line-height: 1.7;">
            <i class="fas fa-clock" style="color: var(--accent-gold); margin-right: 8px;"></i>
            평일 09:00 - 21:00
          </p>
        </div>
      </div>

      <!-- 매장 8 - 기타 -->
      <div class="card store-item" data-region="etc" data-aos="fade-up" data-aos-delay="150">
        <div style="padding: 30px;">
          <div style="display: flex; align-items: center; margin-bottom: 20px;">
            <div style="width: 50px; height: 50px; background: var(--accent-gold); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 15px;">
              <i class="fas fa-store" style="color: white; font-size: 1.5rem;"></i>
            </div>
            <div>
              <h4 style="font-size: 1.3rem; margin-bottom: 5px;">대구점</h4>
              <span style="display: inline-block; padding: 3px 10px; background: #f0f0f0; border-radius: 5px; font-size: 0.8rem; color: #666;">대구</span>
            </div>
          </div>
          <p style="color: #666; line-height: 1.7; margin-bottom: 15px;">
            <i class="fas fa-map-marker-alt" style="color: var(--accent-gold); margin-right: 8px;"></i>
            대구시 중구 동성로 123
          </p>
          <p style="color: #666; line-height: 1.7; margin-bottom: 15px;">
            <i class="fas fa-phone" style="color: var(--accent-gold); margin-right: 8px;"></i>
            053-1234-5678
          </p>
          <p style="color: #666; line-height: 1.7;">
            <i class="fas fa-clock" style="color: var(--accent-gold); margin-right: 8px;"></i>
            평일 08:30 - 21:30
          </p>
        </div>
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

<!-- 매장 필터링 스크립트 -->
<script>
  function filterStores(region) {
    const items = document.querySelectorAll('.store-item');
    const buttons = document.querySelectorAll('.filter-btn');

    buttons.forEach(btn => btn.classList.remove('active'));
    event.target.classList.add('active');

    items.forEach(item => {
      item.style.transition = 'all 0.4s ease';
      item.style.opacity = '0';
      item.style.transform = 'scale(0.95)';
    });

    setTimeout(() => {
      let delay = 0;
      items.forEach((item) => {
        const itemRegion = item.getAttribute('data-region');

        if (region === 'all' || itemRegion === region) {
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
