<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
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
                                <h1 class="page-title-heading text-gray">알림마당</h1>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/">한국중앙박물관</a></li>
                                <li class="breadcrumb-item"><a href="/notice/list.do">공지사항</a></li>
                                <li class="breadcrumb-item active"><a href="/notice/list.do">알림마당</a></li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>
            <section class="module">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#">
                                        <h6>박물관 소식</h6>
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane show active" id="tab-1-1">
                       				<c:forEach items="${nList }" var="notice" varStatus="i">
                       					<p>
                       						<strong>${notice.noticeDate }</strong>
                       					</p>
                       					<p>
                       						<a href="/notice/detail.do?noticeNo=${notice.noticeNo}">${notice.noticeTitle }</a>
										</p>
                                		<hr>
									</c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <nav>
                                <ul class="pagination justify-content-center">
                                	<c:if test="${pi.startNavi ne '1' }">
                                		<li class="page-item">
											<a class="page-link" href="/notice/list.do?page=${pi.startNavi - 1 }"><<</a>
										</li>
                                	</c:if>
                                	<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
										<li class="page-item">
											<a class="page-link" href="/notice/list.do?page=${p }">${p }</a>
										</li>
									</c:forEach>
									<c:if test="${pi.endNavi ne pi.naviTotalCount }">
                                		<li class="page-item">
											<a class="page-link" href="/notice/list.do?page=${pi.endNavi + 1 }">>></a>
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