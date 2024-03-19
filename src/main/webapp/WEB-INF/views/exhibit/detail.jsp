<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>전시 상세</title>
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
            <section class="module-cover parallax text-center" data-background="./images/singlemain1.jpeg" data-overlay="0.2">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>어느 수집가의 초대 <br>– 고故 이건희 회장 기증 1주년 기념전</h2>
                        </div>
                    </div>
                </div>
            </section>
            <section class="module">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <img class="" src="./images/singlephoto1.jpeg" alt="">
                        </div>
                        <div class="col-md-4">
                            <div class="sticky-sidebar">
                                <h6 class="single-portion-title">어느 수집가의 초대 <br> – 고故 이건희 회장 기증 1주년 기념전</h6>
                                <p>
                                    어느 수집가가 여러분을 집으로 초대합니다. 선사시대부터 현대에 이르는 수많은 수집품이 수집가의 집에 가득 차 있습니다. 
                                    수집품에는 상상력을 펼치며 끊임없이 경를 넘어온 인류의 궤적과 지혜가 잘 보존되어 있습니다. 그 수집가는 자신의 수집품 속 인류의 이야기를 함께 나누고 싶어 여러분을 초대합니다. 
                                    수집품에는 어떠한 이야기들이 담겨 있을까요?
                                </p>
                                <p>
                                    전시품: 정선 <인왕제색도>(국보), <금동보살삼존상>(국보), 김환기 <산울림>, 클로드 모네 <수련>, 이중섭 <황소>, 박수근 <한일> 등 국립중앙박물관, 
                                    국립현대미술관 및 공립미술관 5개처 이건희 컬렉션 355점
                                </p>
                                <hr class="m-t-30 m-b-30">
                                <div class="info-list">
                                    <li><span class="info-list-title">전시기간:</span><span>2023-12-01 ~ 2023-12-31</span></li>
                                    <li><span class="info-list-title">전시장소:</span><span>기획전시실</span></li>
                                    <li><span class="info-list-title">담당부서:</span><span>미술부</span></li>
                                </div>
                                <hr class="m-t-30 m-b-30">
                                <div class="form-group">
                                    <button class="btn btn-block btn-round btn-brand" type="button">
                                        <a href="./reservation.html" style="color: #fff;">예약하기</a>
                                    </button>
                                </div>
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