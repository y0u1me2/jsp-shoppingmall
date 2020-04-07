<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.web.product.model.vo.Product"%>

<%
Product p = (Product)request.getAttribute("product");
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

/* 섹션 안 공간  */
div.content-wrapper {
	background-color: white;
	position: relative;
	left: 100px;
}

/* content */
div.goodsback {
	height: auto;
	position: relative;
	top: 100px;
	width: 100%;
	margin-bottom:150px;
}

/* 상품정보수정 텍스트 */
h1#one {
	font-weight: bolder;
	font-size: 30px;
	position: relative;
	top: 10px;
}

/* 상품정보수정 밑에 라인 */
hr#gline {
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
	height: 200px;
}

/* 테이블 위치 */
div.text {
	position: relative;
	top: 30px;
}

/* 테이블 선 색상 */
table.box>tr, td {
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
}

/* 상품정보수정 버튼 */
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
	left: 380px;
	top: 50px;
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

<!-- ============================================================== -->


<div class="content-wrapper">


	<div class="goodsback">
		<br> <br>
		<h1 id="one">상품정보수정</h1>
		<hr id="gline">
		<br> <br>

		<div class="text">
			<form action="<%=request.getContextPath()%>/admin/productUpdateEnd"
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="pNo" value="<%=p.getpNo()%>" /> 

				<table class="box">
					<br>
					<br>
					<tr>
						<td width="150px">상품명</br>(필수)
						</td>
						<td><input type="text" name="pName" value="<%=p.getpName()%>"></td>
					</tr>
					<tr>
						<td>판매가</br>(필수)
						</td>
						<td><input type="text" id="pPrice" name="pPrice"
							value="<%=p.getpPrice()%>">원</td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td><input type="text" name="category"
							value="<%=p.getpCategory()%>"></td>
					</tr>
					<tr>
						<td>상품설명</td>
						<td><input type="text" name="comment" size="100"
							value="<%=p.getpComment()%>"></td>
					</tr>
					<tr>
						<td>섬네일 이미지 수정</td>
						<td><input type="file" id="fbtn" name="listImage"> 
				
							<%if(p.getpThumbnail()!=null){ %> 
							<!-- 그전에 업로드 했던 파일이름 보이게 하기 --> 
							<span><%=p.getpThumbnail() %></span> 
							<input type="hidden" name="pThumbnail" value="<%=p.getpThumbnail()%>" />
							<%} %>
						</td>
					</tr>

					<tr>

					</tr>

					<tr>
						<td>&nbsp&nbsp&nbsp&nbsp&nbsp상품 색상 추가</td>
						<td>*색상 선택 및 색상이미지를 업로드 해주세요<input id="pColor-add"
							type='button' value="+" /></td>
					</tr>

					<tbody></tbody>



				</table>
				<div id="btns">
					<button id="update-btn" type="submit">상품정보수정</button>
					&nbsp; &nbsp;

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
			 		'<td>&nbsp&nbsp&nbsp&nbsp&nbsp상품 색상 추가</td>'+ 
					'<td><select id="colorInput" name="colorInput"><option>색상을 선택해 주세요</option>'+
					'<option value="화이트">화이트</option><option value="블랙">블랙</option>'+
					'<option value="핑크">핑크</option><option value="그린">그린</option>'+
					'<option value="블루">블루</option><option value="옐로우">옐로우</option>'+
					'<option value="레드">레드</option><option value="네이비">네이비</option>'+
					'<option value="퍼플">퍼플</option><option value="그레이">그레이</option>'+
					'<option value="연그레이">연그레이</option></select>&nbsp&nbsp&nbsp'+
					'<input type="file" id="pThumbnail" class="pThumbnail" name="colorFile'+colorCount+'" size="4" multiple/>'+
					'<button class="pColor-minus">-</button></td></tr>';
				   
		 $('.box > tbody:last').append(div);
		
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
	
	 $("#pPrice").change(function(){
		 checkPrice($('#pPrice').val());
		});
	 
	 function checkPrice(){
		var price=$("#pPrice").val().trim();
	
		   if(/[^0123456789]$/.test(price)) {
		      alert("숫자만 입력할 수 있습니다.");
		      $('#pPrice').val('').focus();
		        return;
		    }    
		}
	 
	});

	</script>


</div>


<%@ include file="/views/admin/common/footer.jsp"%>