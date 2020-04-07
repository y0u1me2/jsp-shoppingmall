<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.web.cart.model.vo.*,java.util.List" %>
<%@ include file="/views/client/common/header.jsp" %>
<%
	int j=0;
	String[] quan2=request.getParameterValues("pQuantityF");
	int[] quan=new int[quan2.length];
	for(int i=0;i<quan.length;i++){
		quan[i]=Integer.parseInt(quan2[i]);
	}
	List<Cart> cart= (List)request.getAttribute("cart");
	//밑에는 가격할인안된 총 가격
	int price = 0;
	//수량
	int q=0;
	for(Cart c2 : cart){
		// 가격할인안된 총 가격
		price+=(int)(c2.getcPrice()*1.1)*quan[q];;
		q++;	
	}
	//세일된 가격 구하기
	int sale = 0;
	int s=0;
	for(Cart c3 : cart){
		// 가격할인안된 총 가격
		sale+=(int)(c3.getcPrice()/10)*quan[s];
		s++;	
	}
	//배송비
	int deliveryPay = 0;
	if(price-sale>=50000){
		deliveryPay = 0;
	}else{
		deliveryPay = 2500;
	}
	
	//총금액 
	int totalPrice = price-sale;
	if(totalPrice<50000){
		totalPrice=totalPrice+2500;
	}
	
%>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
    /* 바디 해상도 및 폰트 */
    body {
        /* border:1px solid black; */
        width: 1366px;
        height: auto;
        font-family: "Nanum Gothic";
    }

    button {
        /* 버튼 색 */
        background-color: transparent;
        /* 버튼 외곽선 */
        border: none;
        /* 커서 변화 */
        cursor: pointer;
        /* 버튼 폰트 사이즈 및 폰트 
            일괄 적용이 불가능하여 따로 설정함 */
        font-size: 12px;
        font-family: "Nanum Gothic";

    }


    section {
        width: 100%;
        /* height: 50%; */
        height: auto;
        padding-bottom: 160px;
        /* border: 1px solid red; */
        /* margin: 0px 108; */

    }


    /* 메뉴 바 01장바구니 02주문결제 03 주문완료*/
    .top {
        position: relative;
        width: 1366px;
    }

    .step-wrap {
        position: relative;
        width: 1092px;
        height: 57.2px;
        margin: 0 auto;
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
        width: 15%;
        text-align: center;
        float: left;
        color: rgb(175, 175, 175);
        font-size: 15px;
        background-color: rgb(240, 240, 240);
        padding-top: 20px;
        padding-bottom: 20px;
    }

    /* 중앙 부분 시작 */
    .middle {
        position: relative;
        width: 1092px;
        /* min-width: 1140px; */
        /* margin: 0 auto; */
        padding: 0 30px;
        margin: 40px 0px 60px 0px;
    }

    /* 장바구니 상품 */
    .order-product-wrap>h2 {
        font-size: 16px;
        text-align: left;
        padding-left: 110px;
        height: 50px;
        line-height: 50px;
    }

    /* 장바구니 상품정보 테이블 */
    .order-product-wrap>table {
        width: 1092px;
        border-top: 1px solid #191919;
        margin: 0 107px;
        /* padding: 0 30px; */

    }

    .order-product-wrap>table>thead {
        background-color: rgb(245, 245, 245);

    }

    /* 장바구니 상품정보 헤드 */
    table>thead>tr>th {
        height: 49px;
        line-height: 49px;
        font-weight: normal;
        /* background-color: rgb(240, 240, 240); */
        text-align: center;
        font-size: 13px;
    }

    /* 장바구니 상품정보 내용*/
    table>tbody>tr.basketbottom>td {
        padding: 30px 0;
        text-align: center;
        border-bottom: 1px solid rgb(218, 218, 218);
        font-size: 13px;
    }

    /* 임시 텀블러 사진 */
    .tumblrpoto>div>div {
        width: 160px;
        height: 160px;
        position: relative;
        text-align: left;
    }

    .product {
        text-align: left;
    }

    /* 배송정보 */
    .bottom {
        display: inline-block;
        position: relative;
        width: 1092px;
        min-width: 1092px;
        height: auto;
        margin: 0 107px;
        padding: 0 30px;
    }

    /* 배송정보,할인/배송비,결제수단 입력란 왼쪽정렬*/
    .left {
        width: 724px;
        float: left;
        /* 배송정보,할인/배송비,결제수단 uls */
    }

    .left>ul {
        position: relative;
        width: 724px;
        padding: 0;
    }

    /* 배송정보,할인/배송비,결제수단 li */
    .left>ul>li {
        position: relative;
        width: 100%;
        /* height: 51px; */
        margin: 0 0 40px 0;
        overflow: hidden;
        -webkit-transition: height 0.4s ease-out;
        -moz-transition: height 0.4s ease-out;
        -ms-transition: height 0.4s ease-out;
        -o-transition: height 0.4s ease-out;
        transition: height 0.4s ease-out;
    }

    .right {
        width: 330px;
        float: right;
    }

    /* 배송정보 */
    .order-buyer-wrap {
        height: auto;
    }

    /* 배송정보<--타이틀문구 크기 및 설정*/
    .top2 {
        height: 50px;
        font-weight: bold;
        line-height: 50px;
        border-bottom: 1px solid #eee;
        cursor: pointer;
    }

    /* 배송정보 밑에 경계선 */
    .active {
        border-bottom: 1px solid #191919;
    }

    /* 주문자 및 배송지정보 */
    .bottomInform {
        /* display: inline-block; */
        width: 100%;
        display: none;
    }

    /* 주문자 및 배송지정보 마진top 20px */
    .bottomInform>table {
        margin-top: 20px;
    }

    /* 주문자 문구 크기 및 설정 */
    .bottomInform>table>thead>tr>th {
        font-size: 16px;
        font-weight: bold;
        line-height: 50px;
        text-align: left;
    }

    /* 주문자 및 배송지정보 바텀 라인 */
    .bottomInform>table>tbody>tr {
        border-bottom: 1px solid rgb(218, 218, 218);
    }

    table {
        border-collapse: collapse;
        border-spacing: 0;
    }

    /* 주문자 (이름/연락처/이메일 테이블헤더) */
    .bottomInform>table>tbody>tr>th {
        font-size: 13px;
        /* border-bottom: 1px solid rgb(218, 218, 218); */
        font-weight: normal;
        line-height: 50px;
        vertical-align: top;
    }

    /* 주문자 (이름/연락처/이메일 테이블바디) */
    .bottomInform>table>tbody>tr>td {
        font-size: 13px;
        padding: 10px;
        /* border-bottom: 1px solid rgb(218, 218, 218); */
    }

    .bottomInform>table>tbody>tr.choice>td {

        line-height: 50px;

    }

    /* 주문자 및 배송지정보 필수 항목 별표 색상 */
    .bottomInform>table>tbody>tr>th>span {
        color: red;
    }

    /* 이름 입력칸 크기 */
    .input-box-medium {
        display: inline-block;
        padding: 7px 0;
        width: 195px;
        position: relative;
    }

    /* 입력창 설정값 */
    .input-box-medium>div>input {
        width: 175px;
        height: 34px;
        padding: 0 10px;
        line-height: 34px;
        border: 0;
        outline: 1px solid rgb(220, 220, 220);
        font-size: 12px;
    }

    .input-box-medium>div {
        width: 100%;
        position: relative;
    }

    /* 연락처 입력칸 */
    .phone-numbers {
        display: table;
        /* width: 100%; */
        width: 300px;
    }

    /* 연락쳐 - 경계선 */
    ul.phone-numbers>li.line {
        width: 5%;
        padding: 0 6px;
        padding-left: 16px;
        line-height: 34px;
        text-align: center;
    }

    /* 연락처 크기 및 설정 */
    ul.phone-numbers>li {
        display: table-cell;
        width: 30%;
        vertical-align: top;
        box-sizing: border-box;
    }

    /* 연락처 디스플레이 */
    .input-box-small {
        display: inline-block;
        position: relative;
    }

    /* 연락처 입력란 설정 */
    .input-box-small>input {
        /* position:relative; */
        width: 100%;
        height: 34px;
        padding: 0;
        padding-left: 10px;
        line-height: 34px;
        border: 0;
        outline: 1px solid rgb(220, 220, 220);
        font-size: 12px;
    }

    /* 이메일 입력란 설정 */
    .input-box-large {
        width: 280px;
        display: inline-block;
        position: relative;
    }

    /* 이메일 입력란 설정2 */
    .input-box-large>div>input {
        /* position:relative; */
        width: 100%;
        height: 34px;
        padding: 0;
        padding-left: 10px;
        line-height: 34px;
        border: 0;
        outline: 1px solid rgb(220, 220, 220);
        font-size: 12px;
    }

    /* 주소 입력창 */
    .bottomInform>table>tbody>tr>td.addr {
        padding: 10px 10px;
    }

    .addr>div.input-box-medium {
        display: inline-block;
        padding: 0;
        width: 195px;
        position: relative;
    }

    .addrBox {
        width: 560px;
        padding-top: 7px;
    }

    /* .addrBox>div.in{
        position: relative;
        width: 100%;
        padding: 0;
    } */
    /* 주소 입력창 설정 */
    .addrBox>div>input {
        width: 550px;
        height: 34px;
        padding: 0;
        padding-left: 10px;
        line-height: 34px;
        border: 0;
        outline: 1px solid rgb(220, 220, 220);
        font-size: 12px;
    }

    /* 다음 버튼 */
    .btn-black-medium {
        padding: 0 30px;
        line-height: 42px;
        font-size: 15px;
        color: #fff;
        text-align: center;
        background-color: #303030;
        border: 1px solid #303030;
    }

    /* 주문자와 동일버튼 */
    .btn-white {
        padding: 0 12px;
        line-height: 32px;
        font-size: 11px;
        color: #191919;
        text-align: center;
        background-color: #fff;
        border: 1px solid #ccc;
    }

    /* 택배 radio버튼 설정 */
    div.radio>input {
        width: 15px;
        height: 15px;
        vertical-align: middle;
    }

    /* 택배 radio버튼 label설정 */
    div.radio>label {
        position: relative;
        /* display: block; */
        padding-left: 5px;
        outline: 0;
        /* line-height: 16px; */
        font-size: 15px;
        user-select: none;
        vertical-align: middle;
    }

    /* 할인/배송비 input 설정 */
    .input {
        position: relative;
    }

    .box {
        display: inline-block;
    }

    .medium {
        width: 195px;
    }

    .medium>div>input {
        width: 175px;
        height: 34px;
        padding: 0 10px;
        line-height: 34px;
        border: 0;
        outline: 1px solid rgb(220, 220, 220);
        font-size: 13px;
        text-align: right;
        background-color: rgb(243, 243, 243);
    }

    tr.choice>td {
        text-align: left;
    }

    /* 최종결제 테이블 바디 -> 헤드 텍스트설정 */
    tbody.paymentTextaline>tr>th {
        text-align: left;
        font-size: 13px;
        font-weight: normal;
    }

    /* 최종결제 테이블 바디 -> 바디 텍스트설정 */
    tbody.paymentTextaline>tr>td {
        text-align: right;
        font-size: 13px;
        font-weight: bold;
    }

    /* 최종결제 타이틀 문구 설정 */
    div.right>div>h3 {
        height: 51px;
        line-height: 50px;
        /* font-size: 16px; */
    }

    /* em태그 글씨 색상 */
    em {
        color: #e8625a;
    }


    input.error {
        outline: red solid 1px !important;
        margin-bottom: 10px;
    }

    span.error {
        color: red;
        font-size: 11px;
        /* padding-bottom:  !important;  */
    }
