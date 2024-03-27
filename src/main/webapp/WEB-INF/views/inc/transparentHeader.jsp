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
					<c:if test="${userId ne 'admin' }">
	                    <li class="menu-category-items"><a href="#"><span class="menu-category-span">전시예매</span></a>
	                        <ul class="sub-menu">
	                            <li><a href="/booking/apply.do">전시 예매</a></li>
	                        </ul>
	                    </li>
	                    <li class="menu-category-items"><a href="#"><span class="menu-category-span">전시목록</span></a>
	                        <ul class="sub-menu">
	                            <li><a href="/exhibit/list.do">전시 목록</a></li>
	                        </ul>
	                    </li>
	                    <li class="menu-category-items"><a href="#"><span class="menu-category-span">공지사항</span></a>
	                        <ul class="sub-menu">
	                            <li><a href="/notice/list.do">알림마당</a></li>
	                        </ul>
	                    </li>
	                </c:if>
	                <c:if test="${userId eq 'admin' }">
	                	<li class="menu-category-items"><a href="#"><span class="menu-category-span">전시관리</span></a>
	                        <ul class="sub-menu">
	                            <li><a href="/exhibit/list.do">전시 목록</a></li>
	                            <li><a href="/exhibit/insert.do">전시 등록</a></li>
	                        </ul>
	                    </li>
	                    <li class="menu-category-items"><a href="#"><span class="menu-category-span">공지관리</span></a>
	                        <ul class="sub-menu">
	                            <li><a href="/notice/list.do">공지 목록</a></li>
	                            <li><a href="/notice/insert.do">공지 등록</a></li>
	                        </ul>
	                    </li>
	                </c:if>
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
		                           <li><a href="/member/myPage.do">나의정보</a></li>
		                            <li><a href="/member/myBooking.do">예매내역</a></li>
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