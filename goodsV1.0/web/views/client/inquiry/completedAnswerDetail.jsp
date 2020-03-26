<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.web.admin.inquiry.model.vo.InquiryAnswer"%>

<%
	InquiryAnswer ia = (InquiryAnswer)request.getAttribute("ia");	
%>
	
<style>
.back {
	width: 80%;
	position: relative;
	left: 10%;
	display: flex;
}

/*고객센터Home , 공지사항 등 */
.aside {
	width: 20%;
	height: 100%;
	line-height: 130%;
}

.aside2 {
	width: 8%;
	height: 100%;
	line-height: 130%;
}

/*고객센터 목록 앞에보이는 것*/
.lnb_list a {
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

#one2 {
	width: 100%;
	text-align: left;
	color: rgb(97, 96, 96);
	font-size: 15px;
}

/* 전화문의 운영시간 */
#call {
	text-align: center;
	color: rgb(138, 136, 136);
	font-weight: bolder;
	font-size: 15px;
	background: rgb(245, 245, 245);
	padding: 10px;
	position: relative;
	top: 50px;
}

table#tbl-detail {
	width: 800px;
	height: 200px;
	margin: 0 auto;
	border-collapse: collapse;
	clear: both;
}

table#tbl-detail th {
	width: 125px;
	border: 1px solid #e2e0e0;
	padding: 5px 0;
	text-align: center;
	background-color: rgb(245, 245, 245);
}

table#tbl-detail td {
	border: 1px solid #e2e0e0;
	padding: 5px 0 5px 10px;
	text-align: left;
}

 /* 나가기버튼 */
#back-btn{
        height: 35px;
        width: 100px;
        border: solid 1px rgb(147, 147, 194);
        background: white;
        border-radius: 5px;
        font-size: 15px;
        color: rgb(134, 134, 133);
        margin-right: 5px;
        position:relative;
        top:20px;
        left:350px;
    }

    #back-btn:hover{
        background:rgb(251, 251, 249);
        outline: none;
    } 
}

</style>

<%@ include file="/views/client/common/header.jsp"%>


<section class="back">

	<!-- HOME // CONTACT -->

	<div class="aside">
		<h5 style='line-height: 400%'>&nbsp&nbsp HOME // MyPage</h5>
		<h2 style='line-height: 300%'>&nbsp&nbsp마이페이지</h2>

		<ul class="lnb_list">
			<li><a href="">주문/배송 조회</a></li>
			</br>
			<li><a href="찜목록조회.html">찜 목록 조회</a></li>
			</br>
			<li><a href=>반품/환불</a></li>
			</br>
			<li><a href="<%=request.getContextPath()%>/MyInquiryWrite">1:1문의</a></li>
			<br />
			<li><a href="<%=request.getContextPath() %>/myInquiryList"
				style="color: rgb(23, 7, 248); font-weight: bold;">문의내역</a></li>
			<br>
			<li><a href="">쿠폰관리</a></li>
			</br>
			<li><a href="">포인트관리</a></li>
			</br>
			<li><a href="회원정보1.html">회원정보수정</a></li>
			</br>
			<li><a href="회원탈퇴.html">회원탈퇴</a></li>
			</br>
		</ul>
	</div>

	<!-- aside2 목록과붙어있는공간띄우기-->
	<div class="aside2"></div>

	<div class="backDiv">
		<br>
		<br>
		<h1 id="one">문의내역</h1>
		<hr id="line1">
		<br>
		<br>
		<div id="detailBack">

			<div>
				<h1 id="one2">문의하신 내용의 답변입니다.</h1>
			</div>
			<br>

			<table id="tbl-detail">
				<tr>
					<th>제목</th>
				 	<td><%=ia.getIa_Title()%></td>
				</tr>
				 <tr>
					<th>내용</th>
					 <td><%=ia.getIa_Content() %></td> 
				</tr> 
				
				<tr>
					<th>첨부파일</th>
					 <td>
						<%if(ia.getIa_Original_Filename()!=null){ %> 
						<a href="<%=request.getContextPath() %>/answerFileDownLoad?filePath=<%=ia.getIa_Renamed_Filename()%>">
						<img src="<%=request.getContextPath()%>/images/common/file.png" width="16px;"/>
						<span><%=ia.getIa_Original_Filename()%></span> 		
						</a><%} %>
					</td>
				</tr>
									
			</table>
					<input type="button" id="back-btn" value="나가기" onclick="fn_out();"> 


			<div id="callArea">
				<p id="call">전화문의 1577-3822 | 운영시간 평일 9:00~18:00</p>
			</div>

		</div>
		
	<script>
		function fn_out(){
			location.replace("<%=request.getContextPath()%>/myInquiryList");
		}
	
	
	</script>
</section>
<br>
<br>
<br>

<%@ include file="/views/client/common/footer.jsp"%>