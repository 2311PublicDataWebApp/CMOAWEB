<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-loader">
    <div class="page-loader-inner">
        <div class="spinner">
            <div class="spinner-grow text-teal"></div>
        </div>
    </div>
</div>
<header class="header header-transparent">
    <div class="container-fluid">
        <div class="inner-header"><a class="inner-brand" href="/">CMoA</a></div>
        <div class="inner-navigation collapse">
            <div class="inner-nav">
                <ul>
                    <li class="menu-category-items"><a href="#"><span class="menu-category-span">한국중앙박물관</span></a>
                        <ul class="sub-menu">
                            <li><a href="#">인사말</a></li>
                            <li><a href="#">오시는 길</a></li>
                        </ul>
                    </li>
                    <li class="menu-category-items"><a href="#"><span class="menu-category-span">현재 전시</span></a>
                        <ul class="sub-menu">
                            <li><a href="/exhibit/reservation.do">전시 예매</a></li>
                            <li><a href="/exhibit/list.do">전시 목록</a></li>
                        </ul>
                    </li>
                    <li class="menu-category-items"><a href="#"><span class="menu-category-span">공지사항</span></a>
                        <ul class="sub-menu">
                            <li><a href="/notice/list.do">알림마당</a></li>
                        </ul>
                    </li>
                    <c:if test="${userId eq null }">
	                    <li class="menu-category-items"><a href="#"><span class="menu-category-span">로그인</span></a>
	                        <ul class="sub-menu">
	                            <li><a href="/member/login.do">로그인</a></li>
	                            <li><a href="/member/register.do">회원가입</a></li>
	                            <li><a href="/member/findId.do">아이디 찾기</a></li>
	                            <li><a href="/member/findPw.do">비밀번호 찾기</a></li>
	                        </ul>
	                    </li>
                    </c:if>
                    <c:if test="${userId ne null }">
                        <c:if test="${userId ne 'admin' }">
		                    <li class="menu-category-items"><a href="#"><span class="menu-category-span">마이페이지</span></a>
		                        <ul class="sub-menu">
		                            <li><a href="/member/mypage.do">나의정보</a></li>
		                            <li><a href="/member/myreservation.do">예매내역</a></li>
		                            <li><a href="/member/logout.do">로그아웃</a></li>
		                        </ul>
		                    </li>
                        </c:if>
                        <c:if test="${userId eq 'admin' }">
		                    <li class="menu-category-items"><a href="#"><span class="menu-category-span">관리자</span></a>
		                        <ul class="sub-menu">
		                            <li><a href="/member/logout.do">로그아웃</a></li>
		                        </ul>
		                    </li>
                        </c:if>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</header>