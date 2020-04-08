<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.web.product.model.vo.ProductImage"%>
<%@ page import="java.util.LinkedHashMap, com.web.product.model.vo.ProductImage" %>
<%

	LinkedHashMap<String, String> images = (LinkedHashMap<String, String>)request.getAttribute("images");
	int no = (int)request.getAttribute("no");

%>

<%@ include file="/views/admin/common/header.jsp"%>
<style>
* {
	margin: 0;
}

body {
	width: 1366px;
	height: auto;
}

/* section */
div.content-wrapper {
	background-color: white;
	position: relative;
	left: 100px;
	height: auto;
	position: relative;
	width: 100%;
	top: 50px;
	margin-bottom:25px;

}

/* 상품색상수정 텍스트 */
h1#one {
	font-weight: bolder;
	font-size: 30px;
	position: relative;
	top: 10px;
}

/* 상품색상수정 밑에 라인 */
#gline {
	border: 1px solid rgb(177, 174, 174);
	position: relative;
	top: 20px;
	width: 80%;
}

/* 테이블 스타일 */
table#colorBox {
	border-top: 1px solid #adadad;
	border-bottom: 1px solid #adadad;
	border-collapse: collapse;
	width: 80%;
	height: 50px;
	position: relative;
	top: 50px;
}

/* 테이블 선 색상 */
table#colorBox>tr, td {
	border: 1px solid #e2e0e0;
	padding: 10px 30px 10px 5px;
}

/* 첫번째 td 스타일 */
td:first-of-type {
	color: #80878d;
	text-align: center;
	vertical-align: middle;
	font-weight: normal;
	font-size: 15px;
	background-color: #f5f4f4;
	width: 150px;
}

label {
	color: #80878d;
	font-weight: normal;
}

/* 상품색상수정 버튼  */
button#update-btn {
	height: 40px;
	width: 120px;
	border: solid 1px rgb(147, 147, 194);
	background: white;
	border-radius: 10px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-right: 5px;
	position: relative;
	left: 300px;
	top: 100px;
}

button#update-btn:hover {
	background: rgb(251, 251, 249);
	outline: none;
}

/* 상품색상추가 +버튼 */
input#pColor-add {
	padding: 3px 10px;
	font-size: 12px;
	color: rgb(0, 0, 0);
	text-align: center;
	background-color: white;
	border: 1px solid rgb(161, 161, 161);
	position: relative;
	left: 10px;
	font-size: 15px;
}

/* 상품색상 -버튼  */
button.pColor-minus {
	padding: 3px 10px;
	font-size: 12px;
	color: rgb(0, 0, 0);
	text-align: center;
	background-color: white;
	border: 1px solid rgb(161, 161, 161);
	position: relative;
	left:20px;
	font-size: 15px;
}
</style>
</head>

<!-- ============================================================== -->


<div class="content-wrapper">

	<div class="goodsback">

		<h1 id="one">상품색상삭제</h1>
		<hr id="gline">
		<br> <br>

		<div class="box">
			<form method="post" id="frm" action="<%=request.getContextPath() %>/admin/productDeleteColorEnd">

			<table id="colorBox">
				<tr>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp색상 삭제 하기</td>
					<td>			
    				<input type="hidden" name="no" value="<%=request.getAttribute("no")%>"/>
             		<%for(String key : images.keySet() ){ %>  		
    						<input type="hidden" value="<%=images.get(key)%>">	
    						<input type="checkbox" name="colorInput" value="<%=key %>"/>
    						<label for="<%=key %>"><span class="label" style="display: block;"><%=key %></span></label>                              
    		        <%} %>
            
					</td>				
				</tr>
							
				<tbody></tbody>


			</table>
			<div id="btns">
				<button type="submit" id="update-btn">삭제</button>
			</div>
			</form>
		</div>

	</div>


</div>



<%@ include file="/views/admin/common/footer.jsp"%>

