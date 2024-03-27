<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>한국중앙박물관</title>
        <%@ include file="../inc/head.jsp" %>
    </head>
    <body>
        <jsp:include page="../inc/header.jsp"></jsp:include>
        <div class="wrapper">
            <section class="module-page-title bg-gray">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <div class="page-title-desc">
                                <h1 class="page-title-heading text-gray">마이페이지</h1>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/">한국중앙박물관</a></li>
                                <li class="breadcrumb-item"><a href="#">마이페이지</a></li>
                                <li class="breadcrumb-item active">나의 정보</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>
            <section class="module">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <ul class="nav-sidebar sticky-sidebar">
                            	<hr>
                                <li><a href="/member/myPage.do">나의 정보</a></li>
                            	<hr>
                            	<li><a href="/member/myBooking.do">예매 내역</a></li>
                            	<hr>
							</ul>
                        </div>
                        <div class="col-md-9 m-auto">
                            <form>
                                <div class="row form-row">
                                    <p class="col-md-12">아이디</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="text" name="userId" value="${member.userId }" readonly>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">비밀번호</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="password" name="userPw" value="${member.userPw }" readonly>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">이름</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="text" name="userName" value="${member.userName }" readonly>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">이메일</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="email" name="userEmail" value="${member.userEmail }" readonly>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">휴대폰 번호</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="text" name="userPhone" value="${member.userPhone }" readonly>
                                    </div>
                                </div>
                                <br>
			           		</form>
			           		<div>
                                <p><small>
                                    <a href="/member/update.do">내 정보 수정</a><br>
                                    <a href="/member/delete.do?userId=${member.userId }">회원 탈퇴</a>
                                </small></p>
                            </div>
                 		</div>
                    </div>
                </div>
            </section>
			<jsp:include page="../inc/footer.jsp"></jsp:include>
        </div>
    </body>
</html>