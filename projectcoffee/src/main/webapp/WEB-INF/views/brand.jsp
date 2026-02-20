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
    <title>브랜드 스토리 | YEOWUN COFFEE</title>

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
<header class="page-header" style="background-image: url('https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=1200'); background-position: center;">
    <div class="page-header-content">
        <h1 data-aos="fade-up">BRAND STORY</h1>
        <p data-aos="fade-up" data-aos-delay="100">여운, 한 잔의 커피에 담긴 깊은 이야기</p>
        <div class="breadcrumb" data-aos="fade-up" data-aos-delay="200">
            <a href="./index.html">HOME</a> <i class="fas fa-chevron-right"></i>
            <a href="#">브랜드</a> <i class="fas fa-chevron-right"></i>
            <span>여운 스토리</span>
        </div>
    </div>
</header>

<!-- 브랜드 스토리 섹션 -->
<section class="section">
    <div class="container">

        <!-- Brand Value 섹션 -->
        <div style="max-width: 1200px; margin: 0 auto 100px; text-align: center;" data-aos="fade-up">
            <h2 style="font-family: 'Playfair Display', serif; font-size: 2.5rem; margin-bottom: 15px; color: var(--accent-gold);">Cafe YEOWUN Brand Value</h2>
            <p style="font-size: 1rem; color: #999; margin-bottom: 60px;">
                커피 애호가 환영의 커피가 저니2로 위하는 감정이 넘는 곳입 입니다
            </p>

            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 40px; max-width: 900px; margin: 0 auto;">
                <!-- 왼쪽: 엄격 -->
                <div style="position: relative;" data-aos="zoom-in" data-aos-delay="100">
                    <div style="width: 200px; height: 280px; margin: 0 auto; border-radius: 50% / 60%; background: linear-gradient(135deg, #f5e6d3 0%, #e8d4bd 100%); display: flex; align-items: center; justify-content: center; box-shadow: 0 10px 30px rgba(0,0,0,0.1); position: relative; overflow: hidden;">
                        <div style="text-align: center; color: white; padding: 30px; position: relative; z-index: 2;">
                            <h3 style="font-size: 1.8rem; margin-bottom: 15px; font-weight: 700;">엄격</h3>
                            <p style="font-size: 0.85rem; line-height: 1.6;">품질 관리 시스템과<br>각각의 섬세한 공정</p>
                        </div>
                    </div>
                </div>

                <!-- 가운데: 최고품질 -->
                <div style="position: relative;" data-aos="zoom-in" data-aos-delay="200">
                    <div style="width: 200px; height: 280px; margin: 0 auto; border-radius: 50% / 60%; background: url('https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=400') center/cover; display: flex; align-items: center; justify-content: center; box-shadow: 0 10px 30px rgba(0,0,0,0.2); position: relative; overflow: hidden;">
                        <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0,0,0,0.3);"></div>
                        <div style="text-align: center; color: white; padding: 30px; position: relative; z-index: 2;">
                            <h3 style="font-size: 1.8rem; margin-bottom: 15px; font-weight: 700;">최고품질</h3>
                            <p style="font-size: 0.85rem; line-height: 1.6;">예맨에는 드립으로<br>빼곡 저리한 콘트롤<br>엄격한 테스트</p>
                        </div>
                    </div>
                </div>

                <!-- 오른쪽: 전문성 -->
                <div style="position: relative;" data-aos="zoom-in" data-aos-delay="300">
                    <div style="width: 200px; height: 280px; margin: 0 auto; border-radius: 50% / 60%; background: url('https://images.unsplash.com/photo-1511920170033-f8396924c348?w=400') center/cover; display: flex; align-items: center; justify-content: center; box-shadow: 0 10px 30px rgba(0,0,0,0.1); position: relative; overflow: hidden;">
                        <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0,0,0,0.3);"></div>
                        <div style="text-align: center; color: white; padding: 30px; position: relative; z-index: 2;">
                            <h3 style="font-size: 1.8rem; margin-bottom: 15px; font-weight: 700;">전문성</h3>
                            <p style="font-size: 0.85rem; line-height: 1.6;">예맨의로부터 좋아하는<br>예쁜 로칼처리으로<br>커피의 맛과 향을<br>제공 합니다</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 타임라인 -->
        <div style="max-width: 1000px; margin: 0 auto 100px;">
            <h3 style="text-align: center; font-size: 2rem; margin-bottom: 60px; color: var(--text-dark);" data-aos="fade-up">OUR JOURNEY</h3>

            <div style="position: relative;">
                <!-- 세로선 -->
                <div style="position: absolute; left: 50%; transform: translateX(-50%); width: 2px; height: 100%; background: #e5e5e5;"></div>

                <!-- 2020 -->
                <div style="display: flex; align-items: center; margin-bottom: 80px; position: relative;" data-aos="fade-right">
                    <div style="flex: 1; text-align: right; padding-right: 50px;">
                        <h4 style="font-size: 1.5rem; color: var(--accent-gold); margin-bottom: 10px;">2020</h4>
                        <p style="color: #666; line-height: 1.7;">예멘 모카 원두 직수입 시작<br>여운 커피 브랜드 설립</p>
                    </div>
                    <div style="width: 20px; height: 20px; background: var(--accent-gold); border-radius: 50%; position: relative; z-index: 2; border: 4px solid white;"></div>
                    <div style="flex: 1;"></div>
                </div>

                <!-- 2021 -->
                <div style="display: flex; align-items: center; margin-bottom: 80px; position: relative;" data-aos="fade-left">
                    <div style="flex: 1;"></div>
                    <div style="width: 20px; height: 20px; background: var(--accent-gold); border-radius: 50%; position: relative; z-index: 2; border: 4px solid white;"></div>
                    <div style="flex: 1; padding-left: 50px;">
                        <h4 style="font-size: 1.5rem; color: var(--accent-gold); margin-bottom: 10px;">2021</h4>
                        <p style="color: #666; line-height: 1.7;">강남 1호점 오픈<br>로스팅 팩토리 설립</p>
                    </div>
                </div>

                <!-- 2022 -->
                <div style="display: flex; align-items: center; margin-bottom: 80px; position: relative;" data-aos="fade-right">
                    <div style="flex: 1; text-align: right; padding-right: 50px;">
                        <h4 style="font-size: 1.5rem; color: var(--accent-gold); margin-bottom: 10px;">2022</h4>
                        <p style="color: #666; line-height: 1.7;">전국 20개 매장 달성<br>온라인 스토어 오픈</p>
                    </div>
                    <div style="width: 20px; height: 20px; background: var(--accent-gold); border-radius: 50%; position: relative; z-index: 2; border: 4px solid white;"></div>
                    <div style="flex: 1;"></div>
                </div>

                <!-- 2024 -->
                <div style="display: flex; align-items: center; margin-bottom: 80px; position: relative;" data-aos="fade-left">
                    <div style="flex: 1;"></div>
                    <div style="width: 20px; height: 20px; background: var(--accent-gold); border-radius: 50%; position: relative; z-index: 2; border: 4px solid white;"></div>
                    <div style="flex: 1; padding-left: 50px;">
                        <h4 style="font-size: 1.5rem; color: var(--accent-gold); margin-bottom: 10px;">2024</h4>
                        <p style="color: #666; line-height: 1.7;">SCA 인증 로스터리 획득<br>50호점 돌파</p>
                    </div>
                </div>

                <!-- 2026 -->
                <div style="display: flex; align-items: center; position: relative;" data-aos="fade-right">
                    <div style="flex: 1; text-align: right; padding-right: 50px;">
                        <h4 style="font-size: 1.5rem; color: var(--accent-gold); margin-bottom: 10px;">2026</h4>
                        <p style="color: #666; line-height: 1.7;">프리미엄 드립백 론칭<br>글로벌 시장 진출</p>
                    </div>
                    <div style="width: 20px; height: 20px; background: var(--accent-gold); border-radius: 50%; position: relative; z-index: 2; border: 4px solid white;"></div>
                    <div style="flex: 1;"></div>
                </div>
            </div>
        </div>

        <!-- 브랜드 영상 섹션 -->
        <div style="margin: 80px 0;" data-aos="fade-up">
            <div style="max-width: 1000px; margin: 0 auto;">
                <div style="text-align: center; margin-bottom: 40px;">
                    <h3 style="font-size: 2rem; margin-bottom: 20px; color: var(--text-dark);">OUR STORY</h3>
                    <p style="color: #666;">여운 커피의 이야기를 영상으로 만나보세요</p>
                </div>
                <div style="position: relative; border-radius: 20px; overflow: hidden; box-shadow: 0 10px 40px rgba(0,0,0,0.15);">
                    <video controls style="width: 100%; display: block;">
                        <source src="../video/yemen_coffee.mp4" type="video/mp4">
                        브라우저가 video 태그를 지원하지 않습니다.
                    </video>
                </div>
            </div>
        </div>

        <!-- Only Yemen coffee Beans 섹션 -->
        <div style="background: #f8f5f0; padding: 80px 40px; border-radius: 20px; margin-top: 80px;" data-aos="fade-up">
            <div style="max-width: 1100px; margin: 0 auto;">
                <div style="text-align: center; margin-bottom: 60px;">
                    <h3 style="font-size: 2.5rem; margin-bottom: 15px; color: var(--accent-gold); font-family: 'Playfair Display', serif;">Only Yemen coffee Beans</h3>
                    <p style="color: #999;">커피 애호가(愛好家)의 커피가 저널 프로보의 고급 커놉 이론</p>
                </div>

                <div style="display: grid; grid-template-columns: 1fr auto 1fr; gap: 60px; align-items: start;">
                    <!-- 왼쪽 박스들 -->
                    <div style="display: flex; flex-direction: column; gap: 40px; padding-top: 60px;">
                        <!-- Pure Nature -->
                        <div style="background: white; padding: 25px; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.05);" data-aos="fade-right">
                            <h4 style="font-size: 1.2rem; color: var(--accent-gold); margin-bottom: 15px; font-weight: 700;">Pure Nature</h4>
                            <p style="font-size: 0.9rem; color: #666; line-height: 1.7;">
                                예멘 고산지대에서 자연 그대로 자란 원두만을 엄선합니다.
                                화학비료나 농약을 사용하지 않은 유기농 재배로
                                자연의 순수함을 그대로 담아냅니다.
                            </p>
                        </div>

                        <!-- Pure Source -->
                        <div style="background: white; padding: 25px; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.05);" data-aos="fade-right" data-aos-delay="100">
                            <h4 style="font-size: 1.2rem; color: var(--accent-gold); margin-bottom: 15px; font-weight: 700;">Pure Source</h4>
                            <p style="font-size: 0.9rem; color: #666; line-height: 1.7;">
                                예멘 현지 농가와의 직거래를 통해
                                신선하고 품질 좋은 원두를 확보합니다.
                                중간 유통 과정 없이 직수입하여 최상의 상태로 제공합니다.
                            </p>
                        </div>
                    </div>

                    <!-- 가운데 커피 이미지 -->
                    <div style="position: relative; min-width: 350px; max-width: 400px;" data-aos="zoom-in">
                        <img src="../img/원두.png"
                             alt="Coffee Bean"
                             style="width: 100%; height: auto; filter: drop-shadow(0 20px 40px rgba(0,0,0,0.2));">
                    </div>

                    <!-- 오른쪽 박스들 -->
                    <div style="display: flex; flex-direction: column; gap: 40px; padding-top: 60px;">
                        <!-- Direct Source -->
                        <div style="background: white; padding: 25px; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.05);" data-aos="fade-left">
                            <h4 style="font-size: 1.2rem; color: var(--accent-gold); margin-bottom: 15px; font-weight: 700;">Direct Source</h4>
                            <p style="font-size: 0.9rem; color: #666; line-height: 1.7;">
                                예멘 모카항에서 직접 들여온 프리미엄 원두로
                                진정한 모카커피의 깊은 맛과 향을 경험하실 수 있습니다.
                                전통적인 수확 방식을 고수하는 농가와 함께합니다.
                            </p>
                        </div>

                        <!-- Excellence -->
                        <div style="background: white; padding: 25px; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.05);" data-aos="fade-left" data-aos-delay="100">
                            <h4 style="font-size: 1.2rem; color: var(--accent-gold); margin-bottom: 15px; font-weight: 700;">Excellence</h4>
                            <p style="font-size: 0.9rem; color: #666; line-height: 1.7;">
                                숙련된 로스터의 손길로 원두 본연의 풍미를 살려냅니다.
                                각 원두의 특성에 맞는 최적의 로스팅으로
                                완벽한 한 잔을 완성합니다.
                            </p>
                        </div>
                    </div>
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
<script src="../js/script.js"></script>


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

