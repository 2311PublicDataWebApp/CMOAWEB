<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>한국중앙박물관</title>
        <%@ include file="../inc/head.jsp" %>
    </head>
    <body>
        <jsp:include page="../inc/transparentHeader.jsp"></jsp:include>
        <div class="wrapper">
            <section class="module-cover parallax text-center fullscreen" data-background="../resources/img/img_intro_bg02.jpg" data-overlay="0.9">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 m-auto">
                            <div class="m-b-20">
                                <h6>한국중앙박물관에 오신걸 환영합니다</h6>
                            </div>
                            <div class="m-b-20">
                                <form action="/member/login.do" method="post">
                                    <div class="form-group">
                                        <input class="form-control" type="text" name="userId" placeholder="아이디를 입력해주세요" required>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="password" name="userPw"  placeholder="비밀번호를 입력해주세요" required>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-block btn-round btn-brand" type="submit">로그인</button>
                                    </div>
                                </form>
                            </div>
                            <div>
                                <p><small>
                                    아직 계정이 없으신가요? <a href="/member/register.do">회원가입</a><br>
                                    <a href="/member/findId.do">아이디</a> 또는 <a href="/member/findPw.do">비밀번호 찾기</a>
                                </small></p>
                            </div>
                            <div class="col-md-6">
                                <div class="space" data-MY="60px"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
			<jsp:include page="../inc/footer.jsp"></jsp:include>
        </div>
    </body>
</html>