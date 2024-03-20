<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>한국중앙박물관</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link href="../resources/css/bootstrap.css" rel="stylesheet">
        <link href="../resources/css/plugins.min.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="../inc/header.jsp"></jsp:include>
        <div class="wrapper">
            <section class="module-page-title bg-gray">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <div class="page-title-desc">
                                <h1 class="page-title-heading text-gray">내 정보 수정</h1>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/">한국중앙박물관</a></li>
                                <li class="breadcrumb-item"><a href="#">마이페이지</a></li>
                                <li class="breadcrumb-item active">나의 정보</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>
            <section class="module">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="sticky-sidebar">
							</div>
                        </div>
                        <div class="col-md-9 m-auto">
                            <!-- <div class="heading-underline">
                                <h5 class="">전시 예매</h5>
                            </div> -->
                            <form action="/member/update.do" method="post">
                                <div class="row form-row">
                                    <p class="col-md-12">아이디</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="text" name="userId" value="${member.userId }" readonly>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">비밀번호</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="password" name="userPw" value="${member.userPw }">
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">이름</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="text" name="userName" value="${member.userName }" readonly>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">이메일</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="email" name="userEmail" value="${member.userEmail }">
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">휴대폰 번호</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="text" name="userPhone" value="${member.userPhone }">
                                    </div>
                                </div>
                                <br>
                                <div class="row form-row">
			                        <div class="col-md-12 form-group">
			                            <div class="text-right"><button class="btn btn-block btn-round btn-brand" type="submit">수정하기</button></div>
			                        </div>
			                    </div>
			           		</form>
                 		</div>
                    </div>
                </div>
            </section>
			<jsp:include page="../inc/footer.jsp"></jsp:include>
        </div>
        <!-- scripts -->
        <script src="../resources/js/jquery.min.js"></script>
        <script src="../resources/js/bootstrap.min.js"></script>
        <script src="../resources/js/plugins.min.js"></script>
        <script src="../resources/js/bootstrap.bundle.js"></script>
    </body>
</html>