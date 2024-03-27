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
                                <h1 class="page-title-heading text-gray">전시 예매</h1>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/">한국중앙박물관</a></li>
                                <li class="breadcrumb-item"><a href="/exhibit/list.do">현재 전시</a></li>
                                <li class="breadcrumb-item active">전시 예매</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>
            <section class="module">
                <div class="container">
                    <div class="row">
                        <div class="col-md-10 m-auto">
                            <div class="card card-lg border mb-3">
                                <div class="card-body border-bottom">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h5 class="mb-4">예매가 성공적으로 완료되었습니다.</h5>
                                            <p>${booking.userName } 님의 예매 내역 입니다.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body border-bottom">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h6 class="mb-0">예매 번호</h6>
                                        </div>
                                        <div class="col-md-6 text-md-right">
                                            <h6 class="mb-0">${booking.bookingNo }</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body border-bottom">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h6 class="mb-0">예매자 성함</h6>
                                        </div>
                                        <div class="col-md-6 text-md-right">
                                            <h6 class="mb-0">${booking.bookingName }</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body border-bottom">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h6 class="mb-0">휴대폰 번호</h6>
                                        </div>
                                        <div class="col-md-6 text-md-right">
                                            <h6 class="mb-0">${booking.bookingPhone }</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body border-bottom">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h6 class="mb-0">이메일</h6>
                                        </div>
                                        <div class="col-md-6 text-md-right">
                                            <h6 class="mb-0">${booking.bookingEmail }</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body border-bottom">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h6 class="mb-0">예매 날짜</h6>
                                        </div>
                                        <div class="col-md-6 text-md-right">
                                            <h6 class="mb-0">${booking.bookingDate }</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body border-bottom">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h6 class="mb-3">전시명</h6>
                                        </div>
                                        <div class="col-md-6 text-md-right">
                                            <h6 class="mb-0">${booking.exhibitTitle }</h6>
                                            <p>진행 장소 : ${booking.exhibitPlace }</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body border-bottom">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h6 class="mb-0">인원수</h6>
                                        </div>
                                        <div class="col-md-6 text-md-right">
                                            <h6 class="mb-0">${booking.peopleNo } 명</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body bg-light">
                                    <div class="row align-items-center">
                                        <div class="col-md-12">
                                            <h6 class="mb-0">한국중앙박물관을 이용해주셔서 감사합니다.</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
			<jsp:include page="../inc/footer.jsp"></jsp:include>
        </div>
    </body>
</html>