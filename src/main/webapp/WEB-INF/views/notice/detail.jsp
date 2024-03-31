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
                        <div class="col-md-10 m-auto p-5 bg-white">
	                        <article class="post">
	                            <div class="post-wrapper">
	                                <div class="post-header">
	                                    <h1 class="post-title">${notice.noticeTitle }</h1>
	                                    <hr>
	                                    <ul class="post-meta">
	                                        <li>${notice.noticeDate }</li>
	                                        <li>${notice.noticeWriter }</li>
	                                        <li>${notice.updateDate }</li>
	                                    </ul>
	                                    <hr>
	                                </div>
	                                <div class="post-content pt-3 pb-4">
	                                    <p>${notice.noticeContent }</p>
	                                </div>
	                                <hr>
	                                <div class="row mt-4">
		                                <div class="col-9"></div>
		                                <div class="col-3">
				                        	<button class="btn btn-block btn-round btn-light" type="button" onclick="location.href='http://127.0.0.1:9191/notice/list.do'">목록으로</button>
		                                </div>
	                                </div>
	                            </div>
	                        </article>
                        </div>
                    </div>
                </div>
            </section>
            <jsp:include page="../inc/footer.jsp"></jsp:include>
        </div>
	</body>
</html>