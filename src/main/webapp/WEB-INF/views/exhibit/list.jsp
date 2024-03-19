<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>현재 전시</title>
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
                                <h1 class="page-title-heading text-gray">현재 전시</h1>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="./main.html">한국중앙박물관</a></li>
                                <li class="breadcrumb-item active">진행 중인 전시</li>
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
                                    <a class="nav-link active" data-toggle="tab" href="./list.html">
                                        <h6>진행 중인 전시</h6>
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane show active" id="tab-1-1">
                                    <section class="module">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-lg-8 m-auto">
                                                    <article class="post">
                                                        <div class="post-preview"><a href="./detail.html"><img src="./images/post1.jpeg" alt=""></a></div>
                                                        <div class="post-wrapper">
                                                            <div class="post-header">
                                                                <h2 class="post-title"><a href="./detail.html">어느 수집가의 초대 – 고故 이건희 회장 기증 1주년 기념전</a></h2>
                                                                <ul class="post-meta">
                                                                    <li>2023-11-01 ~ 2023-12-31</li>
                                                                </ul>
                                                            </div>
                                                            <div class="post-content">
                                                                <p>
                                                                    정선 <인왕제색도>(국보), <금동보살삼존상>(국보), 김환기 <산울림>, 클로드 모네 <수련>, 이중섭 <황소>, 박수근 <한일> 등 국립중앙박물관, 
                                                                    국립현대미술관 및 공립미술관 5개처 이건희 컬렉션 355점
                                                                </p>
                                                                <br>
                                                            </div>
                                                            <div class="post-more"><a href="detail.html">더보기</a></div>
                                                        </div>
                                                    </article>
                                                    <article class="post">
                                                        <div class="post-preview"><a href="#"><img src="./images/post2.gif" alt=""></a></div>
                                                        <div class="post-wrapper">
                                                            <div class="post-header">
                                                                <h2 class="post-title"><a href="#">합스부르크 600년, 매혹의 걸작들 - 빈미술사박물관 특별전</a></h2>
                                                                <ul class="post-meta">
                                                                    <li>2023-11-31 ~ 2023-12-15</li>
                                                                </ul>
                                                            </div>
                                                            <div class="post-content">
                                                                <p>
                                                                    디에고 벨라스케스 <흰 옷을 입은 마르가리타 테레사 공주>, 피터르 파울 루벤스 <주피터와 머큐리를 대접하는 필레몬과 바우키스>, 
                                                                    얀 브뤼헐 1세 <꽃다발을 꽂은 파란 꽃병> 등 빈미술사박물관 대표 소장품 96점 출품
                                                                </p>
                                                                <br>
                                                            </div>
                                                            <div class="post-more"><a href="#">더보기</a></div>
                                                        </div>
                                                    </article>
                                                    <article class="post">
                                                        <div class="post-preview"><a href="#"><img src="./images/post4.png" alt=""></a></div>
                                                        <div class="post-wrapper">
                                                            <div class="post-header">
                                                                <h2 class="post-title"><a href="#">전시명</a></h2>
                                                                <ul class="post-meta">
                                                                    <li>2023-11-31 ~ 2023-12-15</li>
                                                                </ul>
                                                            </div>
                                                            <div class="post-content">
                                                                <p>전시 설명란</p><br>
                                                            </div>
                                                            <div class="post-more"><a href="#">더보기</a></div>
                                                        </div>
                                                    </article>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <nav>
                                                                <ul class="pagination justify-content-center">
                                                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                                                                </ul>
                                                            </nav>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
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