</style>
<section>
    <div class="top">
        <!--경계선-->
        <hr>
        <!--주문/결제-->
        <h1 style="font-size: 28px; text-align: center; padding-top: 60px;
            padding-bottom: 60px; color: rgb(25, 25, 25); font-weight: normal;">주문/결제</h1>
        <!--주문/결제메뉴바-->
        <div class="step-wrap">
            <div class="step-step1">
                <span style="padding-left: 100px; padding-right: 21px;">01. 장바구니</span>
                <span style=>></span>
                <span style="color: black; font-size: 20px; padding-left: 10px; padding-right: 20px;
                        font-weight:900; padding-bottom: 15px; padding-top: 17px;">02. 주문/결제</span>
                <span style=>></span>
                <span style="padding-right: 100px; padding-left: 21px;">03. 주문완료</span>
            </div>
        </div>
    </div>
	<form id="paymentOrder" action="<%=request.getContextPath()%>/payment/paymentOrder" method="post">
    <div class="middle">
        <div class="order-product-wrap">
            <h2>장바구니 상품</h2>
            <!-- 장바구니 상품 정보 -->
            <table>
                <colgroup>
                    <col style="width: 209px;">
                    <col style="width: 413px;">
                    <col style="width: 80px;">
                    <col style="width: 140px;">
                    <col style="width: 140px;">
                    <col style="width: 140px;">
                </colgroup>
                <!-- 장바구니 상품정보 헤드 -->
                <thead>
                    <tr>
                    	<th >주문상품 사진</th>
                        <th >주문상품 정보</th>
                        <th>수량</th>
                        <th>상품금액</th>
                        <th>할인금액</th>
                        <th>구매예정가</th>
                    </tr>
                </thead>
                <tbody>
                <%for(Cart c : cart) {%>
                    <tr class="basketbottom">
                        <!-- 장바구니 주문상품사진 -->
                        <td class="tumblrpoto">
                            <div style="width: 190px; height: 190px;">
                                <div style="padding:15px;">
                                    <img src="<%=request.getContextPath()%>/upload/custom/<%=c.getcImage()%>" width="160px"
                                        height="160px">
                                </div>
                            </div>
                        </td>
                        <!-- 장바구니 주문상품정보 -->
                        <td class="product">
                            <div class="names">
                                <h3 style="font-size: 18px;"><%=c.getcName()%></h3>
                                <input type="hidden" name="cNo" value="<%=c.getcCno()%>">
                                <h4 style="font-size: 14px; padding-top: 7px;">kh정보교육원</h4>
                            </div>
                            <div class="date" style="padding:20px 0 0 0; color:#99844b; font-size: 12px;">
                                <span>2020.02.10 출고예정</span>
                            </div>
                        </td>
                        <td><span class="format-comar"><%=quan[j]%>개</span>
                        	 <input type="hidden" name="pQuan" value="<%=quan[j]%>">
                        </td>
                        <td><span class="format-comar"><%=(int)(c.getcPrice()*1.1)*quan[j]%></span>원</td>
                        <td><em>-</em>
                        	<em class="format-comar" ><%=c.getcPrice()/10*quan[j]%></em><em>원</em></td>
                        <td style="font-size: 15px; font-weight: bold;"><span class="format-comar"><%=quan[j]*c.getcPrice()%>
                        	</span><input type="hidden" name="totalPrice" value="<%=quan[j]*c.getcPrice()%>">원</td>
                    </tr>
                    <%j++; %>
                    <%  } %>	
                </tbody>
            </table>
        </div>
    </div>
    <!-- 배송정보,할인/배송비,결제수단 -->
    <div class="bottom">
        
            <div class="left">
                <ul>
                    <!-- 배송정보 -->
                    <li class="order-buyer-wrap dropdown">
                        <!-- 배송정보 밑에 경계선 -->
                        <div class="top2 active drop" onclick="pilsuInput2();">
                            <!-- 배송정보 타이틀(문구) 폰트 16px-->
                            <span style="font-size: 16px;">배송정보</span>
                        </div>
                        <!-- 주문자 및 배송지정보 -->
                        <div class="bottomInform" style="display: block;">
                            <!-- 주문자 -->
                            <table>
                                <colgroup>
                                    <!-- 주문자정보 테이블 헤더/바디 크기 -->
                                    <col style="width: 148px;">
                                    <col style="width: 576px;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <!-- 주문자 타이틀문구 -->
                                        <th colspan="2">주문자</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <!-- 이름 헤더 -->
                                        <th style="padding-top: 10px;">주문자 이름<span>*</span></th>
                                        <!-- 이름 바디 입력창 -->
                                        <td class="input-box-medium">
                                            <div style="padding-top: 9px;">
                                                <input class="pilsu" name="userName" id="userName"
                                                    placeholder="이름을 입력해주세요.">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- 연락처 헤더 -->
                                        <th>주문자 연락처<span>*</span></th>
                                        <td>
                                            <!-- 연락처 바디 입력창 -->
                                            <ul class="phone-numbers">
                                                <!-- 연락처 첫번째 칸 -->
                                                <li>
                                                    <div class="input-box-small">
                                                        <input class="pilsu" name="userPhone[0]" id="userPhone[0]"
                                                            maxlength="4">
                                                    </div>
                                                </li>
                                                <!-- 핸드폰 - 경계선 -->
                                                <li class="line">-</li>
                                                <!-- 연락처 두번째 칸 -->
                                                <li>
                                                    <div class="input-box-small">
                                                        <input class="pilsu" name="userPhone[1]" id="userPhone[1]"
                                                            maxlength="4">
                                                    </div>
                                                </li>
                                                <!-- 핸드폰 - 경계선 -->
                                                <li class="line">-</li>
                                                <!-- 연락처 세번째 칸 -->
                                                <li>
                                                    <div class="input-box-small">
                                                        <input class="pilsu" name="userPhone[2]" id="userPhone[2]"
                                                            maxlength="4">
                                                    </div>
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>

                                    <tr>
                                        <!-- 이메일 헤더 -->
                                        <th>주문자 이메일<span>*</span></th>
                                        <!-- 이메일 입력창 -->
                                        <td>
                                            <div class="input-box-large">
                                                <label></label>
                                                <div>
                                                    <input class="pilsu" name="userEmail" id="userEmail" value="">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- 배송지정보 테이블 마진 40px-->
                            <table style="margin-top: 40px;">
                                <colgroup>
                                    <!-- 배송자정보 테이블 헤더/바디 크기 -->
                                    <col style="width: 148px;">
                                    <col style="width: 576px;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <!-- 배송자정보 타이틀문구 -->
                                        <th>배송지 정보</th>
                                        <!-- 주문자 정보와 동일버튼 오른쪽 정렬 -->
                                        <td style="float: right;">
                                            <button type="button" class="btn-white" id="cb1" onclick="Copy();">주문자
                                                정보와 동일</button>
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <!-- 받으시는분 헤더 -->
                                        <th style="padding-top: 10px;">받으시는 분<span>*</span></th>
                                        <!-- 받으시는 분 바디 입력창 -->
                                        <td class="input-box-medium">
                                            <div style="padding-top: 9px;">
                                                <input class="pilsu" name="userName2" id="userName2"
                                                    placeholder="이름을 입력해주세요.">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- 연락처 헤더 -->
                                        <th>연락처<span>*</span></th>
                                        <td>
                                            <!-- 연락처 바디 입력창 -->
                                            <ul class="phone-numbers">
                                                <!-- 연락처 첫번째 칸 -->
                                                <li>
                                                    <div class="input-box-small">
                                                        <input class="pilsu" name="userPhone2[0]" id="userPhone2[0]"
                                                            maxlength="4">
                                                    </div>
                                                </li>
                                                <!-- 핸드폰 - 경계선 -->
                                                <li class="line">-</li>
                                                <!-- 연락처 두번째 칸 -->
                                                <li>
                                                    <div class="input-box-small">
                                                        <input class="pilsu" name="userPhone2[1]" id="userPhone2[1]"
                                                            maxlength="4">
                                                    </div>
                                                </li>
                                                <!-- 핸드폰 - 경계선 -->
                                                <li class="line">-</li>
                                                <!-- 연락처 세번째 칸 -->
                                                <li>
                                                    <div class="input-box-small">
                                                        <input class="pilsu" name="userPhone2[2]" id="userPhone2[2]"
                                                            maxlength="4">
                                                    </div>
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- 주소 헤더 -->
                                        <th>주소<span>*</span></th>
                                        <!-- 주소 바디 -->
                                        <td class="addr">
                                            <div class="input-box-medium">
                                                <!-- 우편번호 입력란 (입력되면 안됨) -->
                                                <label></label>
                                                <div>
                                                    <input class="pilsu" name="userPost" id="postcode" readonly
                                                        placeholder="우편번호" value/>
                                                    <!--readonly-->
                                                </div>
                                            </div>
                                            <!-- 우편번호 버튼 -->
                                            <button type="button" class="btn-white" id="postFind" onclick="Postcode()"
                                                style="margin-left: 5px; vertical-align: top;">우편번호 조회</button>
                                            <!-- 주소 1 -->
                                            <div class="addrBox">
                                                <div>
                                                    <input class="pilsu" name="userAddr" id="address" readonly
                                                        placeholder="기본 주소를 검색해주세요.(우편번호 조회)" />
                                                    <!--readonly-->
                                                </div>
                                            </div>
                                            <!-- 주소 상세입력(동,호수) -->
                                            <div class="addrBox">
                                                <div>
                                                    <input class="pilsu" name="detailAddress" id="detailAddress"
                                                        placeholder="상세주소를 입력해주세요.">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- 배송방법 헤더 -->
                                        <th>배송방법<span>*</span></th>
                                        <!-- 배송방법 바디 -->
                                        <td class="method">
                                            <div class="radio">
                                                <!-- 택배 라디오 버튼 -->
                                                <input type="radio" name="delivery" value="011005" checked>
                                                <!-- 택배 라벨 -->
                                                <label for="delivery">택배</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- 배송메세지 헤더 -->
                                        <th>배송 메세지<span>*</span></th>
                                        <td>
                                            <!-- 배송 메세지 바디 패딩 인라인으로 0넣음 -->
                                            <div class="addrBox" style="padding: 0;">
                                                <!-- 배송메세지 입력창 -->
                                                <div>
                                                    <input name="userAddr" class="" placeholder="배송메세지를 입력해 주세요.">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- 다음버튼 -->
                            <span style="display: inline-block; width: 100%;  margin: 50px 0 0px;">
                                <!-- 다음버튼 -->
                                <button type="button" class="btn-black-medium" style="float: right;"
                                    onclick="pilsuInput();">다음</button>
                            </span>
                        </div>
                    </li>
                    <li class="dropdown">
                        <!-- 할인/배송비 밑에 경계선 -->
                        <div class="top2 active drop" onclick="pilsuInput2();">
                            <!-- 할인/배송비 타이틀(문구) 폰트 16px-->
                            <span style="font-size: 16px;">할인/배송비</span>
                        </div>
                        <!-- 할인 배송비 div -->
                        <div class="bottomInform">
                            <!-- 할인 배송비 테이블 -->
                            <table style="margin-top: 0;">
                                <colgroup>
                                    <!-- 할인 배송비 헤드/바디 크기  -->
                                    <col style="width: 148px;">
                                    <col style="width: 576px;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <!-- 할인금액 인라인 스타일 -->
                                        <th style="font-weight: bold;">특별 할인금액</th>
                                        <td>
	
                                            <div class="input box medium">
                                                <div>
                                                    <!-- 할인금액 input -->
                                                    <input name="sellDiscount" value="0">
                                                </div>
                                            </div>
                                            <!-- 원 -->
                                            <span style="padding-right:6px;">원</span>
                                            <!-- 쿠폰변경 버튼 및 스타일 -->
                                            <button type="button" class="btn-white" style="background-color: rgb(243, 243, 243);
                                                 color:#999; margin-right: 10px;">쿠폰변경</button>
                                            <!-- 사용가능 쿠폰 문구 -->
                                            <span style="display:inline-block; color:#999; line-height:34px;">
                                                (사용쿠폰 <em>0장</em>&nbsp;/&nbsp; 사용가능 쿠폰 <em>0장</em>)
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- 굿굿즈머니 인라인 스타일 -->
                                        <th style="font-weight: bold;">굿굿즈 머니</th>
                                        <td>
                                            <div class="input box medium">
                                                <div>
                                                    <!-- 굿굿즈머니 input -->
                                                    <input name="sellDiscount" value="0">
                                                </div>
                                            </div>
                                            <span style="padding-right:6px;">원</span>
                                            <!-- 전액사용 버튼 및 스타일 -->
                                            <button type="button" class="btn-white" style="background-color: rgb(243, 243, 243); 
                                                color:#999; margin-right: 10px;">전액사용</button>
                                            <!-- (보유 굿머니 문구) -->
                                            <span style="display:inline-block; color:#999; line-height:34px;">
                                                (보유 굿굿즈 머니 <em>0원</em>)
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="font-weight: bold;">배송비</th>
                                        <td>
                                            <div class="input box medium">
                                                <div>
                                                    <!-- 배송비 input -->
                                                    <input name="sellDiscount" value="<%=deliveryPay %>">
                                                </div>
                                            </div>
                                            <span style="padding-right:6px;">원</span>
                                            <!-- 쿠폰변경 버튼 및 스타일 -->
                                            <button type="button" class="btn-white" style="background-color: rgb(243, 243, 243); 
                                                color:#999; margin-right: 10px;">쿠폰변경</button>
                                            <!-- (사용쿠폰 문구) -->
                                            <span style="display:inline-block; color:#999; line-height:34px;">
                                                (사용쿠폰 <em>0장</em>&nbsp;/&nbsp; 사용가능 쿠폰 <em>0장</em>)
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- 기본 배송비 문구  -->
                            <span style="height: 40px; line-height: 40px; font-size: 12px;">
                                기본배송비는 2,500원이며,
                                <em>총 결제 금액이 50,000원 이상일 경우 무료배송입니다.</em>
                            </span>
                            <!-- 다음버튼 -->
                            <span style="display: inline-block; width: 100%; margin-top: 10px;">
                                <!-- 다음버튼 -->
                                <button type="button" class="btn-black-medium" onclick="pilsuInput();" style="float: right;">다음</button>
                            </span>
                        </div>
                    </li>
                    <li class="dropdown">
                        <!-- 결제방법 밑에 경계선 -->
                        <div class="top2 active drop" onclick="pilsuInput2();">
                            <!-- 결제방법 타이틀(문구) 폰트 16px-->
                            <span style="font-size: 16px;">결제 방법</span>
                        </div>
                        <!-- 결제 방법 div -->
                        <div class="bottomInform">
                           <!--  <table style="margin-top: 0;"> -->
                                <table style="margin-top: 0;">
                                    <!-- 결제방법 테이블 4col -->
                                    <colgroup>
                                        <col style="width: 181px;">
                                        <col style="width: 181px;">
                                        <col style="width: 181px;">
                                        <col style="width: 181px;">
                                    </colgroup>
                                    <tbody>
                                        <!-- 결제방법 선택 -->
                                        <tr class="choice">
                                            <td>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="payChoice" value="card">
                                                              신용카드</label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="payChoice" value="phone" checked>
                                                           휴대폰 결제</label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="payChoice" value="trans">
                                                           실시간 계좌이체</label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="payChoice" value="vbank">
                                                           가상계좌</label>
                                                </div>
                                            </td>
                                        </tr>
                                        <!-- 결제방법 선택2 -->
                                       <!--  <tr class="choice">
                                            <td>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="payChoice" value>
                                                        휴대폰 결제</label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="payChoice" value>
                                                        네이버 페이</label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="payChoice" value>
                                                        카카오 페이</label>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="payChoice" value>
                                                        토스toss</label>
                                                </div>
                                            </td>
                                        </tr> -->
                                    </tbody>
                                </table>

                    <!--         </table> -->

                        </div>
                    </li>
                </ul>

            </div>
            <!-- 최종결제 금액확인 여기는 인라인 스타일로 했음-->
            <div class="right">
                <div>
                    <!-- 최종결제 확인 타이틀 -->
                    <h3>최종결제 금액확인</h3>
                    <!-- 최종결제 border -->
                    <div id="finalPayment" style="border: 1px solid rgb(220, 220, 220); ">
                        <!-- 최종결제 안쪽 패딩 -->
                        <div style="padding:0 20px;">
                            <table>
                                <!-- 최종결제 테이블 헤더/바디 크기 -->
                                <colgroup>
                                    <col style="width: 130px">
                                    <col style="width: 200px">
                                </colgroup>
                                <!-- 최종결제 헤더 -->
                                <thead>
                                    <!-- 최종결제 헤더 인라인 스타일 -->
                                    <tr style="line-height: 90px;border-bottom: 1px solid black;">
                                        <th style="text-align: left; font-size: 20px;">합계</th>
                                        <td style="text-align: right; font-size: 25px; color:#e8625a">
                                        <input type="hidden" name="payAmount" id="payAmount" value="<%=totalPrice %>">
                                        <span class="format-comar" style="color:red"><%=totalPrice %></span><span style="color:red">원</span></td>
                                    </tr>
                                </thead>
                                <!-- 최종결제 바디 padding 위아래 40px -->
                                <tbody style="padding: 40px 0;" class="paymentTextaline">
                                    <!-- 최종결제 최종금액 및 할인금액,배송비 -->
                                    <tr style="line-height: 40px;">
                                        <th style="padding-top: 30px;">상품 금액</th>
                                        <td style="padding-top: 30px;">
										<span class="format-comar"><%=price%></span>원</td>
                                    </tr>
                                    <!-- 할인금액 -->
                                    <tr style="line-height: 40px;">
                                        <th>할인 금액</th>
                                        <td><em>-</em><em class="format-comar"><%=sale %></em><em>원</em></td>
                                    </tr>
                                    <!-- 특별할인금액  -->
                                    <tr style="line-height: 40px;">
                                        <th>특별할인 금액</th>
                                        <td><em>0원</em></td>
                                    </tr>
                                    <!-- 굿굿즈 머니 -->
                                    <tr style="line-height: 40px;">
                                        <th>굿굿즈 머니</th>
                                        <td><em>0원</em></td>
                                    </tr>
                                    <!-- 배송비  -->
                                    <tr style="line-height: 40px;">
                                        <th style="padding-bottom: 30px;">배송비 </th>
                                        <td style="padding-bottom: 30px;"><span class="format-comar"><%=deliveryPay %></span>원</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- 약관동의 백그라운드 색상 -->
                        <div style="background-color: #fafafa;">
                            <!-- 약관동의 span 스타일설정,내용 및 약관보기 클릭 -->
                            <span
                                style="display: block; color: #666; padding: 20px; line-height: 1.67em; font-size: 13px;">
						                                주문할 상품의 상품명,상품가격, 배송정보를 확인하였으며,<br>
						                                구매에 동의하시겠습니까? <button type="button">
                                    <p style="text-decoration: underline;" onclick="openPayPolicy()">약관보기</p>
                                </button>
                                <br>
                                <!-- 동의합니다 체크박스 클릭 -->
                                <div style="padding-top:10px;">
                                    <label style=" vertical-align: middle;">
                                        <input type="checkbox" name="agreeWon" id="agreeWon"
                                            style="width: 15px; height: 15px;  vertical-align: middle;"> 동의합니다.
                                    </label>
                                </div>
                            </span>
                            <!-- 결제하기 버튼 클릭 -->
                            <button type="button" id="paymentBt" onclick="payment()" style="width: 100%; height: 60px;color: #ccc; line-height: 60px; text-align: center;
                                font-size: 18px; border-top: 1px solid rgb(220, 220, 220); font-weight: bold;">결제하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    <!-- </div> -->
		<div id="payPolicy" style="display:none;">
			<!-- 이용약관 팝업-->
			<div class="modal-payPolicy animate">
				<div class="url-html">
					<object type="text/html"  style="bottom: 975px; right:15px;" data="<%=request.getContextPath()%>/views/client/popup/usePolicy.html" id="htmlPolicy"></object>
				</div>
				<div class="close-btn">
					<span onclick="closePayPolicy();" class="close" title="Close Modal">&times;</span>
				</div>
			</div>
		</div>
	<style>
	.modal-payPolicy {
        border: 1px solid black;
        width: 440px;
        height: 564px;
        padding: 40px 30px 30px 30px;
        background-color: #fefefe;
        margin: 5% auto 15% auto;
        position: relative;
    }
	
	</style>


    <script>
    var inputPilsu = $('input.pilsu');//요거 유효성검사 상태정보 input 변수
    var agreeWon=$('div>label>input[type="checkbox"]');//요거 유혀성검사 약관동의하기 input 변수
    var paymentBt=$("#paymenyBt");
 	// 이용약관 열기
    function openPayPolicy() {
        $('#payPolicy').css('display', 'block');
    }
    // 이용약관 닫기
    function closePayPolicy() {
    	
        $('#payPolicy').css('display', 'none');
    }
    
    
    
        $(function () {
           
              $("#agreeWon").change(function(){
                 if ($(inputPilsu[0]).val() == "" || $(inputPilsu[1]).val() == "" || $(inputPilsu[2]).val() == "" || $(inputPilsu[3]).val() == "" || $(inputPilsu[4]).val() == "" ||
                           $(inputPilsu[5]).val() == "" || $(inputPilsu[6]).val() == "" || $(inputPilsu[7]).val() == "" || $(inputPilsu[8]).val() == "" ||
                           $(inputPilsu[9]).val() == "" || $(inputPilsu[10]).val() == "" || $(inputPilsu[11]).val() == ""||agreeWon[0].checked==false) {
                    //인풋 필수 0~11까지 || 약관동의 체크가 안됐을대 if 들어감
                    if ($(agreeWon[0]).parent().siblings('span.error').length != 0) {
                           //input밑에 span.error가 있을때 != 0 니깐 if 들어감
                           $(agreeWon[0]).parent().removeClass('error');
                           //input에 에러클래스 지워줌
                           $(agreeWon[0]).parent().siblings('span').remove();
                           //input에 span 지워줌
                       }
                  if(agreeWon[0].checked==false){
                     //위에서 있던 에러 다 지워주고 (중복안되게) 다시 에러 생성
                     $(agreeWon[0]).parent().after($('<span>').html('필수 항목입니다.').addClass('error'));
                     //에러를 다시 생성해줌
                        $("#paymentBt").css("color","#eee");
                        $("#paymentBt").css("border","1px solid rgb(220, 220, 220)");
                        $("#finalPayment").css("border", "1px solid rgb(220, 220, 220)");
                     //필수항목들을 전부다 하지 않았으므로 다시 결제하기 버튼 글자 컬러 원래 색으로 (#eee)변경
                  }
                 }else{
                    if ($(agreeWon[0]).parent().siblings('span.error').length != 0) {
                           //input밑에 span.error가 있을때 != 0 니깐 if 들어감
                           $(agreeWon[0]).parent().removeClass('error');
                           //input에 에러클래스 지워줌
                           $(agreeWon[0]).parent().siblings('span').remove();
                           //input에 span 지워줌
                       }
                     $("#paymentBt").css("color","black");
                     $("#paymentBt").css("border-top","1px solid black");
                     $("#finalPayment").css("border", "1px solid black");
                     // 필수 항목들이  전부다 입력돼서 블랙으로 바꿔줌
                  }
            });
           
           
           
               $(".pilsu").blur(function () {
                  if ($(inputPilsu[0]).val() == "" || $(inputPilsu[1]).val() == "" || $(inputPilsu[2]).val() == "" || $(inputPilsu[3]).val() == "" || $(inputPilsu[4]).val() == "" ||
                           $(inputPilsu[5]).val() == "" || $(inputPilsu[6]).val() == "" || $(inputPilsu[7]).val() == "" || $(inputPilsu[8]).val() == "" ||
                           $(inputPilsu[9]).val() == "" || $(inputPilsu[10]).val() == "" || $(inputPilsu[11]).val() == ""||agreeWon[0].checked==false) {

                      //필수 클릭후 다른데 클릭했을때 이벤트 발생
                      $(this).removeClass('error');
                      //input에 클래스 에러(있을때) 삭제
                      $(this).siblings('span').remove();
                      //input밑에 span경고창(있을때) 삭제
                      if ($(this).val() == "") {
                          // input에 값이 없을때 if 들어감
                          if ($(this).siblings('span.error').length == 0) {
                              // input안에 span이 없을때 if 들어감
                              $(this).addClass('error');
                              // input안에 error클래스 추가 해줌
                              $(this).after($('<span>').html("필수 항목입니다.").addClass('error'));
                              // input다음에 span을 넣어줌 html(내용).addclass는(css)
                              $("#paymentBt").css("color","#eee");
                           $("#paymentBt").css("border","1px solid rgb(220, 220, 220)");
                           $("#finalPayment").css("border", "1px solid rgb(220, 220, 220)");
                          }
                      } else {
                          //얘는 input에 내용이 있을때 들어감
                          if ($(this).attr('name') == "userPhone[2]" && $(this).val().length < 4) {
                              //input name이 "userPhone[2]" 이고 input 값이 3자리 이하일때
                              $(this).addClass('error');
                              // input안에 error클래스 추가 해줌
                              $(this).after($('<span>').html("최소 4자리이상.").addClass('error'));
                              // input다음에 span을 넣어줌 html(내용).addclass는(css
                              $("#paymentBt").css("color","#eee");
                           $("#paymentBt").css("border","1px solid rgb(220, 220, 220)");
                           $("#finalPayment").css("border", "1px solid rgb(220, 220, 220)");
                          }
                          if ($(this).attr('name') == "userPhone2[2]" && $(this).val().length < 4) {
                              //input name이 "userPhone[2]" 이고 input 값이 3자리 이하일때
                              $(this).addClass('error');
                              // input안에 error클래스 추가 해줌
                              $(this).after($('<span>').html("최소 4자리이상.").addClass('error'));
                              // input다음에 span을 넣어줌 html(내용).addclass는(css
                              $("#paymentBt").css("color","#eee");
                           $("#paymentBt").css("border","1px solid rgb(220, 220, 220)");
                           $("#finalPayment").css("border", "1px solid rgb(220, 220, 220)");
                          }
                      }
                  }else{
                     console.log(this);
                      if ($(this).attr('name') == "userPhone[2]" && $(this).val().length < 4) {
                           console.log("언제쯤나오냐");
                         $(this).removeClass('error');
                            //input에 클래스 에러(있을때) 삭제
                            $(this).siblings('span').remove();
                            //input밑에 span경고창(있을때) 삭제
                              //input name이 "userPhone[2]" 이고 input 값이 3자리 이하일때
                              $(this).addClass('error');
                              // input안에 error클래스 추가 해줌
                              $(this).after($('<span>').html("최소 4자리이상.").addClass('error'));
                              // input다음에 span을 넣어줌 html(내용).addclass는(css
                              $("#paymentBt").css("color","#eee");
                           $("#paymentBt").css("border","1px solid rgb(220, 220, 220)");
                           $("#finalPayment").css("border", "1px solid rgb(220, 220, 220)");
                          }else if($(this).attr('name') == "userPhone2[2]" && $(this).val().length < 4) {
                              $(this).removeClass('error');
                               //input에 클래스 에러(있을때) 삭제
                               $(this).siblings('span').remove();
                               //input밑에 span경고창(있을때) 삭제
                              //input name이 "userPhone[2]" 이고 input 값이 3자리 이하일때
                              $(this).addClass('error');
                              // input안에 error클래스 추가 해줌
                              $(this).after($('<span>').html("최소 4자리이상.").addClass('error'));
                              // input다음에 span을 넣어줌 html(내용).addclass는(css
                              $("#paymentBt").css("color","#eee");
                           $("#paymentBt").css("border","1px solid rgb(220, 220, 220)");
                           $("#finalPayment").css("border", "1px solid rgb(220, 220, 220)");
                           }else{
                              $(this).removeClass('error');
                               //input에 클래스 에러(있을때) 삭제
                               $(this).siblings('span').remove();
                               //input밑에 span경고창(있을때) 삭제
                        
                              $("#paymentBt").css("color","black");
                              $("#paymentBt").css("border-top","1px solid black");
                              $("#finalPayment").css("border", "1px solid black");
                           } 
                       
                  }
               });
            
           
          
        })

        function Copy() {
            //onclick Copy() 를 클릭하면 밑에 실행됨
            document.getElementById("userName2").value = document.getElementById("userName").value;
            //id가 userName에 입력한 값을 id가 userName2에 value값을 넣어줌
            document.getElementById("userPhone2[0]").value = document.getElementById("userPhone[0]").value;
            //id가 userPhone[0]에 입력한 value값을 id가 userPhone2[0]에 value값을 넣어줌
            document.getElementById("userPhone2[1]").value = document.getElementById("userPhone[1]").value;
            //id가 userPhone[1]에 입력한 value값을 id가 userPhone2[1]에 value값을 넣어줌
            document.getElementById("userPhone2[2]").value = document.getElementById("userPhone[2]").value;
            //id가 userPhone[2]에 입력한 value값을 id가 userPhone2[2]에 value값을 넣어줌
            
             /*  $('.pilsu').change(function () { */
                //필수 keyup(키보드 손뗏을때) 펑션시작
             for (let i = 0; i < inputPilsu.length; i++){
                if ($(inputPilsu[i]).val() != "") {
                    //input에 값이 있을때 if 들어감
                    if ($(inputPilsu[i]).siblings('span.error').length != 0) {
                        //input밑에 span.error가 있을때 != 0 니깐 if 들어감
                        $(inputPilsu[i]).removeClass('error');
                        //input에 에러클래스 지워줌
                        $(inputPilsu[i]).siblings('span').remove();
                        //input에 span 지워줌
                    }
                }
             }
          /*   }) */
          if ($(inputPilsu[0]).val() == "" || $(inputPilsu[1]).val() == "" || $(inputPilsu[2]).val() == "" || $(inputPilsu[3]).val() == "" || $(inputPilsu[4]).val() == "" ||
                           $(inputPilsu[5]).val() == "" || $(inputPilsu[6]).val() == "" || $(inputPilsu[7]).val() == "" || $(inputPilsu[8]).val() == "" ||
                           $(inputPilsu[9]).val() == "" || $(inputPilsu[10]).val() == "" || $(inputPilsu[11]).val() == ""||agreeWon[0].checked==false) {
          
          }else{
              $("#paymentBt").css("color","black");
              $("#paymentBt").css("border-top","1px solid black");
              $("#finalPayment").css("border", "1px solid black");
          }
            
            
        }

       
        function pilsuInput() {
            console.log("나오나?");
            console.log($(inputPilsu[0]).val());
            if ($(inputPilsu[0]).val() == "" || $(inputPilsu[1]).val() == "" || $(inputPilsu[2]).val() == "" || $(inputPilsu[3]).val() == "" || $(inputPilsu[4]).val() == "" ||
                $(inputPilsu[5]).val() == "" || $(inputPilsu[6]).val() == "" || $(inputPilsu[7]).val() == "" || $(inputPilsu[8]).val() == "" ||
                $(inputPilsu[9]).val() == "" || $(inputPilsu[10]).val() == "" || $(inputPilsu[11]).val() == "") {
                for (let i = 0; i < inputPilsu.length; i++) { //일단 입력창갯수 만큼 for문 돌리긔
                    if ($(inputPilsu[i]).val() == "") { //입력창에 입력된거 없으면
                        if ($(inputPilsu[i]).siblings().length == 0) { //근데 없는데 형제로 span이라던지 뭐 없어 그러면
                            $(inputPilsu[i]).siblings('span').remove(); //그러면 어 그 span이 있을수도 있고 내가 몰랐을수 있으니까 지워주고
                            $(inputPilsu[i]).addClass('error'); //error클래스 추가하고
                            $(inputPilsu[i]).after($('<span>').html('필수 항목입니다.').addClass('error')); //span태그 추가하긔
                            $(inputPilsu[i]).siblings('span').attr('style', 'display:block;'); //span음 왜 그랬지?

                        }
                    }
                }
            } else {
                // $(".btn-black-medium").click(function () {
                //btn-black-medium class를 클릭 기능 실행

                $(event.target).parentsUntil('li').parent().next().children('.bottomInform').slideDown(500);
                //btn-black-medium class에 부모 div,li까지 찾고 div.bottomInform의 parent(부모)
                // il의 다음(next) li의 자식 '.bottomInform' 슬라이드 다운;
                $(event.target).parentsUntil('.bottomInform').parent().slideUp(500);
                //btn-black-medium class에 부모중 1.span 2.div.'.bottomInform'까지 찾고 span의 부모 div.'.bottomInform'를 슬라이드 업

                // $(this).parentsUntil('.bottomInform').parent().not($(this).parentsUntil('li').parent().next().children('.bottomInform')).slideUp(700);
                //btn-black-medium class에 부모중 1.span 2.div.'.bottomInform'까지 찾고 span의 부모 div.'.bottomInform'를 슬라이드 업
                //단 제외할 div는 btn-black-medium class에 부모 div,li까지 찾고
                //div.bottomInform의 parent(부모)il의 다음(next) li의 자식 '.bottomInform' 
                // });

            }
        }

        function pilsuInput2() {
            console.log("나오나?");
            console.log($(inputPilsu[0]).val());
            if ($(inputPilsu[0]).val() == "" || $(inputPilsu[1]).val() == "" || $(inputPilsu[2]).val() == "" || $(inputPilsu[3]).val() == "" || $(inputPilsu[4]).val() == "" ||
                $(inputPilsu[5]).val() == "" || $(inputPilsu[6]).val() == "" || $(inputPilsu[7]).val() == "" || $(inputPilsu[8]).val() == "" ||
                $(inputPilsu[9]).val() == "" || $(inputPilsu[10]).val() == "" || $(inputPilsu[11]).val() == "") {
                for (let i = 0; i < inputPilsu.length; i++) { //일단 입력창갯수 만큼 for문 돌리긔
                    if ($(inputPilsu[i]).val() == "") { //입력창에 입력된거 없으면
                        if ($(inputPilsu[i]).siblings().length == 0) { //근데 없는데 형제로 span이라던지 뭐 없어 그러면
                            $(inputPilsu[i]).siblings('span').remove(); //그러면 어 그 span이 있을수도 있고 내가 몰랐을수 있으니까 지워주고
                            $(inputPilsu[i]).addClass('error'); //error클래스 추가하고
                            $(inputPilsu[i]).after($('<span>').html('필수 항목입니다.').addClass('error')); //span태그 추가하긔
                            $(inputPilsu[i]).siblings('span').attr('style', 'display:block;'); //span음 왜 그랬지?

                        }
                    }
                }
            } else {
                $(event.target).next().slideDown(500);      
                $(event.target).parent().siblings(".dropdown").children(".bottomInform").not($(this).next(".bottomInform")).slideUp(500);
            }
        }

        function Postcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("detailAddress").value = extraAddr;

                    } else {
                        document.getElementById("detailAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("detailAddress").focus();
                    for (let i = 0; i < inputPilsu.length; i++){
                        if ($(inputPilsu[i]).val() != "") {
                            //input에 값이 있을때 if 들어감
                            if ($(inputPilsu[i]).siblings('span.error').length != 0) {
                                //input밑에 span.error가 있을때 != 0 니깐 if 들어감
                                $(inputPilsu[i]).removeClass('error');
                                //input에 에러클래스 지워줌
                                $(inputPilsu[i]).siblings('span').remove();
                                //input에 span 지워줌
                            }
                        }
                     }
                }
            
            }).open();
            

           
        }
        
        function payment() {
            if ($(inputPilsu[0]).val() == "" || $(inputPilsu[1]).val() == "" || $(inputPilsu[2]).val() == "" || $(inputPilsu[3]).val() == "" || $(inputPilsu[4]).val() == "" ||
                $(inputPilsu[5]).val() == "" || $(inputPilsu[6]).val() == "" || $(inputPilsu[7]).val() == "" || $(inputPilsu[8]).val() == "" ||
                $(inputPilsu[9]).val() == "" || $(inputPilsu[10]).val() == "" || $(inputPilsu[11]).val() == ""||agreeWon[0].checked==false) {
                for (let i = 0; i < inputPilsu.length; i++) { //일단 입력창갯수 만큼 for문 돌리긔
                    if ($(inputPilsu[i]).val() == "") { //입력창에 입력된거 없으면
                        if ($(inputPilsu[i]).siblings().length == 0) { //근데 없는데 형제로 span이라던지 뭐 없어 그러면
                            $(inputPilsu[i]).siblings('span').remove(); //그러면 어 그 span이 있을수도 있고 내가 몰랐을수 있으니까 지워주고
                            $(inputPilsu[i]).addClass('error'); //error클래스 추가하고
                            $(inputPilsu[i]).after($('<span>').html('필수 항목입니다.').addClass('error')); //span태그 추가하긔
                            $(inputPilsu[i]).siblings('span').attr('style', 'display:block;'); //span음 왜 그랬지?

                        }
                    }
                    if ($(inputPilsu[i]).attr('name') == "userPhone[2]" && $(inputPilsu[i]).val().length < 4) {
                         $(inputPilsu[i]).siblings('span').remove();
                        //input name이 "userPhone[2]" 이고 input 값이 3자리 이하일때
                        $(inputPilsu[i]).addClass('error');
                        // input안에 error클래스 추가 해줌
                        $(inputPilsu[i]).after($('<span>').html("최소 4자리이상.").addClass('error'));
                        // input다음에 span을 넣어줌 html(내용).addclass는(css
                    }
                    
                    if ($(inputPilsu[i]).attr('name') == "userPhone2[2]" && $(inputPilsu[i]).val().length < 4) {
                       $(inputPilsu[i]).siblings('span').remove();
                      //input name이 "userPhone[2]" 이고 input 값이 3자리 이하일때
                      $(inputPilsu[i]).addClass('error');
                      // input안에 error클래스 추가 해줌
                      $(inputPilsu[i]).after($('<span>').html("최소 4자리이상.").addClass('error'));
                      // input다음에 span을 넣어줌 html(내용).addclass는(css
                  }
                   
                
                }
             if(agreeWon[0].checked==false){
                $(agreeWon[0]).parent().siblings('span').remove(); //그러면 어 그 span이 있을수도 있고 내가 몰랐을수 있으니까 지워주고
                $(agreeWon[0]).parent().addClass('error'); //error클래스 추가하고
                $(agreeWon[0]).parent().after($('<span>').html('필수 항목입니다.').addClass('error')); //span태그 추가하긔
             }
              
                
            } else {
               
               if ($(inputPilsu[3]).attr('name') == "userPhone[2]" && $(inputPilsu[3]).val().length < 4) {
                   $(inputPilsu[3]).siblings('span').remove();
                  //input name이 "userPhone[2]" 이고 input 값이 3자리 이하일때
                  $(inputPilsu[3]).addClass('error');
                  // input안에 error클래스 추가 해줌
                  $(inputPilsu[3]).after($('<span>').html("최소 4자리이상.").addClass('error'));
                  // input다음에 span을 넣어줌 html(내용).addclass는(css
              }else if ($(inputPilsu[8]).attr('name') == "userPhone2[2]" && $(inputPilsu[8]).val().length < 4) {
                 $(inputPilsu[8]).siblings('span').remove();
                //input name이 "userPhone[2]" 이고 input 값이 3자리 이하일때
                $(inputPilsu[8]).addClass('error');
                // input안에 error클래스 추가 해줌
                $(inputPilsu[8]).after($('<span>').html("최소 4자리이상.").addClass('error'));
                // input다음에 span을 넣어줌 html(내용).addclass는(css
             }else{
               var IMP = window.IMP; // 생략가능
               var payChoice = $('input[name="payChoice"]:checked').val(); //선태된 결제방법의 값
               var payAmount=$("#payAmount").val();//가격
               var userName=$("#userName").val();//이름
               var userEmail=$("#userEmail").val();//이메일
               var userAddr=$("#address").val()+' '+$("#detailAddress").val();//주소
               var postcode=$("#postcode").val();//우편번호
               var userPhone=$(inputPilsu[1]).val()+'-'+$(inputPilsu[2]).val()+'-'+$(inputPilsu[3]).val();
              
                IMP.init('imp39029830'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
                IMP.request_pay({
                    pg: 'inicis', // version 1.1.0부터 지원.
                    pay_method: payChoice,
                    merchant_uid: 'merchant_' + new Date().getTime(),
                    name: '주문명: 굿굿즈 결제',
                    amount: payAmount,
                    buyer_email: userEmail,
                    buyer_name: userName,
                    buyer_tel: userPhone,
                    buyer_addr: userAddr,
                    buyer_postcode: postcode,
                    m_redirect_url: 'https://www.yourdomain.com/payments/complete'
                }, function (rsp) {
                    if (rsp.success) {
                    	$("#paymentOrder").submit();
                        var msg = '결제가 완료되었습니다.';
                        msg += '고유ID : ' + rsp.imp_uid;
                        msg += '상점 거래ID : ' + rsp.merchant_uid;
                        msg += '결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num; 
                    } else {
                        var msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;
                    }

                });     
              
             }
            }
        }
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
			$('.format-comar').text(function() {
				$(this).text($(this).text().format());
			});

		})
      
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</section>



<%@ include file="/views/client/common/footer.jsp" %>