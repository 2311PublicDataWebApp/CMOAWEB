<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>전시 예매</title>
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
            <section class="module-page-title bg-gray">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <div class="page-title-desc">
                                <h1 class="page-title-heading text-gray">전시 예매</h1>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="./main.html">한국중앙박물관</a></li>
                                <li class="breadcrumb-item"><a href="#">특별전시</a></li>
                                <li class="breadcrumb-item active">전시 예매</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>
            <section class="module">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 m-auto">
                            <div class="heading-underline">
                                <h5 class="m-b-30">전시 예매</h5>
                            </div>
                            <form>
                                <div class="row form-row">
                                    <p class="col-md-12">예약자 성함을 입력해주세요</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-6 form-group">
                                        <input class="form-control" type="text" placeholder="성" required>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <input class="form-control" type="text" placeholder="이름" required>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">관람하실 전시를 선택해주세요</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <select class="form-control">
                                            <option selected="selected">어느 수집가의 초대 – 고故 이건희 회장 기증 1주년 기념</option>
                                            <option>합스부르크 600년, 매혹의 걸작들 - 빈미술사박물관 특별전</option>
                                            <option>진행 중인 전시명</option>
                                            <option>진행 중인 전시명</option>
                                            <option>진행 중인 전시명</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">관람 인원 수를 선택해주세요</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <select class="form-control">
                                            <option selected="selected">1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">관람 날짜를 지정해주세요</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="date" required>
                                    </div>
                                </div>
                            </div>
                    </div>
                    <div class="row m-t-70">
                        <div class="col-md-8 m-auto">
                            <div class="text-right"><button class="btn btn-block btn-round btn-brand" type="submit">예약하기</button></div>
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