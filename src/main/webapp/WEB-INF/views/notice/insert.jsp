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
        <style type="text/css">
	        .ck-editor__editable[role="textbox"] {
				/* Editing area */
				min-height: 200px;
			}
			            
			.ck-content .image {
				/* Block images */
			    max-width: 80%;
				margin: 20px auto;
			}
        </style>
    </head>
    <body>
        <jsp:include page="../inc/header.jsp"></jsp:include>
        <div class="wrapper">
            <section class="module-page-title bg-gray">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <div class="page-title-desc">
                                <h1 class="page-title-heading text-gray">공지 등록</h1>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/">한국중앙박물관</a></li>
                                <li class="breadcrumb-item"><a href="#">관리자</a></li>
                                <li class="breadcrumb-item active">공지 등록</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </section>
            <section class="module">
                <div class="container">
                    <div class="row h-90">
                        <div class="col-md-12 m-auto">
                            <form action="/notice/insert.do" method="post">
                                <div class="row form-row">
                                    <p class="col-md-9">공지명</p><br>
                                    <p class="col-md-3">작성자</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-9 form-group">
                                        <input class="form-control" type="text" name="noticeTitle" required>
                                    </div>
                                    <div class="col-md-3 form-group">
                                        <input class="form-control" type="text" name="noticeWriter" value="관리자" readonly>
                                    </div>
                                </div>
                                <div class="row form-row">
                                    <p class="col-md-12">공지내용</p><br>
                                </div>
                                <div class="row form-row">
                                    <div class="col-md-12 form-group">
                                        <textarea id="editor" name="noticeContent"></textarea>
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
	       <script src="https://cdn.ckeditor.com/ckeditor5/41.2.1/super-build/ckeditor.js"></script>
	       <script type="text/javascript">
	       		CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
		            toolbar: {
		                items: [
		                    'bold', 'italic', 'strikethrough', 'underline', '|',
		                    'outdent', 'indent', 'insertTable', '|',
		                    'undo', 'redo',
		                    'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight'
		                ],
		                shouldNotGroupWhenFull: true
		            },
		            list: {
		                properties: {
		                    styles: true,
		                    startIndex: true,
		                    reversed: true
		                }
		            },
		            placeholder: '기본 폰트 크기는 13입니다.',
		            fontFamily: {
		                options: [
		                    'default',
		                    'Arial, Helvetica, sans-serif',
		                    'Courier New, Courier, monospace',
		                    'Georgia, serif',
		                    'Lucida Sans Unicode, Lucida Grande, sans-serif',
		                    'Tahoma, Geneva, sans-serif',
		                    'Times New Roman, Times, serif',
		                    'Trebuchet MS, Helvetica, sans-serif',
		                    'Verdana, Geneva, sans-serif'
		                ],
		                supportAllValues: true
		            },
		            fontSize: {
		                options: [ 10, 12, 'default', 14,  16 ],
		                supportAllValues: true
		            },
		            removePlugins: [
		                'AIAssistant',
		                'CKBox',
		                'CKFinder',
		                'EasyImage',
		                'RealTimeCollaborativeComments',
		                'RealTimeCollaborativeTrackChanges',
		                'RealTimeCollaborativeRevisionHistory',
		                'PresenceList',
		                'Comments',
		                'TrackChanges',
		                'TrackChangesData',
		                'RevisionHistory',
		                'Pagination',
		                'WProofreader',
		                'MathType',
		                'SlashCommand',
		                'Template',
		                'DocumentOutline',
		                'FormatPainter',
		                'TableOfContents',
		                'PasteFromOfficeEnhanced',
		                'CaseChange'
		            ]
	            });
	   </script>
    </body>
</html>