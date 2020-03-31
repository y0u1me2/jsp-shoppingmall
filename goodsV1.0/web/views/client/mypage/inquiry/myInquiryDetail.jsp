<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.web.inquiry.model.vo.Inquiry"%>
<%
	Inquiry i = (Inquiry) request.getAttribute("i");
%>

<%@ include file="/views/client/common/header.jsp"%>

<style>

/* 좌측메뉴 */
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

/*리스트 스타일*/
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

section.back {
	width: 80%;
	position: relative;
	left: 10%;
	display: flex;
}

 div.detailback {
	 width: 100%; 
	display: flex;
} 

/* 밑에 라인 */
hr#gline {
	border: 1px solid rgb(177, 174, 174);
	position: relative;
	top: 20px;
	width: 100%;
}

h1#title2 {
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
	height: 300px;
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

#delete-btn {
	height: 40px;
	width: 100px;
	border: solid 1px rgb(147, 147, 194);
	background: white;
	border-radius: 10px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-right: 5px;
	position: relative;
	left: 10px;
}

#delete-btn:hover {
	background: rgb(251, 251, 249);
	outline: none;
}

a img{
	position:relative;
	top:5px;
}

</style>

<section class="back">
	<div class="detailback">

		<div class="aside">
			<h5 style='line-height: 400%'>&nbsp&nbsp HOME // MyPage</h5>
			<h2 style='line-height: 300%'>&nbsp&nbsp마이페이지</h2>

			<ul class="lnb_list">
			<li><a href="<%=request.getContextPath()%>/orderDelivery">주문/배송 조회</a></li>
			<br>
			<li><a href="<%=request.getContextPath()%>/listLookUp">찜 목록 조회</a></li>
			<br>
			<li><a href=>반품/환불</a></li>
			<br>
			<li><a href="<%=request.getContextPath()%>/MyInquiryWrite">1:1문의</a></li>
			<br />
			<li><a href="<%=request.getContextPath()%>/myInquiryList"
			style="color: rgb(23, 7, 248); font-weight: bold;">1:1문의내역</a></li>
			<br>
			<li><a href="">쿠폰관리</a></li>
			<br>
			<li><a href="">포인트관리</a></li>
			<br>
			<li><a href="회원정보1.html">회원정보수정</a></li>
			<br>
			<li><a href="회원탈퇴.html">회원탈퇴</a></li>
			<br>
		</ul>
		</div>

		<!-- aside2 목록과붙어있는공간띄우기-->
		<div class="aside2"></div>


		<br> <br>

		<div id="detailBack">

			<h1 id="title">문의내역</h1>
			<hr id="gline">
			<br>
			<br>


			<div>
				<h1 id="title2">문의하신 내용입니다.</h1>
			</div>
			<br>

			<table id="tbl-detail">
				<tr>
					<th>제목</th>
					<td><%=i.getI_Title()%></td>
				</tr>
				<tr>
					<th>문의유형</th>
					<td><%=i.getI_Type()%></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><%=i.getI_Phone()%></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<%
							if (i.getI_Original_Filename() != null) {
						%> 
						<a href="<%=request.getContextPath()%>/answerDetailFileDownLoad?filePath=<%=i.getI_Renamed_Filename()%>">
						<img src="<%=request.getContextPath()%>/images/common/file.png" width="25px;" />
						<span><%=i.getI_Original_Filename()%></span> 
						</a>
						 <%
						 	}
						 %>
					</td>								
				</tr>
				<tr>
					<th>내용</th>
					<td><%=i.getI_Content()%></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center">			
					<input type="button" id="delete-btn" value="삭제하기" onclick="delete_confirm();">	
			
					</td>
				</tr>
			</table>


			<div id="callArea">
				<p id="call">전화문의 1577-3822 | 운영시간 평일 9:00~18:00</p>
			</div>
		</div>
	</div>
	
	<script>
	function delete_confirm(){
 
        if (confirm('정말 삭제하시겠습니까?')) {
             // 확인 click 글삭제
        	location.replace("<%=request.getContextPath()%>/myInquiryDelete?no=<%=i.getI_No()%>&mNo=<%=loginMember.getM_No()%>");
        } else {
            // 취소 click 글삭제 안하고 다시 리스트 페이지로 이동
        	location.replace("<%=request.getContextPath()%>/myInquiryList?mNo=<%=loginMember.getM_No()%>");
		}
    }

	</script>
</section>
<br>
<br>
<br>


<%@ include file="/views/client/common/footer.jsp"%>