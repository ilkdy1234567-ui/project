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
  <title>원두/드립백 | YEOWUN COFFEE</title>

  <!-- 외부 폰트 및 라이브러리 -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Playfair+Display:wght@400;700&family=Cormorant+Garamond:wght@400;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

  <!-- jQuery & elevateZoom -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/elevatezoom/3.0.8/jquery.elevatezoom.min.js"></script>

  <!-- 커스텀 CSS -->
  <link rel="stylesheet" href="/css/style.css">

  <style>
    /* ===== 제품 카드 공통 스타일 ===== */
    .product-row-list {
      display: flex;
      flex-direction: column;
      gap: 0;
      max-width: 960px;
      margin: 0 auto;
    }
    .product-row-item {
      display: grid;
      grid-template-columns: 200px 1fr auto;
      align-items: center;
      gap: 30px;
      padding: 28px 30px;
      background: white;
      border-bottom: 1px solid #eee;
      transition: background 0.2s;
      cursor: pointer;
    }
    .product-row-item:first-child { border-radius: 14px 14px 0 0; border: 1px solid #e5e5e5; }
    .product-row-item:last-child  { border-radius: 0 0 14px 14px; border: 1px solid #e5e5e5; border-top: none; }
    .product-row-item:not(:first-child):not(:last-child) { border-left: 1px solid #e5e5e5; border-right: 1px solid #e5e5e5; }
    .product-row-item:hover { background: #fdf8f2; }
    .product-row-item.selected-row { background: #fef9f0; border-left: 4px solid var(--accent-gold) !important; }

    .product-row-img {
      width: 200px;
      height: 160px;
      object-fit: cover;
      border-radius: 10px;
    }
    .product-row-info { flex: 1; }
    .product-row-info h5 {
      font-size: 1.05rem;
      font-weight: 700;
      color: #222;
      margin-bottom: 4px;
    }
    .product-row-info .sub { color: #999; font-size: 0.82rem; font-style: italic; margin-bottom: 8px; }
    .product-row-info .desc { color: #666; font-size: 0.85rem; line-height: 1.6; margin-bottom: 10px; }
    .product-row-info .tag {
      display: inline-block;
      background: #fef3e2;
      color: var(--accent-gold);
      font-size: 0.75rem;
      font-weight: 700;
      padding: 3px 10px;
      border-radius: 20px;
      border: 1px solid #f5d99e;
    }
    .product-row-price {
      text-align: right;
      white-space: nowrap;
    }
    .product-row-price .price {
      font-size: 1.2rem;
      font-weight: 700;
      color: var(--accent-gold);
      display: block;
      margin-bottom: 10px;
    }
    .btn-add-row {
      background: var(--accent-gold);
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 8px;
      font-size: 0.9rem;
      font-weight: 700;
      cursor: pointer;
      transition: background 0.2s;
      white-space: nowrap;
    }
    .btn-add-row:hover { background: #c8954a; }

    /* ===== SVG 피라미드 컨테이너 ===== */
    .pyramid-wrap {
      overflow: visible;
      width: 100%;
      max-width: 480px;
      margin: 0 auto;
    }

    /* ===== 원두탭 Our Selection 배너 ===== */
    .our-selection-banner {
      text-align: center;
      padding: 50px 0 40px;
      border-bottom: 1px solid #f0ebe4;
      margin-bottom: 50px;
    }
    .our-selection-banner h2 {
      font-family: 'Playfair Display', serif;
      font-size: 2.8rem;
      color: var(--accent-gold);
      letter-spacing: 3px;
      margin-bottom: 12px;
    }
    .our-selection-banner p {
      color: #999;
      font-size: 0.95rem;
      line-height: 1.8;
      max-width: 480px;
      margin: 0 auto 20px;
    }
    .our-selection-banner .divider {
      width: 50px;
      height: 2px;
      background: var(--accent-gold);
      margin: 0 auto;
    }

    /* ===== 전체탭 원두 섹션 제목 ===== */
    .section-title-block {
      text-align: center;
      margin-bottom: 40px;
    }
    .section-title-block .label {
      font-size: 0.78rem;
      font-weight: 700;
      letter-spacing: 4px;
      color: var(--accent-gold);
      text-transform: uppercase;
      margin-bottom: 8px;
    }
    .section-title-block h3 {
      font-family: 'Playfair Display', serif;
      font-size: 2rem;
      color: #222;
      margin-bottom: 10px;
    }
    .section-title-block .sub-desc {
      color: #888;
      font-size: 0.88rem;
    }
    .section-title-block .bar {
      width: 40px;
      height: 2px;
      background: var(--accent-gold);
      margin: 14px auto 0;
    }

    /* ===== 드립백 카드 선택 상태 ===== */
    .dripbag-card {
      cursor: pointer;
      transition: all 0.2s;
    }
    .dripbag-card.selected-row .thumb-box::after {
      content: '';
      position: absolute;
      inset: 0;
      border: 3px solid var(--accent-gold);
      pointer-events: none;
    }
    .dripbag-card.selected-row h4 {
      color: var(--accent-gold);
    }

    /* ===== index.html 카드 스타일 (shop.html에서 재사용) ===== */
    .menu-grid {
      display: grid;
      gap: 30px;
    }
    .card {
      background: transparent;
      border: none;
      padding: 0;
    }
    .card h4 {
      font-size: 1rem;
      font-weight: 700;
      color: var(--text-dark, #1a1a1a);
      margin: 14px 0 4px;
    }
    .card .subtitle {
      color: #aaa;
      font-size: 0.8rem;
      margin-bottom: 8px;
    }
    .card .description {
      color: #777;
      font-size: 0.82rem;
      line-height: 1.6;
      margin-bottom: 10px;
    }
    .card .price {
      color: var(--accent-gold, #c8954a);
      font-size: 1rem;
      font-weight: 700;
    }
    .thumb-box {
      position: relative;
      width: 100%;
      padding-top: 100%;
      overflow: hidden;
    }
    .thumb-img {
      position: absolute;
      inset: 0;
      background-size: cover;
      background-position: center;
      transition: transform 0.4s ease;
    }
    .thumb-box:hover .thumb-img {
      transform: scale(1.06);
    }
    .overlay {
      position: absolute;
      inset: 0;
      background: rgba(0,0,0,0.38);
      display: flex;
      align-items: center;
      justify-content: center;
      opacity: 0;
      transition: opacity 0.3s ease;
    }
    .thumb-box:hover .overlay {
      opacity: 1;
    }
    .overlay .btn-add-cart {
      background: var(--accent-gold, #c8954a);
      color: white;
      border: none;
      padding: 10px 26px;
      font-size: 0.9rem;
      font-weight: 700;
      letter-spacing: 1px;
      cursor: pointer;
      border-radius: 4px;
      transition: background 0.2s;
    }
    .overlay .btn-add-cart:hover {
      background: #b07a35;
    }

    /* ===== zoom 이미지 컨테이너 ===== */
    .zoom-container-box {
      border: 2px dashed #ddd;
      border-radius: 14px;
      background: #fafafa;
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
      position: relative;
      min-height: 380px;
    }
    .zoom-container-box img {
      max-width: 100%;
      max-height: 360px;
      display: block;
    }
    .zoom-hint {
      position: absolute;
      bottom: 12px;
      right: 14px;
      font-size: 0.72rem;
      color: #bbb;
      background: rgba(255,255,255,0.85);
      padding: 3px 8px;
      border-radius: 20px;
    }
  </style>
</head>
<body>

<!-- 상단 네비게이션 -->
<nav id="navbar">
  <div class="mobile-menu-btn" onclick="toggleSidebar()"><i class="fas fa-bars"></i></div>
  <ul class="nav-menu">
    <li class="nav-item"><a href="#">브랜드</a><div class="dropdown"><a href="/brand.html">여운 스토리</a></div></li>
    <li class="nav-item"><a href="#">메뉴</a><div class="dropdown"><a href="/menu.html">커피 (Coffee)</a><a href="/beverage.html">음료 (Beverage)</a><a href="/dessert.html">디저트 (Dessert)</a></div></li>
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
    <li><a href="#" style="cursor:default;">브랜드</a><div class="mobile-submenu"><a href="/brand.html">여운 스토리</a></div></li>
    <li><a href="#" style="cursor:default;">메뉴</a><div class="mobile-submenu"><a href="/menu.html">커피 (Coffee)</a><a href="/beverage.html">음료 (Beverage)</a><a href="./dessert.html">디저트 (Dessert)</a></div></li>
    <li><a href="#" style="cursor:default;">온라인 숍</a><div class="mobile-submenu"><a href="/shop.html">원두/드립백</a><a href="/goods.html">홈카페 굿즈</a></div></li>
    <li><a href="#" style="cursor:default;">매장안내</a><div class="mobile-submenu"><a href="/store.html">매장 찾기</a></div></li>
    <li><a href="#" style="cursor:default;">고객지원</a><div class="mobile-submenu"><a href="/notice.html">공지사항</a><a href="/contact.html">1:1 문의</a></div></li>
  </ul>
  <!-- 사이드바 로그인 영역 -->
  <div style="margin-top: 30px; border-top: 1px solid rgba(255,255,255,0.1); padding-top: 25px;">
    <div id="sidebar-login-btn" onclick="handleUserIcon()" style="display:flex; align-items:center; gap:10px; cursor:pointer; padding:12px 16px; background:var(--accent-gold); border-radius:8px; color:#fff; font-size:0.9rem; font-weight:600; justify-content:center;">
      <i class="fas fa-user"></i> 로그인
    </div>
    <div id="sidebar-user-info" style="display:none; align-items:center; justify-content:space-between; padding:12px 16px; background:rgba(221,184,110,0.15); border-radius:8px; border:1px solid var(--accent-gold);">
            <span style="display:flex; align-items:center; gap:8px; font-size:0.9rem; font-weight:600;">
                <i class="fas fa-user" style="color:var(--accent-gold);"></i>
                <span id="sidebar-user-name"></span>
            </span>
      <button onclick="sidebarLogout()" style="background:none; border:1px solid #ccc; border-radius:6px; padding:5px 10px; font-size:0.78rem; cursor:pointer; color:#666;">로그아웃</button>
    </div>
  </div>
  <div class="footer-sns-icons" style="margin-top:25px; justify-content:flex-start;">
    <a href="#" class="f-icon"><i class="fab fa-instagram"></i></a>
    <a href="#" class="f-icon"><i class="fab fa-facebook-f"></i></a>
    <a href="#" class="f-icon"><i class="fas fa-comment"></i></a>
  </div>
</div>

<!-- 페이지 헤더 -->
<header class="page-header" style="background-image:url('https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=1200'); background-position:center;">
  <div class="page-header-content">
    <h1 data-aos="fade-up">COFFEE BEANS SHOP</h1>
    <p data-aos="fade-up" data-aos-delay="100">집에서도 여운의 프리미엄 커피를 즐겨보세요</p>
    <div class="breadcrumb" data-aos="fade-up" data-aos-delay="200">
      <a href="./index.html">HOME</a> <i class="fas fa-chevron-right"></i>
      <a href="#">온라인 숍</a> <i class="fas fa-chevron-right"></i>
      <span>원두/드립백</span>
    </div>
  </div>
</header>

<!-- 메인 섹션 -->
<section class="section">
  <div class="container" style="max-width:1200px;">

    <!-- 탭 필터 -->
    <div class="menu-filter" data-aos="fade-up" style="margin-bottom:60px;">
      <button class="filter-btn active" onclick="switchTab('all')">전체</button>
      <button class="filter-btn" onclick="switchTab('beans')">원두</button>
      <button class="filter-btn" onclick="switchTab('dripbag')">드립백</button>
    </div>

    <!-- ========== 전체 탭 ========== -->
    <div id="tab-all" class="tab-content active">

      <!-- 원두 섹션 -->
      <div style="margin-bottom:100px;" data-aos="fade-up">

        <!-- 원두 섹션 타이틀 -->
        <div class="section-title-block">
          <div class="label">Specialty Coffee Beans</div>
          <h3>Yeoun Signature Coffee Beans</h3>
          <p class="sub-desc">예멘 고산지대에서 직접 공수한 4가지 블렌드 원두</p>
          <div class="bar"></div>
        </div>

        <!-- 스토리 + 피라미드 -->
        <div style="display:grid; grid-template-columns:1.2fr 1fr; gap:50px; align-items:start; margin-bottom:60px;">
          <!-- 왼쪽: 커피 수확 이미지 -->
          <div data-aos="fade-right">
            <img src="https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=700&h=500&fit=crop" alt="커피 수확" style="width:100%; height:420px; object-fit:cover; border-radius:15px; box-shadow:0 10px 30px rgba(0,0,0,0.12);">
          </div>
          <!-- 오른쪽: 설명 박스들 -->
          <div style="display:flex; flex-direction:column; gap:25px;" data-aos="fade-left">
            <div style="border:2px solid #ddd; padding:25px; border-radius:15px; background:white;">
              <p style="font-size:1rem; margin-bottom:15px; line-height:1.6; color:#333;">
                <strong style="color:var(--accent-gold);">여운 (餘韻)</strong>은 남다른 원두를<br>사용합니다.
              </p>
              <div style="display:flex; align-items:center; gap:15px; margin-bottom:15px;">
                <img src="https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=100&h=100&fit=crop" alt="원두" style="width:70px; height:70px; border-radius:50%; object-fit:cover; box-shadow:0 4px 10px rgba(0,0,0,0.1);">
                <span style="font-size:1.8rem; font-weight:700; color:#333;">+</span>
                <div style="width:90px; height:55px; background:linear-gradient(to bottom, #CE1126 33.33%, white 33.33%, white 66.66%, black 66.66%); border:1px solid #ddd; box-shadow:0 2px 8px rgba(0,0,0,0.1);"></div>
              </div>
              <p style="color:#666; font-size:0.85rem; line-height:1.6;">
                커피의 여운(餘韻)은 예멘에서 직접 공수한 원두를 선별하여 A급 이상의 예멘 원두만 사용하여 고객에게 전달합니다.
              </p>
            </div>
            <!-- SPECIALTY COFFEE 박스 -->
            <div style="border:2px solid var(--accent-gold); padding:25px; border-radius:15px; background:white; box-shadow:0 4px 15px rgba(0,0,0,0.08);">
              <h4 style="font-size:1.2rem; margin-bottom:16px; color:var(--text-dark); text-align:center; font-weight:700; letter-spacing:1px;">SPECIALTY COFFEE?</h4>
              <div style="text-align:center; margin-bottom:16px;">
                <!-- SVG 피라미드 - 완전 재설계: 텍스트를 피라미드 안에만 배치, 외부 레이블은 단순화 -->
                <svg class="pyramid-wrap" viewBox="0 0 400 300" xmlns="http://www.w3.org/2000/svg">
                  <defs>
                    <linearGradient id="pyramidGrad" x1="0%" y1="0%" x2="0%" y2="100%">
                      <stop offset="0%"   style="stop-color:#6B3A1F"/>
                      <stop offset="40%"  style="stop-color:#9B6343"/>
                      <stop offset="75%"  style="stop-color:#C49A6C"/>
                      <stop offset="100%" style="stop-color:#D2B48C"/>
                    </linearGradient>
                    <clipPath id="pyramidClip">
                      <polygon points="200,18 372,282 28,282"/>
                    </clipPath>
                  </defs>

                  <!-- 피라미드 본체 -->
                  <polygon points="200,18 372,282 28,282" fill="url(#pyramidGrad)"/>

                  <!-- 구분선 -->
                  <line x1="85"  y1="115" x2="315" y2="115" stroke="rgba(255,255,255,0.7)" stroke-width="1.5"/>
                  <line x1="105" y1="178" x2="295" y2="178" stroke="rgba(255,255,255,0.7)" stroke-width="1.5"/>
                  <line x1="128" y1="237" x2="272" y2="237" stroke="rgba(255,255,255,0.7)" stroke-width="1.5"/>

                  <!-- 구간 1: SPECIALTY COFFEE (상단) -->
                  <text x="200" y="64"  text-anchor="middle" fill="white" font-size="13" font-weight="700" letter-spacing="0.5">SPECIALTY</text>
                  <text x="200" y="82"  text-anchor="middle" fill="white" font-size="13" font-weight="700" letter-spacing="0.5">COFFEE</text>
                  <text x="200" y="100" text-anchor="middle" fill="rgba(255,255,255,0.8)" font-size="8.5">최고등급 스페셜티</text>

                  <!-- 구간 2: PREMIUM COFFEE -->
                  <text x="200" y="135" text-anchor="middle" fill="white" font-size="12" font-weight="700" letter-spacing="0.5">PREMIUM COFFEE</text>
                  <text x="200" y="153" text-anchor="middle" fill="rgba(255,255,255,0.8)" font-size="8.5">원산지 표기 한정 원두</text>
                  <text x="200" y="167" text-anchor="middle" fill="rgba(255,255,255,0.8)" font-size="8.5">지역 특성의 선물급 커피</text>

                  <!-- 구간 3: COMMODITY COFFEE -->
                  <text x="200" y="198" text-anchor="middle" fill="white" font-size="11.5" font-weight="700" letter-spacing="0.5">COMMODITY COFFEE</text>
                  <text x="200" y="215" text-anchor="middle" fill="rgba(255,255,255,0.8)" font-size="8.5">일반 상업용 프랜차이즈 커피</text>
                  <text x="200" y="228" text-anchor="middle" fill="rgba(255,255,255,0.8)" font-size="8.5">대량 생산 보급형</text>

                  <!-- 구간 4: LOW GRADE -->
                  <text x="200" y="256" text-anchor="middle" fill="white" font-size="11" font-weight="700" letter-spacing="0.5">LOW GRADE COFFEE</text>
                  <text x="200" y="273" text-anchor="middle" fill="rgba(255,255,255,0.8)" font-size="8.5">인스턴트 · 가공식품용</text>
                </svg>
              </div>
              <p style="color:var(--accent-gold); font-size:0.88rem; line-height:1.7; text-align:center; font-weight:600; padding:12px 15px; background:#fef9f3; border-radius:10px;">
                여운(餘韻)의 커피는 최고급 원두를 4단계 선별·품질검사로<br>고품질만을 전달합니다.
              </p>
            </div>
          </div>
        </div>

        <!-- 원두 제품 리스트 -->
        <div style="padding-top:40px;">
          <div class="section-title-block" style="margin-bottom:30px;">
            <div class="label">Specialty Coffee Beans</div>
            <h3>Yeoun Signature Coffee Beans</h3>
            <p class="sub-desc">예멘 고산지대에서 직접 공수한 4가지 블렌드 원두</p>
            <div class="bar"></div>
          </div>

          <!-- 가로 1열 리스트 -->
          <div class="product-row-list" data-aos="fade-up">
            <!-- 원두 1 -->
            <div class="product-row-item">
              <img class="product-row-img" src="https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=400&h=320&fit=crop" alt="그린 블렌드">
              <div class="product-row-info">
                <h5>여은 | 그린 블렌드 원두</h5>
                <p class="sub">Green Blend · Persona Series</p>
                <p class="desc">예멘 고산지 원두의 싱그러운 식물성 풍미와 깔끔한 산미가 특징입니다. 라이트~미디엄 로스팅으로 원두 본연의 향을 살렸습니다.</p>
                <span class="tag">라이트 로스팅</span>
              </div>
              <div class="product-row-price">
                <span class="price">16,800원~</span>
                <button class="btn-add-row" onclick="switchTab('beans')">담기 →</button>
              </div>
            </div>
            <!-- 원두 2 -->
            <div class="product-row-item">
              <img class="product-row-img" src="https://images.unsplash.com/photo-1559056199-641a0ac8b55e?w=400&h=320&fit=crop" alt="옐로우 블렌드">
              <div class="product-row-info">
                <h5>여은 | 옐로우 블렌드 원두</h5>
                <p class="sub">Yellow Blend · Persona Series</p>
                <p class="desc">달콤한 과일향과 부드러운 바디감이 조화를 이룹니다. 드립·핸드드립에 최적화된 미디엄 로스팅입니다.</p>
                <span class="tag">미디엄 로스팅</span>
              </div>
              <div class="product-row-price">
                <span class="price">16,800원~</span>
                <button class="btn-add-row" onclick="switchTab('beans')">담기 →</button>
              </div>
            </div>
            <!-- 원두 3 -->
            <div class="product-row-item">
              <img class="product-row-img" src="https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=400&h=320&fit=crop" alt="블랙 블렌드">
              <div class="product-row-info">
                <h5>여은 | 블랙 블렌드 원두</h5>
                <p class="sub">Black Blend · Persona Series</p>
                <p class="desc">진하고 묵직한 다크 로스팅의 정수. 에스프레소·아메리카노에 적합하며 쌉싸름한 초콜릿 여운이 깊게 남습니다.</p>
                <span class="tag">다크 로스팅</span>
              </div>
              <div class="product-row-price">
                <span class="price">16,800원~</span>
                <button class="btn-add-row" onclick="switchTab('beans')">담기 →</button>
              </div>
            </div>
            <!-- 원두 4 -->
            <div class="product-row-item">
              <img class="product-row-img" src="https://images.unsplash.com/photo-1511920170033-f8396924c348?w=400&h=320&fit=crop" alt="레드 블렌드">
              <div class="product-row-info">
                <h5>여은 | 레드 블렌드 원두</h5>
                <p class="sub">Red Blend · Persona Series</p>
                <p class="desc">화사한 베리향과 밸런스 잡힌 산미가 특징. 콜드브루·아이스커피에 탁월하며 상쾌한 과일 피니시를 선사합니다.</p>
                <span class="tag">미디엄-다크</span>
              </div>
              <div class="product-row-price">
                <span class="price">16,800원~</span>
                <button class="btn-add-row" onclick="switchTab('beans')">담기 →</button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 드립백 섹션 -->
      <div style="margin-top:20px;" data-aos="fade-up">

        <!-- 드립백 섹션 타이틀 -->
        <div class="section-title-block">
          <div class="label">Drip Bag Collection</div>
          <h3>Yeoun Signature Drip Bag</h3>
          <p class="sub-desc">간편하게 즐기는 여운의 핸드드립 한 잔</p>
          <div class="bar"></div>
        </div>

        <!-- 드립백 대표 이미지 -->
        <div style="display:grid; grid-template-columns:300px 1fr; gap:40px; align-items:start; max-width:1000px; margin:0 auto 60px; border:2px solid #eee; border-radius:16px; padding:30px; background:white;">
          <div>
            <img src="https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=600&h=500&fit=crop" alt="드립백" style="width:100%; height:260px; object-fit:cover; border-radius:12px;">
          </div>
          <div style="display:flex; flex-direction:column; justify-content:center; gap:12px;">
            <h4 style="font-family:'Playfair Display',serif; font-size:1.5rem; color:var(--accent-gold);">여은 | 드립백 컬렉션</h4>
            <p style="color:#999; font-size:0.9rem;">Drip Bag Collection · 4 Types</p>
            <p style="color:#666; font-size:0.88rem; line-height:1.7;">예멘 원두를 최적의 분쇄도로 개별 포장한 드립백입니다.<br>뜨거운 물만 있으면 어디서든 카페 수준의 핸드드립을 즐길 수 있습니다.</p>
            <div style="display:flex; gap:8px; flex-wrap:wrap; margin-top:4px;">
              <span style="background:#f5f5f5; color:#666; font-size:0.75rem; padding:4px 12px; border-radius:20px;">개당 포장</span>
              <span style="background:#f5f5f5; color:#666; font-size:0.75rem; padding:4px 12px; border-radius:20px;">10g 기준</span>
              <span style="background:#fef3e2; color:var(--accent-gold); font-size:0.75rem; padding:4px 12px; border-radius:20px; border:1px solid #f5d99e;">스페셜티 등급</span>
            </div>
          </div>
        </div>

        <!-- 드립백 4가지 - 가로 1열 리스트 -->
        <div class="product-row-list" data-aos="fade-up">
          <div class="product-row-item" onclick="switchTab('dripbag')">
            <img class="product-row-img" src="https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=400&h=320&fit=crop" alt="딥 에스프레소">
            <div class="product-row-info">
              <h5>여은 | 딥 에스프레소 드립백</h5>
              <p class="sub">Deep Espresso · Blend</p>
              <p class="desc">강하고 진한 에스프레소 풍미의 다크 블렌드. 묵직한 바디감과 쌉싸름한 카카오 여운이 특징입니다.</p>
              <span class="tag">Deep & Rich</span>
            </div>
            <div class="product-row-price">
              <span class="price">32,800원</span>
              <button class="btn-add-row" onclick="event.stopPropagation(); addToCart('딥 에스프레소 드립백', 32800)">담기 +</button>
            </div>
          </div>
          <div class="product-row-item" onclick="switchTab('dripbag')">
            <img class="product-row-img" src="https://images.unsplash.com/photo-1587049352846-4a222e784422?w=400&h=320&fit=crop" alt="인텐스 다크">
            <div class="product-row-info">
              <h5>여은 | 인텐스 다크 드립백</h5>
              <p class="sub">Intense Dark · Blend</p>
              <p class="desc">초콜릿과 카라멜 노트의 강렬한 다크 로스팅. 아침을 깨우는 진한 한 잔에 최적화된 블렌드입니다.</p>
              <span class="tag">Chocolate & Rich</span>
            </div>
            <div class="product-row-price">
              <span class="price">32,800원</span>
              <button class="btn-add-row" onclick="event.stopPropagation(); addToCart('인텐스 다크 드립백', 32800)">담기 +</button>
            </div>
          </div>
          <div class="product-row-item" onclick="switchTab('dripbag')">
            <img class="product-row-img" src="https://images.unsplash.com/photo-1442512595331-e89e73853f31?w=400&h=320&fit=crop" alt="마일드 브리즈">
            <div class="product-row-info">
              <h5>여은 | 마일드 브리즈 드립백</h5>
              <p class="sub">Mild Breeze · Blend</p>
              <p class="desc">부드럽고 달콤한 미디엄 로스팅. 과일향과 꿀 같은 단맛이 조화를 이루는 일상용 베스트셀러 드립백입니다.</p>
              <span class="tag">Sweet & Balance</span>
            </div>
            <div class="product-row-price">
              <span class="price">32,800원</span>
              <button class="btn-add-row" onclick="event.stopPropagation(); addToCart('마일드 브리즈 드립백', 32800)">담기 +</button>
            </div>
          </div>
          <div class="product-row-item" onclick="switchTab('dripbag')">
            <img class="product-row-img" src="https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400&h=320&fit=crop" alt="스모키 벨벳">
            <div class="product-row-info">
              <h5>여은 | 스모키 벨벳 드립백</h5>
              <p class="sub">Smoky Velvet · Blend</p>
              <p class="desc">견과류와 훈연 향이 어우러진 개성적인 블렌드. 깊고 복잡한 풍미를 즐기는 커피 마니아를 위한 드립백입니다.</p>
              <span class="tag">Deep & Nutty</span>
            </div>
            <div class="product-row-price">
              <span class="price">32,800원</span>
              <button class="btn-add-row" onclick="event.stopPropagation(); addToCart('스모키 벨벳 드립백', 32800)">담기 +</button>
            </div>
          </div>
        </div>
      </div>
    </div><!-- /tab-all -->


    <!-- ========== 원두 탭 ========== -->
    <div id="tab-beans" class="tab-content" style="display:none;">

      <h2 style="font-family:'Playfair Display',serif; font-size:2.2rem; color:var(--accent-gold); text-align:center; margin-bottom:50px;" data-aos="fade-up">Yeoun Signature Coffee Beans</h2>

      <!-- 제품 상세 뷰 -->
      <div style="display:grid; grid-template-columns:420px 1fr; gap:60px; align-items:start; max-width:1100px; margin:0 auto;">
        <!-- 왼쪽: 제품 이미지 + 색상 선택 -->
        <div style="border:2px solid #ddd; padding:35px; border-radius:15px; text-align:center; background:white;" data-aos="fade-right">
          <img id="main-product-img" src="https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=700&h=500&fit=crop" alt="원두" style="width:100%; height:280px; object-fit:cover; border-radius:10px; margin-bottom:25px; transition:all 0.3s;">
          <h3 style="color:var(--accent-gold); font-size:1.2rem; margin-bottom:8px;">여은 | 페르소나 블렌드 원두</h3>
          <p style="color:#999; margin-bottom:18px; font-size:0.9rem;">Persona Blend Coffee Beans</p>
          <p style="color:#666; line-height:1.7; font-size:0.88rem; margin-bottom:24px;">
            여운(餘韻)에서 직접 공수한 4가지 예멘 원두를<br>무게별로 구매하실 수 있습니다.
          </p>
          <!-- 색상(종류) 선택 -->
          <div style="display:flex; gap:12px; justify-content:center;">
            <div title="그린 블렌드" style="width:48px; height:68px; background:linear-gradient(135deg,#059669,#34d399); border-radius:6px; cursor:pointer; border:2px solid transparent; transition:all 0.3s;" onclick="selectColor(this,'https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=700&h=500&fit=crop','https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=900&h=700&fit=crop')" onmouseover="if(!this.classList.contains('selected'))this.style.borderColor='var(--accent-gold)'" onmouseout="if(!this.classList.contains('selected'))this.style.borderColor='transparent'"></div>
            <div title="옐로우 블렌드" style="width:48px; height:68px; background:linear-gradient(135deg,#d97706,#fbbf24); border-radius:6px; cursor:pointer; border:2px solid transparent; transition:all 0.3s;" onclick="selectColor(this,'https://images.unsplash.com/photo-1559056199-641a0ac8b55e?w=700&h=500&fit=crop','https://images.unsplash.com/photo-1559056199-641a0ac8b55e?w=900&h=700&fit=crop')" onmouseover="if(!this.classList.contains('selected'))this.style.borderColor='var(--accent-gold)'" onmouseout="if(!this.classList.contains('selected'))this.style.borderColor='transparent'"></div>
            <div title="블랙 블렌드" style="width:48px; height:68px; background:linear-gradient(135deg,#1f2937,#374151); border-radius:6px; cursor:pointer; border:2px solid transparent; transition:all 0.3s;" onclick="selectColor(this,'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=700&h=500&fit=crop','https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=900&h=700&fit=crop')" onmouseover="if(!this.classList.contains('selected'))this.style.borderColor='var(--accent-gold)'" onmouseout="if(!this.classList.contains('selected'))this.style.borderColor='transparent'"></div>
            <div title="레드 블렌드" style="width:48px; height:68px; background:linear-gradient(135deg,#dc2626,#f87171); border-radius:6px; cursor:pointer; border:2px solid transparent; transition:all 0.3s;" onclick="selectColor(this,'https://images.unsplash.com/photo-1511920170033-f8396924c348?w=700&h=500&fit=crop','https://images.unsplash.com/photo-1511920170033-f8396924c348?w=900&h=700&fit=crop')" onmouseover="if(!this.classList.contains('selected'))this.style.borderColor='var(--accent-gold)'" onmouseout="if(!this.classList.contains('selected'))this.style.borderColor='transparent'"></div>
          </div>
          <p style="margin-top:10px; font-size:0.78rem; color:#aaa;">↑ 색상을 선택하면 우측 이미지가 변경됩니다</p>
        </div>

        <!-- 오른쪽: 확대 이미지 + 옵션 선택 -->
        <div data-aos="fade-left">
          <h3 style="color:var(--accent-gold); font-size:1.7rem; margin-bottom:8px;">여은 | 페르소나 블렌드 원두 (싱글)</h3>
          <p style="color:#999; margin-bottom:24px; font-size:1rem;">Persona Blend Coffee Beans (Single)</p>

          <!-- 확대 이미지 (elevateZoom 대상) -->
          <div class="zoom-container-box" style="margin-bottom:28px; padding:16px;">
            <img id="zoom-product-img"
                 src="https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=900&h=700&fit=crop"
                 data-zoom-image="https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=900&h=700&fit=crop"
                 alt="확대 이미지"
                 style="max-width:100%; max-height:340px; cursor:crosshair;">
            <span class="zoom-hint">🔍 마우스를 올리면 확대됩니다</span>
          </div>

          <!-- 종류 선택 -->
          <div style="margin-bottom:18px;">
            <label style="display:block; margin-bottom:8px; color:#555; font-weight:700; font-size:0.9rem;">종류</label>
            <select id="product-type" style="width:100%; padding:14px; border:2px solid #ddd; border-radius:10px; font-size:0.95rem; color:#555; background:white;">
              <option value="">- [필수] 옵션을 선택해 주세요 -</option>
              <option value="green">그린 블렌드</option>
              <option value="yellow">옐로우 블렌드</option>
              <option value="black">블랙 블렌드</option>
              <option value="red">레드 블렌드</option>
            </select>
          </div>

          <!-- 무게량 선택 -->
          <div style="margin-bottom:26px;">
            <label style="display:block; margin-bottom:8px; color:#555; font-weight:700; font-size:0.9rem;">무게량</label>
            <select id="product-weight" onchange="updatePrice()" style="width:100%; padding:14px; border:2px solid #ddd; border-radius:10px; font-size:0.95rem; color:#555; background:white;">
              <option value="">- [필수] 옵션을 선택해 주세요 -</option>
              <option value="16800">200g — 16,800원</option>
              <option value="38500">500g — 38,500원</option>
              <option value="72000">1kg  — 72,000원</option>
              <option value="138000">2kg  — 138,000원</option>
            </select>
          </div>

          <!-- 담기 버튼 -->
          <button class="btn-add-cart" onclick="addToCartFromDetail()" style="width:100%; padding:18px; background:var(--accent-gold); color:white; border:none; border-radius:10px; font-size:1.05rem; font-weight:700; cursor:pointer; transition:all 0.3s; letter-spacing:1px;" onmouseover="this.style.background='#c8954a'" onmouseout="this.style.background='var(--accent-gold)'">
            <i class="fas fa-shopping-bag" style="margin-right:8px;"></i> 장바구니 담기
          </button>
        </div>
      </div>
    </div><!-- /tab-beans -->


    <!-- ========== 드립백 탭 ========== -->
    <div id="tab-dripbag" class="tab-content" style="display:none;">

      <!-- 타이틀 -->
      <div class="section-title-block" data-aos="fade-up" style="margin-bottom:50px;">
        <div class="label">Drip Bag Collection</div>
        <h3 style="font-family:'Playfair Display',serif; font-size:2.2rem; color:var(--accent-gold);">Yeoun Signature Drip Bag</h3>
        <p class="sub-desc">간편하게 즐기는 여운의 핸드드립 한 잔</p>
        <div class="bar"></div>
      </div>

      <!-- 선택 상품 미리보기 + Zoom -->
      <div style="display:grid; grid-template-columns:1fr 1.4fr; gap:40px; align-items:start; max-width:1050px; margin:0 auto 50px;" data-aos="fade-up">
        <!-- 왼쪽: 선택된 제품 카드 -->
        <div style="border:2px solid #ddd; padding:28px; border-radius:15px; text-align:center; background:white; box-shadow:0 4px 16px rgba(0,0,0,0.06);">
          <img id="dripbag-main-img" src="https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=600&h=500&fit=crop" alt="드립백" style="width:100%; height:240px; object-fit:cover; border-radius:10px; margin-bottom:18px; transition:all 0.3s;">
          <h4 id="dripbag-title" style="color:var(--accent-gold); font-size:1.05rem; margin-bottom:6px; font-weight:700;">여운 | 딥 에스프레소 (블렌드)</h4>
          <p id="dripbag-sub" style="color:#999; font-size:0.82rem; margin-bottom:10px;">Deep Espresso</p>
          <p id="dripbag-desc" style="color:#666; font-size:0.8rem; line-height:1.6;">진하고 묵직한 에스프레소 풍미의 드립백입니다.</p>
        </div>
        <!-- 오른쪽: 확대 이미지 (elevateZoom) -->
        <div>
          <div class="zoom-container-box" style="min-height:360px; padding:20px;">
            <img id="dripbag-zoom-img"
                 src="https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=900&h=700&fit=crop"
                 data-zoom-image="https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=900&h=700&fit=crop"
                 alt="확대 이미지"
                 style="max-width:100%; max-height:330px; cursor:crosshair;">
            <span class="zoom-hint">🔍 마우스를 올리면 확대됩니다</span>
          </div>
        </div>
      </div>

      <!-- 4가지 옵션 선택 -->
      <div style="max-width:1100px; margin:0 auto;" data-aos="fade-up">
        <h3 style="font-size:1.4rem; color:var(--text-dark); margin-bottom:30px; text-align:center; padding-bottom:14px; border-bottom:2px solid var(--accent-gold);">4가지 옵션 선택 <span style="color:var(--accent-gold);">_4 Types</span></h3>

        <!-- 가로 4열 카드 (index.html .card 스타일) -->
        <div class="menu-grid" style="grid-template-columns:repeat(4,1fr); gap:40px;">

          <!-- 드립백 1 -->
          <div class="card dripbag-card" id="driprow-1"
               onclick="selectDripbagRow(1,'https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=600&h=500&fit=crop','딥 에스프레소 드립백','Deep Espresso','진하고 묵직한 에스프레소 풍미의 드립백입니다.',32800)">
            <div class="thumb-box">
              <div class="thumb-img" style="background-image:url('https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=600&h=500&fit=crop');"></div>
              <div class="overlay">
                <button class="btn-add-cart" onclick="event.stopPropagation(); addToCart('딥 에스프레소 드립백', 32800)">담기</button>
              </div>
            </div>
            <h4>딥 에스프레소</h4>
            <p class="subtitle">Deep Espresso</p>
            <p class="description">강하고 진한 에스프레소 풍미의<br>다크 블렌드</p>
            <p class="price">32,800원</p>
          </div>

          <!-- 드립백 2 -->
          <div class="card dripbag-card" id="driprow-2"
               onclick="selectDripbagRow(2,'https://images.unsplash.com/photo-1587049352846-4a222e784422?w=600&h=500&fit=crop','인텐스 다크 드립백','Intense Dark','초콜릿과 카라멜 노트의 강렬한 다크 로스팅 드립백입니다.',32800)">
            <div class="thumb-box">
              <div class="thumb-img" style="background-image:url('https://images.unsplash.com/photo-1587049352846-4a222e784422?w=600&h=500&fit=crop');"></div>
              <div class="overlay">
                <button class="btn-add-cart" onclick="event.stopPropagation(); addToCart('인텐스 다크 드립백', 32800)">담기</button>
              </div>
            </div>
            <h4>인텐스 다크</h4>
            <p class="subtitle">Intense Dark</p>
            <p class="description">초콜릿과 카라멜 노트의<br>강렬한 다크 로스팅</p>
            <p class="price">32,800원</p>
          </div>

          <!-- 드립백 3 -->
          <div class="card dripbag-card" id="driprow-3"
               onclick="selectDripbagRow(3,'https://images.unsplash.com/photo-1442512595331-e89e73853f31?w=600&h=500&fit=crop','마일드 브리즈 드립백','Mild Breeze','부드럽고 달콤한 미디엄 로스팅 드립백입니다.',32800)">
            <div class="thumb-box">
              <div class="thumb-img" style="background-image:url('https://images.unsplash.com/photo-1442512595331-e89e73853f31?w=600&h=500&fit=crop');"></div>
              <div class="overlay">
                <button class="btn-add-cart" onclick="event.stopPropagation(); addToCart('마일드 브리즈 드립백', 32800)">담기</button>
              </div>
            </div>
            <h4>마일드 브리즈</h4>
            <p class="subtitle">Mild Breeze</p>
            <p class="description">부드럽고 달콤한 미디엄 로스팅.<br>일상용 베스트셀러</p>
            <p class="price">32,800원</p>
          </div>

          <!-- 드립백 4 -->
          <div class="card dripbag-card" id="driprow-4"
               onclick="selectDripbagRow(4,'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=600&h=500&fit=crop','스모키 벨벳 드립백','Smoky Velvet','견과류와 훈연 향이 어우러진 개성적인 드립백입니다.',32800)">
            <div class="thumb-box">
              <div class="thumb-img" style="background-image:url('https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=600&h=500&fit=crop');"></div>
              <div class="overlay">
                <button class="btn-add-cart" onclick="event.stopPropagation(); addToCart('스모키 벨벳 드립백', 32800)">담기</button>
              </div>
            </div>
            <h4>스모키 벨벳</h4>
            <p class="subtitle">Smoky Velvet</p>
            <p class="description">견과류와 훈연 향이 어우러진<br>개성적인 블렌드</p>
            <p class="price">32,800원</p>
          </div>

        </div>
      </div>
    </div><!-- /tab-dripbag -->

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
        <li><a href="/brand.html">브랜드 스토리</a></li>
        <li><a href="/store.html">매장 안내</a></li>
        <li><a href="/shop.html">원두 이야기</a></li>
        <li><a href="#">채용 공고</a></li>
      </ul>
    </div>
    <div class="footer-info-col">
      <h5>SUPPORT</h5>
      <ul>
        <li><a href="/contact.html">고객센터</a></li>
        <li><a href="/notice.html">자주 묻는 질문</a></li>
        <li><a href="/contact.html">1:1 문의</a></li>
        <li><a href="#">대량 주문/납품 안내</a></li>
      </ul>
    </div>
    <div class="footer-info-col">
      <h5>CONTACT US</h5>
      <p style="font-size:1.5rem; font-weight:700; color:var(--text-dark); margin-bottom:10px;">02-123-4567</p>
      <p style="font-size:0.85rem; color:#888;">평일 09:00 - 18:00 (주말/공휴일 휴무)<br>yeowun@yeowuncoffee.com</p>
    </div>
  </div>
  <div class="footer-bottom">
    <div class="company-details">
      (주)여운컴퍼니 | 대표자: 홍길동 | 사업자등록번호: 123-45-67890<br>
      서울특별시 강남구 테헤란로 123 여운빌딩 12층 | 통신판매업신고: 제2026-서울강남-0000호<br>
      <span style="margin-top:10px; display:inline-block;">&copy; 2026 YEOWUN COFFEE. ALL RIGHTS RESERVED.</span>
    </div>
    <p style="font-size:0.75rem; color:#aaa;">이용약관 | <strong>개인정보처리방침</strong> | 스팸거부정책</p>
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
        <input type="tel" id="cart-phone" placeholder="010-0000-0000" style="width:100%; padding:12px; border:1px solid #ddd; border-radius:8px; font-size:0.95rem; box-sizing:border-box;">
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
      <div id="order-menu-list" style="background:#f8f5f0; padding:15px; border-radius:10px; max-height:150px; overflow-y:auto; font-size:0.9rem;"></div>
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
      <div class="order-row" style="font-weight:700; color:var(--accent-gold); border-top:1px solid #ddd; margin-top:10px; padding-top:10px;">
        <span>최종 결제 금액</span><span id="final-order-price">0원</span>
      </div>
    </div>
    <button class="btn-final-order" onclick="confirmFinalOrder()">주문 확정하기</button>
    <p onclick="closeOrderModal()" style="text-align:center; margin-top:15px; font-size:0.8rem; color:#aaa; cursor:pointer; text-decoration:underline;">취소하고 돌아가기</p>
  </div>
</div>

<!-- 외부 스크립트 -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="/js/script.js"></script>

<script>
  // ===== 탭 전환 =====
  function switchTab(tabName) {
    document.querySelectorAll('.filter-btn').forEach(btn => btn.classList.remove('active'));
    const map = { all:0, beans:1, dripbag:2 };
    document.querySelectorAll('.filter-btn')[map[tabName]].classList.add('active');

    document.querySelectorAll('.tab-content').forEach(tab => {
      tab.style.display = 'none';
      tab.classList.remove('active');
    });
    const sel = document.getElementById('tab-' + tabName);
    if (sel) {
      sel.style.display = 'block';
      sel.classList.add('active');
    }

    // 탭 전환 후 zoom 재초기화
    setTimeout(() => { initZoom(); }, 100);
  }

  // ===== elevateZoom 초기화 (공통) =====
  function initZoom() {
    if (!window.matchMedia("(min-width: 1024px)").matches) return;

    // 기존 zoomContainer 전부 제거
    $('.zoomContainer').remove();

    // 원두탭 zoom
    const bz = document.getElementById('zoom-product-img');
    if (bz && bz.offsetParent !== null) {
      $(bz).elevateZoom({
        zoomType: "lens",
        lensShape: "round",
        lensSize: 220,
        responsive: true,
        scrollZoom: false
      });
    }

    // 드립백탭 zoom
    const dz = document.getElementById('dripbag-zoom-img');
    if (dz && dz.offsetParent !== null) {
      $(dz).elevateZoom({
        zoomType: "lens",
        lensShape: "round",
        lensSize: 220,
        responsive: true,
        scrollZoom: false
      });
    }
  }

  // ===== 원두 색상 선택 (썸네일 + 확대 이미지 변경) =====
  function selectColor(element, mainUrl, zoomUrl) {
    document.querySelectorAll('#tab-beans [title]').forEach(el => {
      el.classList.remove('selected');
      el.style.borderColor = 'transparent';
    });
    element.classList.add('selected');
    element.style.borderColor = 'var(--accent-gold)';

    // 왼쪽 작은 이미지
    document.getElementById('main-product-img').src = mainUrl;

    // 오른쪽 zoom 이미지 교체 — elevateZoom 완전 재생성
    const container = document.getElementById('zoom-product-img').parentNode;
    $('.zoomContainer').remove();

    const newImg = document.createElement('img');
    newImg.id = 'zoom-product-img';
    newImg.alt = '확대 이미지';
    newImg.style.cssText = 'max-width:100%; max-height:340px; cursor:crosshair;';
    newImg.src = zoomUrl;
    newImg.setAttribute('data-zoom-image', zoomUrl);

    // 기존 img 제거 후 새 img 삽입
    const oldImg = document.getElementById('zoom-product-img');
    container.replaceChild(newImg, oldImg);

    if (window.matchMedia("(min-width: 1024px)").matches) {
      newImg.onload = function() {
        $(newImg).elevateZoom({
          zoomType: "lens", lensShape: "round", lensSize: 220,
          responsive: true, scrollZoom: false
        });
      };
      if (newImg.complete) {
        setTimeout(() => {
          $(newImg).elevateZoom({
            zoomType: "lens", lensShape: "round", lensSize: 220,
            responsive: true, scrollZoom: false
          });
        }, 50);
      }
    }
  }

  // ===== 드립백 행 클릭 — 상단 미리보기 이미지 교체 + highlight =====
  function selectDripbagRow(idx, mainUrl, name, sub, desc, price) {
    // 카드 선택 표시
    for(let i=1;i<=4;i++){
      const el = document.getElementById('driprow-'+i);
      if(el) el.classList.remove('selected-row');
    }
    const row = document.getElementById('driprow-'+idx);
    if(row) row.classList.add('selected-row');

    // 왼쪽 대표 이미지 변경
    const mImg = document.getElementById('dripbag-main-img');
    if(mImg) mImg.src = mainUrl;

    // 텍스트 업데이트
    const tEl = document.getElementById('dripbag-title');
    const sEl = document.getElementById('dripbag-sub');
    const dEl = document.getElementById('dripbag-desc');
    if(tEl) tEl.textContent = '여은 | ' + name;
    if(sEl) sEl.textContent = sub;
    if(dEl) dEl.textContent = desc;

    // 오른쪽 zoom 이미지 교체 — elevateZoom 완전 재생성
    const zImg = document.getElementById('dripbag-zoom-img');
    if(!zImg) return;

    const zUrl = mainUrl.replace('w=600', 'w=900').replace('h=500', 'h=700');
    const container = zImg.parentNode;
    $('.zoomContainer').remove();

    const newImg = document.createElement('img');
    newImg.id = 'dripbag-zoom-img';
    newImg.alt = '확대 이미지';
    newImg.style.cssText = 'max-width:100%; max-height:330px; cursor:crosshair;';
    newImg.src = zUrl;
    newImg.setAttribute('data-zoom-image', zUrl);
    container.replaceChild(newImg, zImg);

    if(window.matchMedia("(min-width: 1024px)").matches) {
      newImg.onload = function() {
        $(newImg).elevateZoom({
          zoomType: "lens", lensShape: "round", lensSize: 220,
          responsive: true, scrollZoom: false
        });
      };
      if (newImg.complete) {
        setTimeout(() => {
          $(newImg).elevateZoom({
            zoomType: "lens", lensShape: "round", lensSize: 220,
            responsive: true, scrollZoom: false
          });
        }, 50);
      }
    }
  }

  // ===== 가격 업데이트 =====
  function updatePrice() {}

  // ===== 원두 탭 담기 =====
  function addToCartFromDetail() {
    const typeSelect = document.getElementById('product-type');
    const weightSelect = document.getElementById('product-weight');
    if (!typeSelect.value) { alert('종류를 선택해주세요.'); return; }
    if (!weightSelect.value) { alert('무게량을 선택해주세요.'); return; }

    const productName = '페르소나 블렌드 원두 - '
            + typeSelect.options[typeSelect.selectedIndex].text
            + ' '
            + weightSelect.options[weightSelect.selectedIndex].text.split('—')[0].trim();
    const price = parseInt(weightSelect.value);

    addToCart(productName, price);
  }

  // ===== 페이지 로드 완료 후 =====
  $(document).ready(function() {
    initZoom();
  });
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
