<%--
  Created by IntelliJ IDEA.
  User: khuser
  Date: 26. 2. 12.
  Time: 오후 5:59
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav id="navbar">
    <div class="mobile-menu-btn" onclick="toggleSidebar()"><i class="fas fa-bars"></i></div>

    <ul class="nav-menu">
        <li class="nav-item"><a href="#">브랜드</a><div class="dropdown"><a href="${pageContext.request.contextPath}/brand">여운 스토리</a></div></li>
        <li class="nav-item"><a href="#">메뉴</a><div class="dropdown"><a href="${pageContext.request.contextPath}menu/menu">커피 (Coffee)</a><a href="${pageContext.request.contextPath}menu/beverage">음료 (Beverage)</a><a href="${pageContext.request.contextPath}menu/dessert">디저트 (Dessert)</a></div></li>
        <li class="nav-item"><a href="#">온라인 숍</a><div class="dropdown"><a href="${pageContext.request.contextPath}menu/shop">원두/드립백</a><a href="${pageContext.request.contextPath}menu/goods">홈카페 굿즈</a></div></li>
        <li class="nav-item"><a href="#">매장안내</a><div class="dropdown"><a href="${pageContext.request.contextPath}/store">매장 찾기</a></div></li>
        <li class="nav-item"><a href="#">고객지원</a><div class="dropdown"><a href="${pageContext.request.contextPath}notice/notice">공지사항</a><a href="${pageContext.request.contextPath}/contact">1:1 문의</a></div></li>
    </ul>

    <a href="/" class="logo">YEOWUN<span>餘韻</span></a>

    <div class="nav-sns">
        <div class="sns-box"><i class="fab fa-instagram"></i><span class="sns-tooltip">Instagram</span></div>
        <div class="sns-box"><i class="fas fa-comment"></i><span class="sns-tooltip">KakaoTalk</span></div>
        <div class="sns-box"><i class="fab fa-facebook-f"></i><span class="sns-tooltip">Facebook</span></div>
    </div>
</nav>

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
                <a href="${pageContext.request.contextPath}/menu">커피 (Coffee)</a>
                <a href="${pageContext.request.contextPath}/beverage">음료 (Beverage)</a>
                <a href="${pageContext.request.contextPath}/dessert">디저트 (Dessert)</a>
            </div>

            <div class="mobile-submenu">
                <a href="${pageContext.request.contextPath}/shop">원두/드립백</a>
                <a href="${pageContext.request.contextPath}/goods">홈카페 굿즈</a>
            </div>

            <div class="mobile-submenu">
                <a href="${pageContext.request.contextPath}/store">매장 찾기</a>
            </div>

            <div class="mobile-submenu">
                <a href="${pageContext.request.contextPath}/notice">공지사항</a>
                <a href="${pageContext.request.contextPath}/contact">1:1 문의</a>
            </div>
        </li>
    </ul>
</div>
