<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
}

/* 상품등록 div */
div.goodsback {
	height: auto;
	position: relative;
	top: 100px;
	width: 100%;
}

/* 상품등록 텍스트 */
h1#one {
	font-weight: bolder;
	font-size: 30px;
	position: relative;
	top: 10px;
}

/* 상품등록 밑에 라인 */
#gline {
	border: 1px solid rgb(177, 174, 174);
	position: relative;
	top: 20px;
	width: 80%;
}

/* 테이블 스타일 */
table.box {
	border-top: 1px solid #adadad;
	border-bottom: 1px solid #adadad;
	border-collapse: collapse;
	width: 80%;
	position: relative;
	top: 30px;
	height: 250px;
}

/* 첫번째 td 스타일 */
td:first-of-type {
	color: #80878d;
	text-align: center;
	vertical-align: middle;
	font-weight: normal;
	font-size: 15px;
	background-color: #f5f4f4;
	width: 180px;
}

/* 첫번째 td 텍스트  */
label {
	color: #80878d;
	font-weight: normal;
}

/* 테이블 선 색상 */
table.box>tr, td {
	border: 1px solid #e2e0e0;
	padding: 10px 30px 10px 10px;
}

/* 상품등록 버튼 */
input#submit-btn {
	position: relative;
	top: 60px;
	left: 400px;
	width: 100px;
	height: 40px;
	border: solid 1px rgb(147, 147, 194);
	background: white;
	border-radius: 5px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-right: 5px;
	position: relative;
}

input#submit-btn:hover {
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
		<h1 id="one">상품등록</h1>
		<hr id="gline">
		<br> <br>

		<form method="post" action="<%=request.getContextPath() %>/admin/productEnrollEnd" id="frm" enctype="multipart/form-data">
			<table class="box" id="box">
				</br>
				</br>

				<tr>
					<td width="150px">상품명(필수)</td>
					<td><input type="text" id="td1" name="pName"></td>
				</tr>

				<tr>
					<td>카테고리</td>
					<td><select name="pCategory">
							<option>-카테고리 선택-</option>
							<option value="케이스">케이스</option>
							<option value="악세사리">악세사리</option>
							<option value="생활용품">생활용품</option>
							<option value="패션">패션</option>
					</select></td>
				</tr>

				<tr>
					<td>판매가(필수)</td>
					<td><input type="text" id="td2" name="pPrice">원</td>
				</tr>
				<tr>
					<td>상품 설명 등록</td>
					<td><input type="text" name="pComment" /></td>
				</tr>
	
				<tr>
					<td>섬네일 이미지 등록</td>
					<td><input type="file" name="listImage"/></td>
				</tr>
		
				<tr>
					<td>상품 색상 등록</td>
					<td>*색상 선택 및 색상이미지를 업로드 해주세요<input id="pColor-add" type='button' value="+" /></td>
					<!-- <td><input type="text" id="colorInput" name="colorInput"
						size="15" placeholder="색상을 입력하세요" /> <input type="file"
						id="pThumbnail" class="pThumbnail" name="" size="4" multiple /></td> -->
				</tr>

				<tbody></tbody>

			</table>
			<input type="submit" id="submit-btn" value="상품등록">
		</form>

	</div>

	<script>
	
	//색상 입력받는 div 추가하기
	
	/* '<input type="text" id="colorInput" name="colorInput" size="15" placeholder="색상을 입력하세요"/>' */
	let colorCount=0;
	$(function(){
	$("#pColor-add").click(function(){
		colorCount++;
		var div = '<tr>'+
			 		'<td>상품 색상 등록</td>'+ 
					'<td><select id="colorInput" name="colorInput"><option>색상을 선택해 주세요</option>'+
					'<option value="화이트">화이트</option><option value="블랙">블랙</option>'+
					'<option value="핑크">핑크</option><option value="그린">그린</option>'+
					'<option value="블루">블루</option><option value="옐로우">옐로우</option>'+
					'<option value="레드">레드</option><option value="네이비">네이비</option>'+
					'<option value="퍼플">퍼플</option><option value="그레이">그레이</option>'+
					'<option value="연그레이">연그레이</option></select>&nbsp&nbsp&nbsp'+
					'<input type="file" id="pThumbnail" class="pThumbnail" name="colorFile'+colorCount+'" size="4" multiple/>'+
					'<button class="pColor-minus">-</button></td></tr>';
				   
		 $('#box > tbody:last').append(div);
		
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