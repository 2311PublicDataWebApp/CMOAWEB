<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>한국중앙박물관</title>
        <%@ include file="../inc/head.jsp" %>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <jsp:include page="../inc/header.jsp"></jsp:include>
        <div class="wrapper">
            <section class="module-page-title bg-gray">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <div class="page-title-desc">
                                <h1 class="page-title-heading text-gray">전시 등록</h1>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/">한국중앙박물관</a></li>
                                <li class="breadcrumb-item"><a href="#">관리자</a></li>
                                <li class="breadcrumb-item active">전시 등록</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>
            <section class="module">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 m-auto">
                            <form action="/exhibit/insert.do" method="post" enctype="multipart/form-data">
                                <div class="row form-row">
                                    <p class="col-md-12">전시명</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <input class="form-control" type="text" name="exhibitTitle" required>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-6">전시장소</p><br>
                                    <p class="col-md-6">부서명</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-6 form-group">
                                        <input class="form-control" type="text" name="exhibitPlace" required>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <select class="form-control" name="deptCode" required>
                                            <option value="미술부" selected="selected">미술부</option>
                                            <option value="전시부">전시부</option>
                                            <option value="세계문화부">세계문화부</option>
                                            <option value="고고역사부">고고역사부</option>
                                            <option value="유물관리부">유물관리부</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-4">시작 날짜</p><br>
                                    <p class="col-md-4">종료 날짜</p><br>
                                    <p class="col-md-4">정원수</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-4 form-group">
                                        <input class="form-control" type="date" name="startDate" required>
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <input class="form-control" type="date" name="endDate" required>
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <select class="form-control" name="exhibitPeople" required>
                                        	<option selected>정원수를 골라주세요</option>
                                            <option value="0">해당없음</option>
                                            <option value="15">15 명</option>
                                            <option value="20">20 명</option>
                                            <option value="25">25 명</option>
                                            <option value="30">30 명</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">전시소개</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <textarea rows="3" class="form-control" name="exhibitDesc" required></textarea>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">전시설명</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <textarea rows="5" class="form-control" name="exhibitIntro" required></textarea>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">대표이미지</p><br>
                                </div>
                                <div class="row form-row">
                                	<div class="col-md-12">
                         				<input type="file" class="form-control" name="titleFile" id="titleFile">
                                	</div>
                                </div>
                                <br>
                                <div class="row form-row">
                                	<div class="col-md-3">
                                		<button class="btn btn-block btn-round btn-light" type="button" onclick="addImg();">첨부파일 추가</button>
                                	</div>
                                </div>
                                <br>
                                <div class="row form-row">
                                	<div class="col-md-12" id="uploadFile">
                         				<!-- .uploadFile input tag 추가 부분 -->
                                	</div>
                                </div>
                                <br><br>
                                <div class="row form-row">
			                        <div class="col-md-12 form-group">
			                            <div class="text-right"><button class="btn btn-block btn-round btn-brand" type="submit">등록하기</button></div>
			                        </div>
			                    </div>
			           		</form>
                 		</div>
                    </div>
                </div>
            </section>
			<jsp:include page="../inc/footer.jsp"></jsp:include>
        </div>
        <script type="text/javascript">
	        function addImg() {
	        	let uploadFileInput = document.getElementById('uploadFile');
			    let addInput = document.createElement('input');
			    addInput.setAttribute('type', 'file');
			    addInput.setAttribute('name', 'uploadFile');
			    addInput.setAttribute('multiple', '');
			    uploadFileInput.appendChild(addInput);
			}
        </script>
    </body>
</html>