<%@page import="com.web.mypage.vo.OrderDeliveryMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/client/common/header.jsp" %>
<%
	List <OrderDeliveryMember> od = (List)request.getAttribute("od");
%>
    <style>
  
 /* aside메뉴 */
div.aside {
	width: 20%;
	height: 0;
	line-height: 130%;
}

/* aside와 content공간띄우기 */
div.aside2 {
	width: 8%;
	height: 100%;
	line-height: 130%;
}
aside2{
	width : 10%;
}

/*리스트 스타일 */
ul.lnb_list a {
	padding-top: 3px;
	padding-left: 13px;
	line-height: 25px;
	font-size: 16px;
	color: #000;
	background: transparent
		url(https://s3-ap-northeast-2.amazonaws.com/redprintingweb.common/2017/img/icon/menu_arrow.svg)
		no-repeat left 6px;
	text-decoration:none;
}

ul {
	list-style: none;
}

/* ======================================================================== */       
    /* 섹션 스타일 */
    .back{
        width: 80%;
        position: relative;
        left: 10%;  
    }
    
    .backDiv{
        width:96%;
        padding:0px 15%;
    }
  
    /* 첫번째 테이블 첫번째 줄 스타일 */
    #bstyle1{
        background-color:rgb(248, 248, 248);
        height: 50px;
        color: rgb(95, 93, 93);  
    } 
    #btn1{
        font-size: 12px;
    }

    /* 6개월 12개월 24개월 버튼 */
    #btn1>button{
        height: 40px;
        width: 70px;
        border: solid 1px rgb(217, 217, 221);
        background: white;
        border-radius: 3px;
        font-size: 12px;
        color: rgb(114, 114, 112);
    }

    /* 직접입력 조회 위치 */
    #search{
        position: relative;
        left: 250px;
        font-size: 12px;
    }
    
    /* 조회버튼 */
    #btn2{
        height: 40px;
        width: 70px;
        border: solid 1px rgb(217, 217, 221);
        background: rgb(49, 47, 47);
        border-radius: 3px;
        font-size: 12px;
        color: rgb(250, 250, 246);
    }

    /* 테이블 위 메세지 스타일 */
    #msg{
        color: rgb(155, 153, 153); 
        font-size: 13px;
    }

    /* 두번째 테이블 첫번째 줄 스타일 */
    #bstyle{
        background-color:rgb(248, 248, 248);
        height: 50px;
        color: rgb(95, 93, 93);
        border-bottom: 1px solid #e2e0e0;
    }
    
    /* 두번째 박스 스타일 */
    .box{
        border-top: 1px solid #adadad;
        border-collapse: collapse;
        width: 97%;
    }

    /*주문배송내역 텍스트*/
    #one{
        font-size: 25px;
        position: relative;
        top: 10px;
        text-align: center;
        color: rgb(66, 66, 66);
        font-weight: lighter;
    }

    /* 주문내역 박스 */
   #conbox{
       text-align: center;
       height: 300px;
       font-size: 11px;
       color: rgb(139, 138, 138);
       position: relative;
       left: 250px;
   }

   #line{
    border: 1px solid #e2e0e0;
   }
    
    /* 주문 배송 유의사항 */
    
    /*위에 박스에서 조금 띄우기 */
    .notice{
        position: relative;
        top: 50px;
    }

    /* 밑에 리스트들 */
    .notice>ul>p{  
        color:rgb(73, 73, 73);
        position: relative;
        right:40px;    
        font-weight: bold;
        top: 5px;
    }

    /* 주문배송 유의사항 / 증빙서류 발급 안내 */
    .notice>ul>h4{
        color:rgb(59, 59, 57);
        position: relative;
        right: 40px;   
        font-size: 13px;
    }

    /* 주문배송유의사항 밑에 리스트 */
    .notice>ul>li{
        color:rgb(134, 134, 133);
        position: relative;
        right: 20px;
        top: 5px;
        font-size: 11px;
    }
    .uldiv{
    	padding:0px 20%;
    }

    </style>


      <section class="back">
      
      <div class="aside">
		<h5 style='line-height: 400%'>&nbsp&nbsp HOME // MyPage</h5>
		<h2 style='line-height: 300%'>&nbsp&nbsp마이페이지</h2>

		<ul class="lnb_list">
			<li><a href="<%=request.getContextPath()%>/orderDelivery"
			style="color: rgb(23, 7, 248); font-weight: bold;">주문/배송 조회</a></li>
			<br>
			<li><a href="<%=request.getContextPath()%>/listLookUp">찜 목록 조회</a></li>
			<br>
			<li><a href=>반품/환불</a></li>
			<br>
			<li><a href="<%=request.getContextPath()%>/MyInquiryWrite">1:1문의</a></li>
			<br />
			<li><a href="<%=request.getContextPath()%>/myInquiryList?mNo=<%=loginMember.getM_No() %>">1:1문의내역</a></li>
			<br>
			<li><a href="">쿠폰관리</a></li>
			<br>
			<li><a href="">포인트관리</a></li>
			<br>
			<li><a href="<%=request.getContextPath()%>/profile2">회원정보수정</a></li>
			<br>
			<li><a href="<%=request.getContextPath()%>/mmbrswthdr2">회원탈퇴</a></li>
			<br>
		</ul>
	</div>
	
	<!-- aside2 목록과붙어있는공간띄우기-->

        <div class="backDiv">
            <br><br>
            <h1 id="one">주문 · 배송 내역</h1>
            <br><br>
            
        <div id="bstyle1">
            <table id="box1">
                <tr>
                    <td id="btn1">
                        &nbsp;&nbsp;기간별 조회&nbsp;&nbsp;
                        <button>6개월</button>
                        <button>12개월</button>
                        <button>24개월</button>
                    </td>
                    
                    
                    <td id="search">
                        직접입력 조회 &nbsp;&nbsp;
                        <input type="date" name="today" >
                        -
                        <input type="date" name="today" >
                        <button id="btn2">조회</button>
                    </td>
                </tr>
            </table>
        </div>

                <br><br>
    
                <form>
                   <p id="msg"> 주문 취소는 결제 완료 후 1시간 이내에 [주문취소] 버튼을 이용해 가능합니다. </p>
                    <table class="box">
                        <tr  id="bstyle">
                            <th>
              	 주문번호             
                            </th>
                            <th>
                                상품정보
                            </th>
                            <th>
                                수량/금액
                            </th>
                            <th>
                  	주문일             
                            </th>
                            <th>
                                진행상태
                            </th>    
                            <th>
                               주문삭제
                            </th>
                            <th>
                               리뷰
                            </th>
                            <th>
                               갤러리
                            </th>                        
                        </tr>
                        <%for(OrderDeliveryMember o : od){ %>
                        <tr>
                        <td>
                        <%=o.getoNo() %>
                        </td>
                        <td>
                        <img src="<%=request.getContextPath()%>/upload/custom/<%=o.getCfileName()%>"/>
                        <%=o.getpName() %> <%=o.getcColor() %>
                        </td>
                        <td><%=o.getoQuan() %></br><%=o.gettPrice()*o.getoQuan() %></td>
                        <td><%=o.getoDate() %></td>
                        <td>배송중</td>
                        <td><button type="button" onclick="orderDeliverydt();" value="<%=o.getcNo() %>" />삭제</td>
                        <td><button type="button" id="deleteorder" />리뷰</td>
                        <td><button type="button" id="deleteorder" />갤러리</td>
                        
                        </tr>
                    	<%} %>
                        <%if(od.isEmpty()){ %>
                        <tr>
                            <td id="conbox" colspan="6">
                           <!-- 주문한 내역이 없습니다. <br>
                        이전 구매내역은 기간별조회를 통해 확인 가능합니다.   -->  
                            </td>
                        </tr>
                        <%} %>
                    </table>
                </form>
                <hr id="line">
            </div>
        

        <div class="notice">
            <ul class="uldiv">
            <h4>주문 · 배송 유의사항</h4>          
            <li>주문내역에 대해 메일 및 SMS를 발송해드립니다.</li>
            <li>
                무통장입금의 경우 주문한 날부터 7일 이내 입금확인이 되어야 주문이 취소되지 않습니다
                배송조회는 상품출고 된 날의 익일 오전부터 가능합니다.
            </li>
            <li>출고일로부터 2일 경과후에도 배송조회가 되지 않을 경우, 고객센터로 연락 부탁드립니다.</li>
            <br>
            <h4>증빙서류 발급 안내</h4>
            
            <p>[영수증발급]</p> 
            <li>결제와 동시에 발급 되며, 출력가능합니다.</li>
            <br>
            <p>[현금영수증]</p>
            <li>무통장입금과 실시간 계좌이체 이용 시 신청 가능하며, 해당월(결제일 기준)의 말일까지 발행가능합니다.</li>
            <li>발행은 주문시 신청된 정보로 발행되며, 신청 후 2~3일 후에 국세청 사이트에서 확인 가능합니다. </li>
            <li>현금영수증과 세금계산서는 1가지만 선택하여 발행 받으실 수 있습니다.</li>
            <br>
            <p>[세금계산서]</p>
            <li>결제일 기준으로 익월 5일까지 결제월의 세금계산서 발행이 가능합니다.</li>
            <li>현금영수증을 먼저 신청한 경우 세금계산서는 발급할 수 없습니다. </li>
            <li>무통장 입금의 경우, 세금계산서와 제출서류 다운로드는 결제완료 전에도 신청 및 다운로드가 가능합니다.</li>
        </ul>

    <br> <br> <br> <br> <br>
</section>
<script>
function orderDelete(){
    var result=confirm("주문을 취소하시겠습니까?");
    var value=$(event.target).val();
    if(result){
       location.replace("<%=request.getContextPath()%>/orderdelete?no="+value);
    }
 }
</script>


<%@ include file="/views/client/common/footer.jsp" %>