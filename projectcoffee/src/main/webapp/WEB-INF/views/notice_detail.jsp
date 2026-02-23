<%--
  Created by IntelliJ IDEA.
  User: khuser
  Date: 2026-02-23
  Time: 오후 3:08
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
    <title>${notice.title} | YEOWUN COFFEE</title>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Playfair+Display:wght@400;700&family=Cormorant+Garamond:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <link rel="stylesheet" href="/css/style.css">

    <style>
        /* 상세페이지 전용 추가 스타일 */
        .detail-container {
            max-width: 1000px;
            margin: 0 auto;
            background: #fff;
            padding: 60px 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }
        .detail-header {
            border-bottom: 1px solid #eee;
            padding-bottom: 30px;
            margin-bottom: 40px;
        }
        .detail-category {
            color: var(--accent-gold);
            font-weight: 700;
            letter-spacing: 1px;
            display: block;
            margin-bottom: 15px;
        }
        .detail-title {
            font-size: 2.5rem;
            font-family: 'Playfair Display', 'Noto Sans KR';
            color: #1a1a1a;
            line-height: 1.3;
            margin-bottom: 20px;
        }
        .detail-meta {
            display: flex;
            gap: 20px;
            color: #999;
            font-size: 0.95rem;
        }
        .detail-content {
            line-height: 2;
            font-size: 1.1rem;
            color: #444;
            min-height: 300px;
            word-break: break-all;
        }
        .detail-footer {
            margin-top: 60px;
            padding-top: 30px;
            border-top: 1px solid #eee;
            display: flex;
            justify-content: center;
        }
        .btn-back {
            padding: 15px 40px;
            background: var(--text-dark);
            color: #fff;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
        }
        .btn-back:hover {
            background: var(--accent-gold);
            transform: translateY(-3px);
        }
        @media (max-width: 768px) {
            .detail-container { padding: 40px 20px; }
            .detail-title { font-size: 1.8rem; }
        }
    </style>
</head>
<body>

<nav id="navbar">
    <div class="mobile-menu-btn" onclick="toggleSidebar()"><i class="fas fa-bars"></i></div>
    <ul class="nav-menu">
        <li class="nav-item"><a href="#">브랜드</a><div class="dropdown"><a href="/brand">여운 스토리</a></div></li>
        <li class="nav-item"><a href="#">메뉴</a><div class="dropdown"><a href="/menu">커피 (Coffee)</a><a href="/beverage">음료 (Beverage)</a><a href="./dessert">디저트 (Dessert)</a></div></li>
        <li class="nav-item"><a href="#">온라인 숍</a><div class="dropdown"><a href="/shop">원두/드립백</a><a href="/goods">홈카페 굿즈</a></div></li>
        <li class="nav-item"><a href="#">매장안내</a><div class="dropdown"><a href="/store">매장 찾기</a></div></li>
        <li class="nav-item"><a href="#">고객지원</a><div class="dropdown"><a href="/notice">공지사항</a><a href="/inquiry">1:1 문의</a></div></li>
    </ul>
    <a href="/" class="logo">YEOWUN<span>餘韻</span></a>
    <div class="nav-sns">
        <div class="sns-box" id="user-icon-btn" onclick="handleUserIcon()"><i class="fas fa-user"></i></div>
        <div class="sns-box"><i class="fab fa-instagram"></i></div>
        <div class="sns-box"><i class="fas fa-comment"></i></div>
        <div class="sns-box"><i class="fab fa-facebook-f"></i></div>
    </div>
</nav>

<header class="page-header" style="background-image: url('https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?w=1200'); height: 300px;">
    <div class="page-header-content">
        <h1 data-aos="fade-up">NOTICE</h1>
        <div class="breadcrumb" data-aos="fade-up" data-aos-delay="100">
            <a href="/">HOME</a> <i class="fas fa-chevron-right"></i>
            <a href="/notice">공지사항</a> <i class="fas fa-chevron-right"></i>
            <span>상세보기</span>
        </div>
    </div>
</header>

<section class="section" style="background: #fcfaf7;">
    <div class="container">
        <div class="detail-container" data-aos="fade-up">
            <div class="detail-header">
        <span class="detail-category">
          <c:if test="${notice.important eq 'Y'}"><i class="fas fa-star"></i> 중요공지</c:if>
          <c:if test="${notice.important ne 'Y'}">여운 소식</c:if>
        </span>
                <h2 class="detail-title">${notice.title}</h2>
                <div class="detail-meta">
                    <span><i class="far fa-calendar-alt"></i> ${notice.CDate}</span>
                    <span><i class="far fa-eye"></i> ${notice.viewCount} Views</span>
                </div>
            </div>

            <div class="detail-content">
                ${notice.cont}
            </div>

            <div class="detail-footer">
                <a href="/notice" class="btn-back"><i class="fas fa-list"></i> 목록으로</a>
            </div>
        </div>
    </div>
</section>

<footer class="main-footer">
    <div class="footer-bottom">
        <div class="company-details">
            (주)여운컴퍼니 | &copy; 2026 YEOWUN COFFEE. ALL RIGHTS RESERVED.
        </div>
    </div>
</footer>

<div id="floating-btns">
</div>

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="/js/script.js"></script>
<script>
    AOS.init({ duration: 1000, once: true });
</script>

</body>
</html>