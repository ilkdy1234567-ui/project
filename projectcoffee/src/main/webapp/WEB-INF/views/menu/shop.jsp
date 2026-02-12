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
  <title>원두/드립백 | YEOWUN COFFEE</title>

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
    <li class="nav-item"><a href="#">브랜드</a><div class="dropdown"><a href="${pageContext.request.contextPath}/brand">여운 스토리</a></div></li>
    <li class="nav-item"><a href="#">메뉴</a><div class="dropdown"><a href="${pageContext.request.contextPath}menu/menu">커피 (Coffee)</a><a href="${pageContext.request.contextPath}menu/beverage">음료 (Beverage)</a><a href="${pageContext.request.contextPath}menu/dessert">디저트 (Dessert)</a></div></li>
    <li class="nav-item"><a href="#">온라인 숍</a><div class="dropdown"><a href="${pageContext.request.contextPath}menu/shop">원두/드립백</a><a href="${pageContext.request.contextPath}menu/goods">홈카페 굿즈</a></div></li>
    <li class="nav-item"><a href="#">매장안내</a><div class="dropdown"><a href="${pageContext.request.contextPath}/store">매장 찾기</a></div></li>
    <li class="nav-item"><a href="#">고객지원</a><div class="dropdown"><a href="${pageContext.request.contextPath}notice/notice">공지사항</a><a href="${pageContext.request.contextPath}/contact">1:1 문의</a></div></li>
  </ul>

  <a href="./" class="logo">YEOWUN<span>餘韻</span></a>

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
<header class="page-header" style="background-image: url('https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=1200'); background-position: center;">
  <div class="page-header-content">
    <h1 data-aos="fade-up">COFFEE BEANS SHOP</h1>
    <p data-aos="fade-up" data-aos-delay="100">집에서도 여운의 프리미엄 커피를 즐겨보세요</p>
    <div class="breadcrumb" data-aos="fade-up" data-aos-delay="200">
      <a href="/">HOME</a> <i class="fas fa-chevron-right"></i>
      <a href="#">온라인 숍</a> <i class="fas fa-chevron-right"></i>
      <span>원두/드립백</span>
    </div>
  </div>
</header>

