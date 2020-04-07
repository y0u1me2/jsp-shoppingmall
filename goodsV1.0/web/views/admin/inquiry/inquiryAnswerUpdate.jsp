<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="java.util.List,com.web.admin.inquiry.model.vo.InquiryAnswer"%>

<%
	InquiryAnswer ia = (InquiryAnswer)request.getAttribute("inquiryAnswer");
%>

<style>
div.content-wrapper {
	background-color: white;
	position: relative;
	left: 100px;
}

div.goodsback {
	width: 80%;
	height: auto;
	position: relative;
	top: 100px;
	margin-bottom:150px;
}

* {
	margin: 0;
}

body {
	width: 1366px;
	height: auto;
}

/* 1:1문의 텍스트 */
h1#title {
	font-weight: bolder;
	font-size: 30px;
	position: relative;
	top: 10px;
	;
}

/*제목 밑에 라인 */
hr#line1 {
	border: 1px solid rgb(177, 174, 174);
	position: relative;
	top: 20px;
	width: 100%;
}

h1#title2 {
	width: 100%;
	text-align: left;
	color: rgb(97, 96, 96);
	font-size: 15px;
}


/* 테이블 스타일 */
table.box {
	border-top: 1px solid #adadad;
	border-bottom: 1px solid #adadad;
	border-collapse: collapse;
	width: 80%;
	height: 200px;
}


/* 테이블 선 색상 */
talbe.box>tr, td, th {
	border: 1px solid #e2e0e0;
}

table.box th {
	text-align: center;
	width: 140px;
}

/* 내용박스 스타일 */
#content {
	width: 100%;
	height: 300px;
	border: none;
}

a span {
	text-decoration: none;
	color: rgb(95, 93, 93);
}
/* 수정하기버튼 */
input#update-btn {
	height: 35px;
	width: 100px;
	border: solid 1px rgb(147, 147, 194);
	background: white;
	border-radius: 5px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-right: 5px;
	position: relative;
	top:30px;
	left:300px;
}

input#update-btn:hover {
	background: rgb(251, 251, 249);
	outline: none;
}
</style>

<%@ include file="/views/admin/common/header.jsp"%>



<div class="content-wrapper">

	<br>
	<br>
	<div class="goodsback">
		<h1 id="title">답변 수정</h1>
		<hr id="line1">
		<br> <br>
		<div id="detailBack">

			<div>
				<h1 id="title2">관리자님이 답변하신 내용을 수정해주세요.</h1>
			</div>

			<form action="<%=request.getContextPath() %>/admin/InquiryAdminAnswerUpdateEnd"
				method="post" enctype="multipart/form-data">
			<br> <input type="hidden" name="ino" value="<%=ia.getI_No() %>" />

				<div id="answer-content">
					<table class="box">
						<tr>
							<th style="height: 40px">제목수정</th>
							<td><input type="text" name="title"
								style="width: 300px; border: none;"
								value="<%=ia.getIa_Title()%>"></td>
						</tr>

						<tr>
							<th>내용수정</th>
							<td><textarea id="content" name="content"
									value="<%=ia.getIa_Content() %>"></textarea></td>
						</tr>
						<tr>
							<th>첨부파일 수정</th>
							<td style="height:100px;">
								<%if(ia.getIa_Original_Filename()!=null){ %> 
								</br>
								<input type="file" name="upfile" /> 
								<div style="display:flex;">
								<p>이전 첨부파일&nbsp&nbsp<%=ia.getIa_Original_Filename()%></p></div>
								<%} %>
							</td>
						</tr>
			
				</table>
						<input type="submit" id="update-btn" value="수정하기">
				</div>
			</form>
		</div>
	</div>


</div>



<%@ include file="/views/admin/common/footer.jsp"%>