<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>한국중앙박물관</title>
        <%@ include file="./inc/mainHead.jsp" %>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link href="../resources/css/bootstrap.css" rel="stylesheet">
        <link href="../resources/css/plugins.min.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="./inc/header.jsp"></jsp:include>
        <div class="wrapper">
            <section class="module-cover-slides fullscreen">
                <ul class="slides-container">
                    <li class="parallax text-center" data-overlay="0.1"><img src="../resources/img/mainexhibit1.png" alt="main1">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <h1 class="m-b-20"><strong>인왕제색도 (仁王霽色圖)</strong></h1>
                                    <p class="m-b-40">어느 수집가의 초대 - 고故 이건희 회장 기증 1주년 기념전</p>
                                    <p>
                                        <a class="btn btn-lg btn-circle btn-new-white" href="./detail.html">전시 정보</a>
                                        <a class="btn btn-lg btn-circle btn-outline-new-white" href="./reservation.html">예약하기</a></p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="parallax" data-overlay="0.6"><img src="../resources/img/mainexhibit2.jpg" alt="main2">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <h1 class="m-b-20"><strong>사유의 방<br>(A Room of Quiet Contemplation)</strong></h1>
                                    <p class="m-b-40">새로운 전시 공간에서 국보 반가사유상과 함께하는 사유의 여정이 시작됩니다</p>
                                    <p>
                                        <a class="btn btn-lg btn-circle btn-light" href="#">전시 정보</a>
                                        <a class="btn btn-lg btn-circle btn-outline-new-white" href="#">예약하기</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="parallax text-center" data-overlay="0.5"><img src="../resources/img/mainexhibit3.jpeg" alt="main3">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <h1 class="m-b-20"><strong>근대 문예인, <br>위창 오세창 葦滄 吳世昌</strong></h1>
                                    <p class="m-b-40">Oh Sechang, A Modern Caligrapher and Connoisseur</p>
                                    <p>
                                        <a class="btn btn-lg btn-circle btn-new-white" href="#">전시 정보</a>
                                        <a class="btn btn-lg btn-circle btn-outline-new-white" href="#">예약하기</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="slides-navigation">
                    <a class="prev" href="#">
                        <span><</span>
                    </a>
                    <a class="next" href="#">
                        <span>></span>
                    </a>
                </div>
            </section>
            <section class="module divider-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 m-auto">
                            <h1>한국중앙박물관에 오신 것을 환영합니다</h1><br>
                        </div>
                        <div class="col-md-6 m-auto">
                            <p class="lead">
                            <strong> 관람시간 </strong><br> 월/화/목/금/일 10:00 ~ 18:00  수/토 10:00 ~ 20:00 
                            <br>* 입장 마감은 폐관 30분 전까지 <br><br>
                            <strong> 문의전화 </strong><br> 02 - 1234 - 5678
                            </p>
                        </div>
                        <div class="col-md-5 m-auto">
                            <p class="lead"><strong>공지사항</strong></p>
                            <p><a href="#">박물관 엘리베이터 일시 운행 중단 알림</a></p>
                            <hr>
                            <p><a href="#">기증관 일부 전시실(205~208호) 휴실 기간 연장 안내(~'24.1.11)</a></p>
                            <hr>
                            <p><a href="#">분실물 정보 안내</a></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="space" data-MY="60px"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <p><img src="../resources/img/img_intro_bg03.jpg" alt=""></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="space" data-mY="30px"></div>
                        </div>
                    </div>
                </div>
            </section>
			<jsp:include page="./inc/footer.jsp"></jsp:include>
        </div>
    </body>
</html>