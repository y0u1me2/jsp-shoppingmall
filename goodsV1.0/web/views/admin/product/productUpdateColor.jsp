<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.web.product.model.vo.Product" %>

<%
Product p = (Product)request.getAttribute("product");
%>

<%@ include file="/views/admin/common/header.jsp"%>
<style>
div.content-wrapper {
	background-color: white;
	position: relative;
	left: 100px;
}

div.goodsback {
	height: auto;
	position: relative;
	top: 100px;
}

* {
	margin: 0;
}

body {
	width: 1366px;
	height: auto;
}

/* 섹션안 공간  */
div.back {
	position: relative;
}

/* 밑에 라인 */
#gline {
	border: 1px solid rgb(177, 174, 174);
	position: relative;
	top: 20px;
	width: 80%;
}

.goodsback {
	width: 100%;
}

/* box 스타일 */
.box {
	border-top: 1px solid #adadad;
	border-bottom: 1px solid #adadad;
	border-collapse: collapse;
	width: 80%;

}

/* 테이블 위치 */
.text {
	position: relative;
	top: 30px;
}

/* 테이블 선 색상 */
.box>tr, td {
	border: 1px solid #e2e0e0;
		padding:10px 30px 10px 5px;
}

/* 테이블 크기 */
.box {
	width: 80%;
	height: 200px;
}

#td1, #td2, #td3, #fbtn {
	margin-left: 10px;
}

/* 전체 1:1상담 목록 텍스트 */
#one {
		font-weight: bolder;
	font-size: 30px;
	position: relative;
	top: 10px;
}

#btns {
	position: relative;
	top: 30px;
	left: 300px;
}

button#update-btn {
	height: 40px;
	width: 120px;
	border: solid 1px rgb(147, 147, 194);
	background: white;
	border-radius: 10px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-right: 5px;
}

button#update-btn:hover {
	background: rgb(251, 251, 249);
	outline: none;
}

button#color-btn {
	height: 40px;
	width: 150px;
	background: #313030;
	border-radius: 7px;
	margin-left: auto;
	margin-right: auto;
	border: 0;
	font-size: 15px;
	color: rgb(233, 233, 229);
	position: relative;
}

button#color-btn:hover {
	background: black;
	outline: none;
}
</style>
</head>

<!-- ============================================================== -->


<div class="content-wrapper">
	<div class="back">



		<div class="goodsback">
			<br> <br>
			<h1 id="one">상품색상수정</h1>
			<hr id="gline">
			<br> <br>

			<div class="text">
				<form action="<%=request.getContextPath()%>/productUpdateColorEnd" method="post"
				enctype="multipart/form-data">
						<input type="hidden" name="no" value="<%=p.getpNo()%>"/>
					<table class="box">
						<br>
																
						<tr>
							<td>상품 색상 설정</td>
							<td>
								<div>
									<input type="checkbox" name="option" id="option" checked>
									<label for="option">화이트</label>
									
									<input type="checkbox" name="option" id="option2" >
									<label for="option2">블랙</label>
									
									<input type="checkbox" name="option" id="option3" >
									<label for="option3">핑크</label>
									
									<input type="checkbox" name="option" id="option4" >
									<label for="option4">그린</label>
									
									<input type="checkbox" name="option" id="option5" >
									<label for="option5">블루</label>
									
									<input type="checkbox" name="option" id="option6" >
									<label for="option6">옐로우</label>
									
									<input type="checkbox" name="option" id="option7" >
									<label for="option7">레드</label>
									
									<input type="checkbox" name="option" id="option8" >
									<label for="option8">네이비</label>
									
									<input type="checkbox" name="option" id="option9" >
									<label for="option9">퍼플</label>
									
									<input type="checkbox" name="option" id="option10" >
									<label for="option10">연그레이</label>
									
									<input type="checkbox" name="option" id="option11" >
									<label for="option11">진그레이</label>
																										
								</div>
							</td>						
						</tr>  
						
						<tr>
							<td>색상 이미지</td>
							<td><input type="file" id="fbtn" name="upfile"></td>
						</tr>
						
					</table>
				<div id="btns">
					<button id="update-btn" type="submit">상품색상수정</button>
					&nbsp; &nbsp;
				
				</div>
				</form>
			</div>

		</div>
	</div>
</div>


<%@ include file="/views/admin/common/footer.jsp"%>

