<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/client/common/header.jsp"%>
<%@ page import="com.web.cart.model.vo.*,java.util.List" %>
<%
	List<Cart> cart= (List)request.getAttribute("cart");
    
%>

<style>
input[type="checkbox"] {
	display: inline-block;
	width: 17px;
	height: 17px;
	border: 2px solid #bcbcbc;
	cursor: pointer;
}

* {
	margin: 0;
}
/* 바디 해상도 및 폰트 */
body {
	/* border:1px solid black; */
	width: 1366px;
	height: auto;
	font-family: "Nanum Gothic";
}

section {
	width: 100%;
	/* height: 50%; */
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

/* 메뉴 바 01장바구니 02주문결제 03 주문완료*/
.top {
	position: relative;
}

.step-wrap {
	position: relative;
	width: 1092px;
	height: 57.2px;
	margin: 0 107px;
	padding: 0 30px;
}

.step-step1 {
	position: relative;
	height: 57.2px;
}
/* 메뉴 바 위치 조절 */
/* .sd{
        color: black;
    } */
div.step-step1>span {
	width: 14.5%;
	text-align: center;
	float: left;
	color: rgb(175, 175, 175);
	font-size: 15px;
	background-color: rgb(240, 240, 240);
	padding-top: 20px;
	padding-bottom: 20px;
}

/* 중앙 */
.middle {
	position: relative;
	width: 1092px;
	/* min-width: 1140px; */
	margin: 0px 107px;
	padding: 0px 30px;
}

div.top2 {
	display: inline-block;
	width: 100%;
	margin: 30px 0px 0px;
	padding: 0px 0px 30px;
	border-bottom: 1px solid rgb(238, 238, 238);
}

div.top2>div.inner {
	position: relative;
	width: 1366px;
	margin: 0px auto;
	padding: 0px;
}

div.inner>div.left {
	float: left;
	margin-left: 8px 0px;
}

div.inner>div.right {
	float: right;
	margin-right: 274px;
}

button.btn-white-small {
	line-height: 32px;
	font-size: 13px;
	color: rgb(25, 25, 25);
	text-align: center;
	background-color: rgb(255, 255, 255);
	padding: 0px 12px;
	border-width: 1px;
	border-style: solid;
	border-color: rgb(204, 204, 204);
	border-image: initial;
	cursor: pointer;
}

div.right>span {
	float: left;
	display: inline-block;
	line-height: 50px;
	padding: 0px 15px 0px 0px;
}

div.right>span.format-Price {
	padding: 0;
}

div.right>button {
	/*  float: left; */
	padding: 0px 30px;
}

.btn-gray-big {
	line-height: 48px;
	font-size: 14px;
	color: rgb(255, 255, 255);
	text-align: center;
	background-color: rgb(117, 117, 117);
	padding: 0px 97px;
	border-width: 1px;
	border-style: solid;
	border-color: rgb(117, 117, 117);
	border-image: initial;
	cursor: pointer;
}
/* 중앙 바텀 */
/* .bottom2{

    } */
.cart-product-wrap {
	margin: 40px 0px 0px !important;
}
/* PC상품 (1/2...) */
span>span.title {
	text-align: left;
	font-size: 16px;
}

span.txt {
	font-size: 12px;
	padding-left: 8px;
	color: rgb(116, 116, 116);
}

span>span.notice {
	float: right;
	margin-right: -50;
}
/* 유의사항 */
span.icon {
	padding-right: 50px;
	font-size: 14px;
	cursor: pointer;
	position: relative;
	height: 12px;
	color: rgb(102, 102, 102);
}

span.icon:hover>span {
	display: block !important;
}

span.icon>span {
	position: absolute;
	z-index: 10;
	display: none;
	font-size: 12px;
	line-height: 20px;
	box-shadow: rgba(0, 0, 0, 0.2) 0px 2px 2px;
	top: 20px;
	right: 50px;
	width: 205px;
	padding: 10px;
	background: rgb(255, 255, 255);
	border-width: 1px;
	border-style: solid;
	border-color: rgb(25, 25, 25);
	border-image: initial;
}
/* 주문상품 소제목 */
th {
	/* border: 1px solid red; */
	padding: 0px;
	font-size: 13px;
	font-weight: normal;
	height: 49px;
	line-height: 49px;
	background-color: rgb(240, 240, 240);
	text-align: center
}

.checkbox {
	position: relative;
	display: inline-block;
	vertical-align: baseline;
	line-height: 16px;
	min-height: 16px;
	/* min-width: 16px; */
	/* pointer-events: none; */
	outline: 0px;
}
/* 상품정보  */
tbody>tr>td {
	padding: 30px 0px;
	text-align: center;
}

div.oriPri {
	font-size: 15px;
	color: #999;
	text-decoration: line-through;
	line-height: 20px;
}

div.salePri {
	font-size: 17px;
	font-weight: 600;
	/* font-family: "YoonGothicPro760"; */
	line-height: 20px;
}
/* .price2{
       text-align: center;
   } */
.price2>span {
	display: block;
}
/* 장바구니수량 +,- */
/* .quantity{
    text-align: center;
   } */
.inputquantity {
	position: relative;
	padding: 0 1px;
}

.inputquantity2 {
	margin-left: 35px;
	display: table;
	width: 72px;
	height: 34px;
	outline: 1px solid rgb(218, 218, 218);
	pointer-events: all;
}

.inputquantity2:hover {
	outline: 1px solid black;
}

.minus {
	width: 22px;
	height: 34px;
	font-size: 20px;
}

div.inputquantity2>div {
	width: 24px;
}

div.inputquantity2>input {
	width: 24px;
	padding: 0;
	margin: 0;
	background: transparent;
	border: 0;
	text-align: center;
}

button {
	border: 0 none;
	background-color: transparent;
	cursor: pointer;
}

.plus {
	width: 22px;
	height: 34px;
	font-size: 15px;
}
/* 장바구니수량 +,- */

/* 장바구니 상품 토탈금액 */
.total {
	color: #e5362c;
	font-size: 20px;
	font-weight: bold;
	font-family: "YoonGothicPro760";
}

/* 상품 편집/복사/삭제 */
.shoppingutil {
	border-bottom: 1px solid rgb(218, 218, 218);
}

/* 이용안내 */
.bottom {
	position: relative;
	width: 80%;
	margin: 0 auto;
	padding: 0 30px;
	padding: 60px 0 0 0;
}
/* 이용안내 */
dt {
	/* font-family: "YoonGothicPro760"; */
	margin-left: 30px;
	margin-bottom: 15px;
	line-height: 1;
	font-size: 16px;
	text-align: left;
}

dd {
	margin-left: 30px;
	font-size: 12px;
	color: #666;
	line-height: 1.67em;
	background: url(/images/icon/svg/belit-22.svg) 0 8px no-repeat;
	padding-left: 5px;
	margin-bottom: 4px;
}
</style>
<section style="width: 80%; padding-bottom: 160px;">
	<div class="top">
		<!--경계선-->
		<hr style="width: 1366px;">
		<!--장바구니 타이틀-->
		<h1
			style="font-size: 28px; text-align: center; padding-top: 50px; padding-bottom: 50px; color: rgb(25, 25, 25); font-weight: normal; padding-left: 170px; margin-left: 107px;">장바구니</h1>
		<!--장바구니 메뉴바-->
		<div class="step-wrap">
			<div class="step-step1">
				<span
					style="color: black; padding-left: 105px; font-size: 20px; font-weight: 900; padding-bottom: 17px; padding-top: 17px;">01.
					장바구니</span> <span style="padding-left: 25px;">></span> <span
					style="padding-right: 20px; padding-left: 20px;">02. 주문/결제</span> <span
					style="padding-right: 15px;">></span> <span
					style="padding-right: 115px;">03. 주문완료</span>
			</div>
		</div>
	</div>

	<div class="middle">
	
			<!-- 선택,삭제 메뉴 및 금액,주문 -->
			<div class="top2">
				<div class="inner">
					<div class="left">
						<!-- 선택,삭제메뉴-->
						<button type="button" class="btn-white-small"
							onclick="cartSelectAll();">전체 선택</button>
						<button type="button" class="btn-white-small"
							onclick="cartReleaseAll();">선택 해제</button>
						<button type="button" class="btn-white-small" 
							onclick="cartSelectDelete()">삭제</button>
					</div>
					<div class="right">
						<!-- 결제예정금액 및 상품주문 버튼-->
						<span> 결제 예정금액( <em style="color: red;"
							class="cartSelCount" id="cartSelCount">0</em> )
						</span>
						<span id="payAllPrice" class="format-Price payAllPrice"
							style="color: red; font-size: 23px;" name="payAllPrice">
						</span> 
						<span style="color: red; font-size: 23px;">원</span>
						<button type="button" class="btn-gray-big" id="cartOrderBtn">선택상품
							주문하기</button>
					</div>
				</div>
			</div>
		
			<div class="bottom2">
				<div class="cart-product-wrap">
					<!--장바구니 상단 멘트-->
					<span style="display: inline-block; width: 100%; height: 35px; padding-top:30px;">
						<span class="title">PC 상품 &nbsp <span>( <em
								style="color: red;" class="cartSelCount">0</em> / <span
								class="cartAllCount">1</span> )
						</span> <span class="txt">PC에서 제작한 상품으로 주문 및 편집이 가능합니다.</span>
					</span> <!--유의 사항--> <span class="notice"> <span class="icon">
								유의사항
								<button type="button">?</button> <span> 90일동안 로그인을 하지
									않으시면, <br> 장바구니에 저장하신 상품이 삭제됩니다.
							</span>
						</span>
					</span>
					</span>
					<!--상품 리스트-->
					<table style="width: 1092px; border-top: 1px solid black;">
						<colgroup>
							<col style="width: 56px;">
							<col style="width: 290px;">
							<col>
							<col style="width: 130px;">
							<col style="width: 74px;">
							<col style="width: 130px;">
						</colgroup>
						<thead style="background-color: rgb(204, 204, 204);">
							<tr>
								<th>
									<div class="cartCheckbox">
										<input type="checkbox" name="cartSelectReleaseAll"
											id="cartSelectReleaseAll" value="" onclick="cartSelRelAll()">
									</div>

								</th>
								<th>상품 사진</th>
								<th>주문 상품정보</th>
								<th>상품금액</th>
								<th>수량</th>
								<th>주문금액</th>
							</tr>
						</thead>
					
						<tbody>
						<%if(cart.isEmpty()){%>
	            			<tr>
	            				<td colspan='6' style="padding: 60px 0"><h3>장바구니 리스트가 없습니다.</h3></td>
	            			</tr>
	            		<%}else{ %>	
							<%for(Cart c : cart) {%>
							
							<tr>
								<td style="text-align: center; vertical-align: top;">
									
									<div class="cartCheckbox">
										<input type="checkbox" name="cartSelect" class="cartSelect"
											 value="<%=c.getcCno()%>">										
									</div> <!-- 전체클릭하면 위에 체크되기-->
									
								</td>
								<td>
									<div
										style="width: 260px; height: 260px; padding: 0px 15px; margin-left: 85px;">
										<img
											src="<%=request.getContextPath()%>/upload/custom/<%=c.getcImage()%>"
											alt="텀블러" width="260px" height="260px">
									</div>
								</td>
								<td style="text-align: left; padding-left: 20px;">
									<div>
										<h3><%=c.getcName()%></h3>
									</div>
								</td>
								<td class="price2">
									<div class="oriPri">
										<span class="format-Price"><%=c.getcPrice()*1.1%></span>원
									</div>
									<div class="salePri">
										<span class="format-Price sale"><%=c.getcPrice()%></span>원
									</div>
								</td>
								<td class="quantity">
									<div class="inputquantity">
										<div class="inputquantity2">
											<button type="button" class="minus"
												style="display: table-cell;">-</button>
											<!-- <div> -->
											<input type="text" class="pdQuantity" name="pdQuantity"
												value="1" maxlength="3">				
											<!-- <input type="hidden" name="pQuantityF" class="pQuantityF" value="">	 -->									
											<!-- </div> -->
											<button type="button" class="plus"
												style="display: table-cell;">+</button>
										</div>
									</div>
								</td>
								<td style="color: #e5362c; font-size: 19px; font-weight: bold;">
									<span class="format-Price payPrice" name="payPrice"></span>원
								</td>
							</tr>
						
							<tr class="shoppingutil">

								<td colspan="6" style="padding: 0;">
									<div
										style="padding: 18px 0; height: 14px; border-top: 1px dashed rgb(218, 218, 218); padding-bottom: 25px;">
										<span style="float: left; font-size: 12px;">
											<button type="button" class="cPEdit">편집하기</button> <span
											style="padding: 0 20px; color: rgb(218, 218, 218);">|</span>
											<button type="button" class="cLDelete">삭제하기</button>
											<form class="cartDeleteF" action="<%=request.getContextPath()%>/cart/cartListDelete" method="post">
												<input type="hidden" class="cLDeleteNo" name="cLDeleteNo" value=<%=c.getcCno()%>>
											</form>
										</span>
										<span
											style="float: right; font-size: 12px; padding-top: 5px;">최종
											편집일 <%=c.getcDate() %>
										</span>
									</div>
								</td>
							</tr>	
							
							<% } %>	
						<%} %>		
					
						</tbody>
						
					</table>
				

				</div>
			</div>
		
		<form id="cartAllDelete" action="<%=request.getContextPath()%>/cart/cartSelectDelete" method="post">
		</form>
		<form id="cartF" action="<%=request.getContextPath()%>/payment" method="post">
		</form> 
	</div>
	<div class="bottom">
		<dl>
			<dt>이용안내</dt>
			<dd>
				<em style="color: red;"> 90일동안 로그인을 하시지 않으면, 장바구니에 저장하신 상품이
					삭제됩니다. </em>
			</dd>
			<dd>총 결제 금액이 5만원 이상인 경우 무료 배송 혜택을 받으실 수 있습니다.</dd>
		</dl>

	</div>
	<script>
		/* 체크박스 전체선택, 전체해제 */
		//체크박스 전체선택하기
		var check = false;
		var chk = document.getElementsByName("cartSelect");
		//var payAllPrice=0;
		var checkAll = $("input:checkbox[name=cartSelect]").length;
		var pQuantityF =$("input[name=pQuantityF]").val();
		var cartChecked = 0;
		//chk에 name이select[0]인것을 넣어줌
		$(function() {
			let num = parseInt($("#cartSelCount").text());
			;
			if (num > 0) {
				$("#cartOrderBtn").css("background-color", "black");
				
			} else {
				$("#cartOrderBtn")
						.css("background-color", "rgb(117, 117, 117)");
			}
			// 로드 시 체크된게 있으면 선택 해제
			for (var i = 0; i < chk.length; i++) {
				chk[i].checked = false; //모두 해제
			}
			// 로드 시 전체체크/삭제가 체크돼이으면 체크 해제
			$('#cartSelectReleaseAll').prop('checked',false);

		})
		 $.each($('.pdQuantity'),function(i,item){
			//최초 로드시 수량 1개로 초기화
			let quan=$(item);
			console.log(quan.val());
			$(quan).attr("pdQuantity",'1');
		})
		$(".cLDelete").click(function(){
			var result = confirm('선택하신 상품을 삭제하시겠습니까?'); 
			console.log($(this).next().children());
			if(result) {
				$(this).next(".cartDeleteF").submit();
			}else{
				
			}
			
		})
		
		$("#cartOrderBtn").click(function(){
			let num = parseInt($("#cartSelCount").text());
			if(num>0){
				form=$("#cartF");
				$(form).children().remove();
				$.each($(".cartSelect"),function(i,item){
					if(item.checked==true){
						const v=$(item).parents("tr").find("input.pdQuantity").val();
						const inputCk = $("<input>").attr({
							type:"hidden",name:"cartSelectF",value:$(item).val()
						});
						const input=$("<input>").attr({
								type:"hidden",name:"pQuantityF",value:v
						});
						form.append(inputCk);
						form.append(input);
					}
				});
				
				var result = confirm('선택하신 상품을 결제하시겠습니까?'); 
				if(result) {
					$("#cartF").submit();
				}
			}else{
				alert("선택사항을 확인해주세요.");
			}
			
		});
		//선택항목삭제
		function cartSelectDelete(){
			let num = parseInt($("#cartSelCount").text());
			if(num>0){
				form=$("#cartAllDelete");
				$(form).children().remove();
				$.each($(".cartSelect"),function(i,item){
					if(item.checked==true){
						const inputCk = $("<input>").attr({
							type:"hidden",name:"cartSelectDelete",value:$(item).val()
						});

						form.append(inputCk);
					}
				});
				
				var result = confirm('선택하신 상품을 삭제하시겠습니까?'); 
				if(result) {
					$("#cartAllDelete").submit();
				}
			
			}else{
				alert("선택사항을 확인해주세요.");
			}
		};
		
		function cartSelRelAll() {

			var AllPayResult;
			//카트트셀렉 클릭
			if (check == false) {
				check = true;
				for (var i = 0; i < chk.length; i++) {

					chk[i].checked = true; //모두 체크

				}
				for (var i = 0; i < chk.length; i++) {
					if (chk[i].checked == true) {
						totalPlus();
						if (cartChecked < chk.length) {
							cartChecked++;
						}
					}
				}
				$("#payAllPrice").text(AllPayResult);
				$('.cartSelCount').text(cartChecked);
				let num = parseInt($("#cartSelCount").text());
				;
				if (num > 0) {
					$("#cartOrderBtn").css("background-color", "black");
				} else {
					$("#cartOrderBtn").css("background-color",
							"rgb(117, 117, 117)");

				}
			} else {
				check = false;
				for (var i = 0; i < chk.length; i++) {
					chk[i].checked = false; //모두 해제
				}

				for (var i = 0; i < chk.length; i++) {
					if (chk[i].checked == false) {
						totalAllMinus();
						if (cartChecked > 0) {
							cartChecked--;
						}
					}
				}

				$("#payAllPrice").text(AllPayResult);
				$('.cartSelCount').text(cartChecked);
				let num = parseInt($("#cartSelCount").text());
				;
				if (num > 0) {
					$("#cartOrderBtn").css("background-color", "black");
				} else {
					$("#cartOrderBtn").css("background-color",
							"rgb(117, 117, 117)");

				}
			}
		}
		//전체선택 버튼 체크박스 체크
		function cartSelectAll() {

			var AllPayResult;
			var cartSelAll = $("#cartSelectReleaseAll");
			cartSelAll.prop("checked", true);
			check = true;
			//모두 체크하기
			for (var i = 0; i < chk.length; i++) {
			
				chk[i].checked = true; //모두 체크

				if (chk[i].checked) {
					totalPlus();
					
				}

			}

			//체크된 숫자 확인
			for (var i = 0; i < chk.length; i++) {
				if (chk[i].checked == true) {
					if (cartChecked < chk.length) {
						cartChecked++;
					}
				}
			}
			$('.cartSelCount').text(cartChecked);

			$("#payAllPrice").text(AllPayResult);
			let num = parseInt($("#cartSelCount").text());
			;
			if (num > 0) {
				$("#cartOrderBtn").css("background-color", "black");
			} else {
				$("#cartOrderBtn")
						.css("background-color", "rgb(117, 117, 117)");

			}
		}
		//선택해제 버튼 체크박스 해제
		function cartReleaseAll() {

			var AllPayResult;
			var cartRelAll = $("#cartSelectReleaseAll");
			cartRelAll.prop("checked", false);
			check = false;
			for (var i = 0; i < chk.length; i++) {
				chk[i].checked = false; //모두 해제
			}
			for (var i = 0; i < chk.length; i++) {
				if (chk[i].checked == false) {

					totalAllMinus();
					if (cartChecked > 0) {
						cartChecked--;
					}
				}
			}
			$('.cartSelCount').text(cartChecked);
			$("#payAllPrice").text(AllPayResult);
			let num = parseInt($("#cartSelCount").text());
			;
			if (num > 0) {
				$("#cartOrderBtn").css("background-color", "black");
			} else {
				$("#cartOrderBtn")
						.css("background-color", "rgb(117, 117, 117)");

			}

		}
		//총개 계산함수
		function totalPlus() {
			const selectCheck = $("input.cartSelect");
			let sum = 0;
			$.each(selectCheck, function(i, item) {
				if (item.checked == true) {
					let price = $(item).parents("tr").find("span.payPrice")
							.text();
					price = price.replace(/,/g, "");
					sum += parseInt(price);
				}
			})
			$("#payAllPrice").text(
					sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		}
		//총개 계산함수
		function totalAllMinus() {
			const selectCheck = $("input.cartSelect");
			let payAllPrice = $("#payAllPrice").text();
			payAllPrice = 0;

			$("#payAllPrice").text(payAllPrice);
		}
		//총개 계산함수 빼기
		function totalMinus() {

			const selectCheck = $("input.cartSelect");
			let payAllPrice = $("#payAllPrice").text();
			payAllPrice = payAllPrice.replace(/,/g, "");

			let target = $(event.target).parents("tr").find("input.cartSelect");

			if (target.prop("checked") == true) {
				let price = $(target).parents("tr").find("span.sale").text();
				price = price.replace(/,/g, "");
				payAllPrice -= parseInt(price);
			}

			$("#payAllPrice").text(
					payAllPrice.toString()
							.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		}

		//체크박스 개수
		$(function() {
			
			// 전체 체크박스 개수 구하기

			$('.cartAllCount').text(checkAll);
			// 선텍 체크박스 개수 구하기

			$('.cartSelect')
					.click(
							function() {
								var AllPayResult;
								var payPrice = $(this).parent().parent().next()
										.next().next().next().next().children()
										.text();
								var amount = 0;

								if (event.target.checked == true) {
									cartChecked++;
									totalPlus();

								} else {

									cartChecked--;
									let payAllPrice = $("#payAllPrice").text();
									payAllPrice = payAllPrice.replace(/,/g, "");
									payPrice = payPrice.replace(/,/g, "");
									payAllPrice -= payPrice;

									AllPayResult = payAllPrice.toString()
											.replace(/\B(?=(\d{3})+(?!\d))/g,
													",");
								}

								//장바구니스트 상품 개수
								$('.cartSelCount').text(cartChecked);
								//submit할 총가격 text
								$("#payAllPrice").text(AllPayResult);
								let num = parseInt($("#cartSelCount").text());
								;
								if (num > 0) {
									$("#cartOrderBtn").css("background-color",
											"black");
								} else {
									$("#cartOrderBtn").css("background-color",
											"rgb(117, 117, 117)");

								}

							});
			//로드 시 제품들 가격.
		
			var quan = $('.pdQuantity');
		
			var productPrice = $('.sale');
			for (let i = 0; i < productPrice.length; i++) {
				var amount = new Array();
				var productAmount = new Array();
				console.log($(quan[i]).val());
				amount[i] = $(quan[i]).val() * parseInt(productPrice.eq(i).text());
				console.log(amount[i]);
				var productAmount = quan.parent().parent().parent().next()
						.children();

				productAmount.eq(i).text(amount[i]);

			}

		})

		//수량 input에 blur이벤트 수량 입력하면 최종금액나옴
		$(".pdQuantity").blur(
				function() {
					var quan = $(this).val();
					var productPrice = $(this).parent().parent().parent()
							.prev().children().children().eq(1).text();
					productPrice = productPrice.replace(/,/g, "");
					var amount = quan * parseInt(productPrice);
					var result = amount.toString().replace(
							/\B(?=(\d{3})+(?!\d))/g, ",");

					var total = $(this).parent().parent().parent().next()
							.children();
					total.text(result);
					totalPlus();

				})

		//수량 버튼 +,- 하기
		$(".plus").click(
				function() {
					var $this = $(this);
					var target = $this.prev();
					var num = target.val();
					num++;
					;
					console.log(target.val(num))
					var quantity = target.val(num);
					// 1. "," 있는 스트링을 변환
					var amount = $(this).parent().parent().parent().prev()
							.children().children().eq(1).text();

					amount = amount.replace(/,/g, "");
					var tAmount = quantity.val() * parseInt(amount);

					var result = tAmount.toString().replace(
							/\B(?=(\d{3})+(?!\d))/g, ",");

					var total = $(this).parent().parent().parent().next()
							.children();

					total.text(result);

					//check확인 후 총계값 계산하기
					var checkBox = $(event.target).parents("tr").find(
							"input.cartSelect")[0];
					if (checkBox.checked == true) {
						totalPlus();
					}

				});
		//-버튼 클릭하면 수량 금액 변동
		$(".minus").click(
				function() {
					var $this = $(this);
					var target = $this.next();
					var num = target.val();
					var checkBox = $(event.target).parents("tr").find(
							"input.cartSelect")[0];
					if (target.val() > 1) {
						num--;
						target.val(num);
						if (checkBox.checked == true) {
							totalMinus();
						}
					} else {
						target.val(1);

					}
					var quantity = target.val(num);
					// 1. "," 있는 스트링을 변환
					var amount = $(this).parent().parent().parent().prev()
							.children().children().eq(1).text();
					amount = amount.replace(/,/g, "");
					var tAmount = quantity.val() * parseInt(amount);

					var result = tAmount.toString().replace(
							/\B(?=(\d{3})+(?!\d))/g, ",");

					var total = $(this).parent().parent().parent().next()
							.children();

					total.text(result);

				});
		//페이지 로딩시 바로 펑션 시작쓰
		$(function() {
			//숫자 타입에서 쓸 수 있도록 format() 함수 추가
			Number.prototype.format = function() {
				if (this == 0)
					return 0;
				var reg = /(^[+-]?\d+)(\d{3})/;
				var n = (this + '');
				while (reg.test(n))
					n = n.replace(reg, '$1' + ',' + '$2');
				return n;
			};

			// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
			String.prototype.format = function() {
				var num = parseFloat(this);
				if (isNaN(num))
					return "0";
				return num.format();
			};
			$('.format-Price').text(function() {
				$(this).text($(this).text().format());
			});

		})
		
		
		
	</script>


</section>

<%@ include file="/views/client/common/footer.jsp"%>