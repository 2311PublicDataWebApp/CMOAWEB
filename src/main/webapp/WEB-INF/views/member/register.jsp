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
            <section class="module-cover parallax text-center fullscreen" data-background="../resources/img/img_intro_bg02.jpg" data-overlay="0.9">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 m-auto">
                            <div class="m-b-50">
                                <h6>회원가입</h6>
                            </div>
                            <div class="m-b-20">
                                <form action="/member/register.do" method="post">
                                    <div class="form-group">
                                        <input class="form-control" type="text" placeholder="아이디" name="userId" required>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="password" placeholder="비밀번호" name="userPw" required>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="text" placeholder="성함" name="userName" required>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="email" placeholder="이메일" name="userEmail" required>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="text" placeholder="휴대폰 번호" name="userPhone" required>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-block btn-round btn-brand" type="submit" id="signup">회원가입</button>
                                    </div>
                                </form>
                            </div>
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