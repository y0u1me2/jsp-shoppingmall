<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.web.product.model.vo.Product"%>

<%
	
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
	height: 400px;
	position: relative;
	top: 100px;
	width: 100%;
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
	height: 100px;
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
	right: 50px;
	font-size: 15px;
}
</style>
</head>

<!-- ============================================================== -->


<div class="content-wrapper">

	<div class="goodsback">
		<br> <br>
		<h1 id="one">상품색상수정</h1>
		<hr id="gline">
		<br> <br>

		<div class="box">
			<form method="post" action="<%=request.getContextPath() %>/productUpdateColorEnd?no=" id="frm" enctype="multipart/form-data">

			<table id="colorBox">
				<tr>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp상품 색상 삭제</td>
					<td>
					<label>
					<input type="checkbox" name="deleteColorType"/>화이트
					</label>
					<label>
					<input type="checkbox" name="deleteColorType"/>블랙
					</label>
					<label>
					<input type="checkbox" name="deleteColorType"/>핑크
					</label>
					<label>
					<input type="checkbox" name="deleteColorType"/>그린
					</label>
					<label>
					<input type="checkbox" name="deleteColorType"/>블루
					</label>
					<label>
					<input type="checkbox" name="deleteColorType"/>옐로우
					</label>
					<label>
					<input type="checkbox" name="deleteColorType"/>레드
					</label>
					<label>
					<input type="checkbox" name="deleteColorType"/>네이비
					</label>
					<label>
					<input type="checkbox" name="deleteColorType"/>퍼플
					</label>
					<label>
					<input type="checkbox" name="deleteColorType"/>그레이
					</label>
					<label>
					<input type="checkbox" name="deleteColorType"/>연그레이
					</label>
					</td>			
				</tr>
				
				<tr>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp상품 색상 등록</td>
					<td>색상추가하기&nbsp&nbsp&nbsp&nbsp&nbsp*&nbsp색상을입력 후 파일을 추가해주세요<input
						id="pColor-add" type='button' value="+" /></td>
				</tr>

				<tbody></tbody>


			</table>
			<div id="btns">
				<button type="button" id="update-btn">상품색상수정</button>
			</div>
			</form>
		</div>

	</div>

	<script>
	
	//색상 입력받는 div 추가하기
	let colorCount=0;
	$(function(){
	$("#pColor-add").click(function(){
		colorCount++;
		var div = '<tr>'+
			 		'<td>&nbsp&nbsp&nbsp&nbsp&nbsp상품 색상 등록</td>'+ 
					'<td><select id="colorInput" name="colorInput"><option>색상을 선택해 주세요</option>'+
					'<option value="화이트">화이트</option><option value="블랙">블랙</option>'+
					'<option value="핑크">핑크</option><option value="그린">그린</option>'+
					'<option value="블루">블루</option><option value="옐로우">옐로우</option>'+
					'<option value="레드">레드</option><option value="네이비">네이비</option>'+
					'<option value="퍼플">퍼플</option><option value="그레이">그레이</option>'+
					'<option value="연그레이">연그레이</option></select>&nbsp&nbsp&nbsp'+
					'<input type="file" id="pThumbnail" class="pThumbnail" name="colorFile'+colorCount+'" size="4" multiple/>'+
					'<button class="pColor-minus">-</button></td></tr>';
				   
		 $('#colorBox > tbody:last').append(div);
		
		 //색상 - 버튼
		$(".pColor-minus").click(function(){
			console.log($(this).parents("tr"));
			$(this).parents("tr").remove();		
		});	
		//사용자가 색상 입력시 파일 name값 바꾸기
		$(".pThumbnail").change(function(){
			var inputName = $(this).prev().val();
			$(this).attr("name",inputName);
			//$(this).prev().attr("readonly",true);
		});
	});
	
	});

	</script>
</div>



<%@ include file="/views/admin/common/footer.jsp"%>

