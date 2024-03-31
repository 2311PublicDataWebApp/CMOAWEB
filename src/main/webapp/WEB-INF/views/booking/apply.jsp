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
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
                                        <select class="form-control" id="exhibitNo" name="exhibitNo" onchange="handlerDate();">
                                        	<option selected="selected">전시명</option>
                                        	<c:forEach items="${eList }" var="exhibit" varStatus="i">
                                        		<option value="${exhibit.exhibitNo }">${exhibit.exhibitTitle } :: ${exhibit.startDate } ~ ${exhibit.endDate }</option>
                                        	</c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">관람 날짜를 지정해주세요</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="date" name="bookingDate" id="bookingDate" onchange="handlerPeople();" required>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">관람 인원 수를 선택해주세요</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <select class="form-control" id="peopleNo" name="peopleNo" disabled>
<!--                                         	<option selected="selected" disabled>날짜를 먼저 선택해주세요</option> -->
                                        </select>
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
			<script type="text/javascript">
				function handlerDate() {
					var exhibitNo = $("#exhibitNo").val();
					$.ajax({
						url : "/booking/date/ajax.do",
						data : { "exhibitNo" : exhibitNo },
						type : "GET",
						success : function(data){
							let bookingDate = document.getElementById('bookingDate');
							let peopleNo = document.getElementById('peopleNo');
							console.log(data);
							document.getElementById('exhibitNo').options[0].disabled=true;
							bookingDate.setAttribute('min', data.startDate);
							bookingDate.setAttribute('max', data.endDate);
						}, 
						error : function() {
							alert("통신 실패!");
						}
					});
				}
				
				function handlerPeople() {
                    let peopleNo = document.getElementById('peopleNo');
                    let exhibitDate = document.getElementById('bookingDate');
                    var bookingDate = $("#bookingDate").val();
                    var exhibitNo = $("#exhibitNo").val();
/*                     if (exhibitDate != null) {
                        peopleNo.disabled=false;
                        peopleNo.options[0].innerHTML = "인원수를 선택해주세요";
                    } */
                    $.ajax({
						url : "/booking/pnum/ajax.do",
						data : { "exhibitNo" : exhibitNo
								, "bookingDate" : bookingDate },
						type : "GET",
						success : function(data){
							console.log(data);
							let left = data.exhibitPeople - data.totalCount;
							peopleNo.disabled=false;
							console.log(left);
							if (left > 5) {
								for(let i = 0; i < 5; i++) {
									optText = i + 1;
							        optValue = i + 1;
									peopleNo.append(new Option(optText, optValue)); 
								}
							} else {
								for(let i = 0; i < left; i++) {
									optText = i + 1;
							        optValue = i + 1;
									peopleNo.append(new Option(optText, optValue)); 
								}
							}
							console.log(peopleNo);
						},
						error : function() {
							alert("통신 실패!");
						}
                    });
				}
			</script>
        </div>
    </body>
</html>