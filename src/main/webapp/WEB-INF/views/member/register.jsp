<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CMoA::회원가입</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link href="../resources/css/bootstrap.css" rel="stylesheet">
        <link href="../resources/css/plugins.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="page-loader">
            <div class="page-loader-inner">
                <div class="spinner">
                    <div class="spinner-grow text-teal"></div>
                </div>
            </div>
        </div>
        <jsp:include page="../inc/header.jsp"></jsp:include>
        <div class="wrapper">
            <section class="module-cover parallax text-center fullscreen" data-background="./images/img_intro_bg02.jpg" data-overlay="0.9">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 m-auto">
                            <div class="m-b-20">
                                <h6>회원가입</h6>
                            </div>
                            <div class="m-b-20">
                                <form method="post">
                                    <div class="form-group">
                                        <input class="form-control" type="text" placeholder="이름" required>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="email" placeholder="이메일" required>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="password" placeholder="비밀번호" required>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="text" placeholder="휴대폰 번호" required>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-block btn-round btn-brand" id="signup">회원가입</button>
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