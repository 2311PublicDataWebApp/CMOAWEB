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
                                <li class="breadcrumb-item active">예매내역</li>
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
                            <div class="tab-content">
                                <div class="tab-pane show active" id="tab-1-1">
                       				<c:forEach items="${bList }" var="booking" varStatus="i">
                       					<p>
                       						<strong>예매번호 ${booking.bookingNo }</strong>
                       					</p>
                       					<p>
                       						<a href="/exhibit/detail.do?exhibitNo=${booking.exhibitNo }">${booking.exhibitTitle }</a>
										</p>
										<p>예매자 : ${booking.bookingName }</p>
										<p>인원수 : ${booking.peopleNo }</p>
										<p>예매 날짜 : ${booking.bookingDate }</p>
										<p>진행 장소 : ${booking.exhibitPlace }</p>
                                		<hr>
									</c:forEach>
                                </div>
                            </div>
                            <nav>
		                    	<ul class="pagination justify-content-center">
		                         	<c:if test="${pi.startNavi ne '1' }">
		                         		<li class="page-item">
											<a class="page-link" href="/member/myBooking.do?page=${pi.startNavi - 1 }"><<</a>
										</li>
		                         	</c:if>
		                         	<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
										<li class="page-item">
											<a class="page-link" href="/member/myBooking.do?page=${p }">${p }</a>
										</li>
									</c:forEach>
									<c:if test="${pi.endNavi ne pi.naviTotalCount }">
			                    		<li class="page-item">
											<a class="page-link" href="/member/myBooking.do?page=${pi.endNavi + 1 }">>></a>
										</li>
		                         	</c:if>
		                         </ul>
		                     </nav>
                 		</div>
                    </div>
                </div>
            </section>
			<jsp:include page="../inc/footer.jsp"></jsp:include>
        </div>
    </body>
</html>