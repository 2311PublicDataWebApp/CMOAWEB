<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>한국중앙박물관</title>
		<%@ include file="../inc/head.jsp" %>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	</head>
	<body>
		<header class="header">
		    <div class="container-fluid">
		        <div class="inner-header"><a class="inner-brand" href="/">CMoA</a></div>
		    </div>
		</header>
		<section class="module min-vh-100">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
						<div class="alert alert-danger">
						   <br><strong>에러 발생!</strong> 관리자에게 문의해주세요. <strong>에러 메세지</strong>는 다음과 같습니다.<br><br>
						   <strong>${msg  }</strong><br><br>
						</div>                    
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-8"></div>
                    <div class="col-md-4">
                    	<button class="btn btn-block btn-round btn-light" type="button" onclick="goBack();">이전으로</button>
                    	<button class="btn btn-block btn-round btn-light" type="button" onclick="location.href='http://127.0.0.1:9191/member/login.do'">로그인</button>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="../inc/footer.jsp"></jsp:include>
        <script type="text/javascript">
        	function goBack() {
        		window.history.go(-2);
        	}
        </script>
	</body>
</html>