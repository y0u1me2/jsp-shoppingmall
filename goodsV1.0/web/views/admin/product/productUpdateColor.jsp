<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.web.product.model.vo.Product" %>



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

 td:first-of-type{
   color: #80878d;
    text-align: center;
    vertical-align: middle;
    font-weight: normal;
    font-size: 15px;
    background-color: #f5f4f4;
   }
   
  label{
  color: #80878d;
  font-weight: normal;
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
				
		<div class="box">
			<!-- <form name='ajaxFile' id="frm" method="post" enctype="multipart/form-data" > -->
						
			<input type="hidden" name="no" value=""/>
			
			<table id="colorBox">															
				<tr>
					<td>상품 색상 등록</td>
					<td>색상추가하기&nbsp&nbsp&nbsp&nbsp&nbsp*&nbsp색상을입력 후 파일을 추가해주세요<input id="pColor-add" type='button' value="+" /></td>	
				</tr>

				<tbody></tbody>									
			</table>
				<div id="btns">
					<button type="button" id="update-btn">상품색상수정</button>				
				</div>
				<!-- </form> -->
			</div>

		</div>
	</div>
	
<script>
<script>

//색상 입력받는 div 추가하기
let colorCount=0;
$(function(){
$("#pColor-add").click(function(){
	colorCount++;
	var div = '<tr>'+
				'<td colspan="2" style="background:white;">'+
				'<input type="text" id="colorInput" name="colorInput" size="15" placeholder="색상을 입력하세요"/>'+
				'<input type="file" id="pThumbnail" class="pThumbnail" name="colorFile'+colorCount+'" size="4" multiple/>'+
				'<button class="pColor-minus">-</button></td></tr>';
			   
	 $('#colorBox > tr> tbody:last').append(div);
	
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