<!-- 원두 상품 섹션 -->
<section class="section">
  <div class="container">

    <!-- 카테고리 필터 -->
    <div class="menu-filter" data-aos="fade-up">
      <button class="filter-btn active" onclick="filterMenu('all')">전체</button>
      <button class="filter-btn" onclick="filterMenu('ethiopia')">에티오피아</button>
      <button class="filter-btn" onclick="filterMenu('colombia')">콜롬비아</button>
      <button class="filter-btn" onclick="filterMenu('brazil')">브라질</button>
    </div>

    <!-- 원두 상품 그리드 (3x4 = 12개) -->
    <div class="menu-grid">

      <!-- 상품 1 -->
      <div class="card menu-item" data-category="ethiopia" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('예멘 모카 원두 200g', 18500)">담기</button>
          </div>
        </div>
        <h4>예멘 모카 원두 200g</h4>
        <p class="subtitle">Yemen Mocha Beans</p>
        <p class="description">초콜릿과 과일 향이 조화로운<br>프리미엄 예멘 원두</p>
        <p class="price">18,500원</p>
      </div>

      <!-- 상품 2 -->
      <div class="card menu-item" data-category="ethiopia" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1559056199-641a0ac8b55e?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('에티오피아 예가체프 200g', 16800)">담기</button>
          </div>
        </div>
        <h4>에티오피아 예가체프 200g</h4>
        <p class="subtitle">Ethiopia Yirgacheffe</p>
        <p class="description">플로럴한 향과 밝은 산미의<br>시그니처 원두</p>
        <p class="price">16,800원</p>
      </div>

      <!-- 상품 3 -->
      <div class="card menu-item" data-category="ethiopia" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('에티오피아 시다모 200g', 15900)">담기</button>
          </div>
        </div>
        <h4>에티오피아 시다모 200g</h4>
        <p class="subtitle">Ethiopia Sidamo</p>
        <p class="description">와인같은 바디감과<br>달콤한 여운</p>
        <p class="price">15,900원</p>
      </div>

      <!-- 상품 4 -->
      <div class="card menu-item" data-category="colombia" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1611564364817-c64e1d0c41ee?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('콜롬비아 수프리모 200g', 14500)">담기</button>
          </div>
        </div>
        <h4>콜롬비아 수프리모 200g</h4>
        <p class="subtitle">Colombia Supremo</p>
        <p class="description">균형잡힌 맛과<br>부드러운 바디감</p>
        <p class="price">14,500원</p>
      </div>

      <!-- 상품 5 -->
      <div class="card menu-item" data-category="colombia" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1517487881594-2787fef5ebf7?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('콜롬비아 핑크버번 200g', 17200)">담기</button>
          </div>
        </div>
        <h4>콜롬비아 핑크버번 200g</h4>
        <p class="subtitle">Colombia Pink Bourbon</p>
        <p class="description">독특한 과일 향과<br>화사한 풍미</p>
        <p class="price">17,200원</p>
      </div>

      <!-- 상품 6 -->
      <div class="card menu-item" data-category="brazil" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1587049352846-4a222e784422?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('브라질 산토스 200g', 13800)">담기</button>
          </div>
        </div>
        <h4>브라질 산토스 200g</h4>
        <p class="subtitle">Brazil Santos</p>
        <p class="description">고소하고 부드러운<br>클래식한 맛</p>
        <p class="price">13,800원</p>
      </div>

      <!-- 상품 7 -->
      <div class="card menu-item" data-category="brazil" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('브라질 세하도 200g', 15200)">담기</button>
          </div>
        </div>
        <h4>브라질 세하도 200g</h4>
        <p class="subtitle">Brazil Cerrado</p>
        <p class="description">초콜릿 향이 강한<br>풀바디 원두</p>
        <p class="price">15,200원</p>
      </div>

      <!-- 상품 8 -->
      <div class="card menu-item" data-category="ethiopia" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1511920170033-f8396924c348?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('여운 블렌드 원두 200g', 16500)">담기</button>
          </div>
        </div>
        <h4>여운 블렌드 원두 200g</h4>
        <p class="subtitle">Yeowun Signature Blend</p>
        <p class="description">여운만의 시그니처<br>프리미엄 블렌딩</p>
        <p class="price">16,500원</p>
      </div>

      <!-- 상품 9 -->
      <div class="card menu-item" data-category="ethiopia" data-aos="fade-up">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1442512595331-e89e73853f31?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('드립백 10개입 (블렌드)', 12000)">담기</button>
          </div>
        </div>
        <h4>드립백 10개입 (블렌드)</h4>
        <p class="subtitle">Drip Bag Blend</p>
        <p class="description">언제 어디서나 간편하게<br>여운 커피를 즐기세요</p>
        <p class="price">12,000원</p>
      </div>

      <!-- 상품 10 -->
      <div class="card menu-item" data-category="ethiopia" data-aos="fade-up" data-aos-delay="50">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('드립백 10개입 (에티오피아)', 13500)">담기</button>
          </div>
        </div>
        <h4>드립백 10개입 (에티오피아)</h4>
        <p class="subtitle">Drip Bag Ethiopia</p>
        <p class="description">예가체프 원두로 만든<br>프리미엄 드립백</p>
        <p class="price">13,500원</p>
      </div>

      <!-- 상품 11 -->
      <div class="card menu-item" data-category="colombia" data-aos="fade-up" data-aos-delay="100">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1497636577773-f1231844b336?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('콜드브루 원액 1L', 19800)">담기</button>
          </div>
        </div>
        <h4>콜드브루 원액 1L</h4>
        <p class="subtitle">Cold Brew Concentrate</p>
        <p class="description">깊고 진한 맛의<br>시원한 콜드브루</p>
        <p class="price">19,800원</p>
      </div>

      <!-- 상품 12 -->
      <div class="card menu-item" data-category="brazil" data-aos="fade-up" data-aos-delay="150">
        <div class="thumb-box">
          <div class="thumb-img" style="background-image: url('https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=400')"></div>
          <div class="overlay">
            <button class="btn-add-cart" onclick="addToCart('디카페인 원두 200g', 15500)">담기</button>
          </div>
        </div>
        <h4>디카페인 원두 200g</h4>
        <p class="subtitle">Decaf Coffee Beans</p>
        <p class="description">카페인은 줄이고<br>풍미는 그대로</p>
        <p class="price">15,500원</p>
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
