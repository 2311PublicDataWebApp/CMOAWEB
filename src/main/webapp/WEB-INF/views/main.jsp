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
                	<c:forEach items="${eList }" begin="0" end="2" var="exhibit">
                		<li class="parallax text-center" data-overlay="0.7"><img src="../resources/eTitleFiles/${exhibit.fileRename }" alt="">
	                        <div class="container">
	                            <div class="row">
	                                <div class="col-md-12">
	                                    <h1 class="m-b-40"><strong>${exhibit.exhibitTitle }</strong></h1>
	                                    <p>
	                                        <a class="btn btn-lg btn-circle btn-new-white" href="/exhibit/detail.do?exhibitNo=${exhibit.exhibitNo }">전시 정보</a>
	                                        <c:if test="${exhibit.exhibitPeople ne 0 }">
		                                        <a class="btn btn-lg btn-circle btn-outline-new-white" href="/booking/apply.do">예약하기</a>
	                                        </c:if>
                                        </p>
	                                </div>
	                            </div>
	                        </div>
	                    </li>
                    </c:forEach>
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
							    <p><a href="/notice/detail.do?noticeNo=${notice.noticeNo}">${notice.noticeTitle}</a></p>
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
                            <div class="space" data-MY="60px"></div>
                        </div>
                    </div>
                </div>
            </section>
			<jsp:include page="./inc/footer.jsp"></jsp:include>
        </div>
    </body>
</html>