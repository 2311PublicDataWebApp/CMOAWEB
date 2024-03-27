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
                        <div class="col-md-8 m-auto">
                            <div class="heading-underline">
                                <h5 class="">전시 예매</h5>
                            </div>
                            <form action="/booking/apply.do" method="POST">
                            	<input class="form-control" type="hidden" name="userId" value="${member.userId }" required>
                                <div class="row form-row">
                                    <p class="col-md-12">예약자 성함을 입력해주세요</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="text" name="bookingName" value="${member.userName }" required>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">관람하실 전시를 선택해주세요</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <select class="form-control" name="exhibitNo">
                                        	<option selected="selected">전시명</option>
                                        	<c:forEach items="${eList }" var="exhibit" varStatus="i">
                                        		<option value="${exhibit.exhibitNo }">${exhibit.exhibitTitle } :: ${exhibit.startDate } ~ ${exhibit.endDate }</option>
                                        	</c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">관람 인원 수를 선택해주세요</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <select class="form-control" name="peopleNo">
                                            <option value=1 selected="selected">1</option>
                                            <option value=2>2</option>
                                            <option value=3>3</option>
                                            <option value=4>4</option>
                                            <option value=5>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">관람 날짜를 지정해주세요</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="date" name="bookingDate" min="${exhibit.startDate }" max="${exhibit.endDate }" required>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">예약자 휴대폰 번호를 입력해주세요</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="text" name="bookingPhone" value="${member.userPhone }" required>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">예약자 이메일을 입력해주세요</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="email" name="bookingEmail" value="${member.userEmail }" required>
                                    </div>
                                </div>
                                <br>
			                    <div class="row form-row">
			                        <div class="col-md-12 form-group">
			                            <div class="text-right"><button class="btn btn-block btn-round btn-brand" type="submit">예약하기</button></div>
			                        </div>
			                    </div>
			           		</form>
                 		</div>
                    </div>
                </div>
            </section>
			<jsp:include page="../inc/footer.jsp"></jsp:include>
        </div>
    </body>
</html>