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
                                <h1 class="page-title-heading text-gray">현재 전시</h1>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/">한국중앙박물관</a></li>
                                <li class="breadcrumb-item active">진행 중인 전시</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>
            <section class="module">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 m-auto">
                        	<c:forEach items="${eList }" var="exhibit">
                            	<article class="post">
                                 	<div class="post-preview"><a href="/exhibit/detail.do?exhibitNo=${exhibit.exhibitNo }"><img src="../resources/eTitleFiles/${exhibit.fileRename }" alt="" style="width: 100%; height: auto;"></a></div>
                                 	<div class="post-wrapper">
                                     	<div class="post-header">
                                         	<h2 class="post-title">
                                         		<a href="/exhibit/detail.do?exhibitNo=${exhibit.exhibitNo }">${exhibit.exhibitTitle }</a>
                                         	</h2>
                                         <ul class="post-meta">
                                             <li>${exhibit.startDate } ~ ${exhibit.endDate }</li>
                                         </ul>
                                     </div>
                                     <div class="post-content">
                                         <p>
                                             ${exhibit.exhibitDesc }
                                         </p>
                                         <br>
                                     </div>
                                    <div class="post-more">
                                    	<a href="/exhibit/detail.do?exhibitNo=${exhibit.exhibitNo }">더보기</a>
                                   	</div>
                                	</div>
                            	</article>
							</c:forEach>
                            <div class="row">
				            	<div class="col-md-12">
				                 	<nav>
				                    	<ul class="pagination justify-content-center">
				                         	<c:if test="${pi.startNavi ne '1' }">
				                         		<li class="page-item">
													<a class="page-link" href="/exhibit/list.do?page=${pi.startNavi - 1 }"><<</a>
												</li>
				                         	</c:if>
				                         	<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
												<li class="page-item">
													<a class="page-link" href="/exhibit/list.do?page=${p }">${p }</a>
												</li>
											</c:forEach>
											<c:if test="${pi.endNavi ne pi.naviTotalCount }">
					                    		<li class="page-item">
													<a class="page-link" href="/exhibit/list.do?page=${pi.endNavi + 1 }">>></a>
												</li>
				                         	</c:if>
				                         </ul>
				                     </nav>
				                 </div>
				             </div>
                        </div>
                    </div>
                </div>
            </section>
            <jsp:include page="../inc/footer.jsp"></jsp:include>
        </div>
    </body>
</html>