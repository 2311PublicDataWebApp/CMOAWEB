<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
        <title>한국중앙박물관</title>
        <%@ include file="./inc/head.jsp" %>
    </head>
    <body>
        <jsp:include page="./inc/transparentHeader.jsp"></jsp:include>
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
                                        <a class="btn btn-lg btn-circle btn-new-white" href="/exhibit/detail.do?exhibitNo=1">전시 정보</a>
                                        <a class="btn btn-lg btn-circle btn-outline-new-white" href="/booking/apply.do">예약하기</a></p>
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
                                        <a class="btn btn-lg btn-circle btn-light" href="/exhibit/detail.do?exhibitNo=4">전시 정보</a>
                                        <a class="btn btn-lg btn-circle btn-outline-new-white" href="/booking/apply.do">예약하기</a>
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
                                        <a class="btn btn-lg btn-circle btn-new-white" href="/exhibit/detail.do?exhibitNo=5">전시 정보</a>
                                        <a class="btn btn-lg btn-circle btn-outline-new-white" href="/booking/apply.do">예약하기</a>
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
                     </div>
                     <div class="row">
                        <div class="col-md-6 m-auto">
                            <p class="lead">
                            <strong> 관람시간 </strong><br> 월/화/목/금/일 10:00 ~ 18:00  수/토 10:00 ~ 20:00 
                            <br>* 입장 마감은 폐관 30분 전까지 <br><br>
                            <strong> 문의전화 </strong><br> 02 - 1234 - 5678
                            </p>
                        </div>
                        <div class="col-md-5 m-auto">
                            <p class="lead"><strong>공지사항</strong></p>
	                        <c:forEach items="${nList }" begin="0" end="2" var="notice" varStatus="loop">
							    <p><a href="/notice/detail?noticeNo=${notice.noticeNo}">${notice.noticeTitle}</a></p>
							    <c:if test="${loop.index != 2}">
							        <hr />
							    </c:if>
		                    </c:forEach>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="space" data-MY="100px"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <p><img src="../resources/img/img_intro_bg03.jpg" alt=""></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="space" data-MY="30px"></div>
                        </div>
                    </div>
                </div>
            </section>
			<jsp:include page="./inc/footer.jsp"></jsp:include>
        </div>
    </body>
</html>