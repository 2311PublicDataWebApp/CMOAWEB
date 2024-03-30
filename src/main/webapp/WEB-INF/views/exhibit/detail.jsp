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
            <section class="module-cover parallax text-center" data-background="../resources/eTitleFiles/${exhibit.fileRename }" data-overlay="0.2">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>${exhibit.exhibitTitle }</h2>
                        </div>
                    </div>
                </div>
            </section>
            <section class="module">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                        	<c:forEach items="${iList }" var="iList">
	                            <img class="mb-4" src="../resources/euploadFiles/${iList.exhFileRename }" alt=""
	                            	style="width: 90%; height: 500px;">
                        	</c:forEach>
                        </div>
                        <div class="col-md-4">
                            <div class="sticky-sidebar">
                            	<br>
                                <h6 class="single-portion-title">${exhibit.exhibitTitle }</h6>
                                <br>
                                <p>
                                    ${exhibit.exhibitIntro }
                                </p>
                                <br>
                                <p>
                                    ${exhibit.exhibitDesc }
                                </p>
                                <hr class="mt-4 mb-4">
                                <div class="info-list">
                                    <li><span class="info-list-title">전시기간:</span><span>${exhibit.startDate } ~ ${exhibit.endDate }</span></li>
                                    <li><span class="info-list-title">전시장소:</span><span>${exhibit.exhibitPlace }</span></li>
                                    <li><span class="info-list-title">담당부서:</span><span>${exhibit.deptCode }</span></li>
                                </div>
                                <hr class="mt-4 mb-4">
                                <div class="form-group">
                                	<br>
                                    <button class="btn btn-block btn-round btn-brand" type="button">
                                        <a href="/booking/apply.do" style="color: #fff;">예약하기</a>
                                    </button>
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