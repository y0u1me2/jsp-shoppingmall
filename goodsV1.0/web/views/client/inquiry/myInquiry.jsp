<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.web.inquiry.model.vo.Inquiry"%>

<%
	List<Inquiry> list = (List)request.getAttribute("list"); 

	/* 원하는  조회기간 별로 출력하기 */
	int cPage = (int)request.getAttribute("cPage");
	String numPer = request.getParameter("numPerPage");
%>
<%@ include file="/views/client/common/header.jsp"%>

<style>

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

/* =================================================================================================== */

/* 섹션 스타일 */
.back {
	width: 80%;
	position: relative;
	left: 10%;
	display: flex;
}

.backDiv {
	width: 100%;
}

/* 1:1상담 텍스트 */
#one {
	font-weight: bolder;
	font-size: 25px;
	position: relative;
	top: 10px;
}

/* 밑에 라인 */
#line1 {
	border: 1px solid rgb(78, 77, 77);
	position: relative;
	top: 20px;
}

/* 1:1문의하기 텍스트 */
#one2 {
	width: 100%;
	text-align: left;
	color: rgb(97, 96, 96);
	font-size: 15px;
}

/* 테이블 스타일 */
.box {
	 border-top: 1px solid #adadad;
	border-bottom: 1px solid #adadad; 
	border-collapse: collapse;
	width: 100%;
	text-align: center;
	height:250px;
}

/* 테이블 선 색상 */
.box>tr {
	border-bottom: 1px solid #e2e0e0;
}

th#th1 {
	background-color: rgb(245, 245, 245);
	height: 40px;
}

#inquiryPeriod {
	display: flex;
	position: relative;
	top: 10px;
}

/* 문의유형 선없음 */
select {
	 border: none; 
}

/* 연락처 선없음 */
#phone {
	border: none;
}

#boardList {
	display: inline-flex;
	flex-wrap: wrap;
	justify-content: flex-start;
}

/* 내용박스 스타일 */
#content {
	width: 100%;
	height: 300px;
	/* border: none; */
}

/* 문의내역 */
#conbox {
	text-align: center;
	height: 300px;
	font-size: 15px;
	position: relative;
	width: 100%;
}

/* 답변 버튼 */
#inquiry-btn {
	position: relative;
	height: 30px;
	width: 80px;
	border: solid 1px rgb(190, 190, 196);
	background: white;
	border-radius: 3px;
	font-size: 15px;
	color: rgb(134, 134, 133);
	margin-right: 5px;
}

#inquiry-btn:hover {
	background: rgb(251, 251, 249);
	outline: none;
}

#pageBar {
	position: relative;
	left:100px;
	top: 20px;
}

div#pageBar a {
	text-decoration:none;
	color: rgb(95, 93, 93);
}

/* 페이지바 */
    #pageBar{
      width:80%;
      margin: 40px 0 40px 0;
      text-align:center;
   }
   #pageBar>a,#pageBar>span{
      width: 40px;
       height: 40px;
       text-align: center;
       line-height: 40px;
       border: 1px solid #eee;
       color: #999;
       background-color: #fff;
       margin: 0 2px;
       position: relative;
       font-size: 13px;
       font-family: "YoonGothicPro760";
       display: inline-block;
       vertical-align: top;
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


</style>

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
			<li><a href="<%=request.getContextPath()%>/MyInquiryView"
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


		<div>
			<h1 id="one2">고객님의 최근 문의 내역입니다.</h1>
			<div id="inquiryPeriod">
				<p>조회기간&nbsp&nbsp&nbsp</p>
				
				<!-- 조회기간 선택하면 데이터 출력 개수가 옵션 값으로 변경되게 만들기 -->
				<form name="numPerPageFrm" id="numPerPageFrm"
				action="<%=request.getContextPath()%>/myInquiryList">
				
				<input type="hidden" name="cPage" value="<%=cPage%>">
				
				<select style="font-size: 16px;" name="numPerPage" id="numPerPage">
					<option value="15" <%=numPer==null || numPer.equals("15")?"selected":"" %>>15개씩</option>
					<option value="10" <%=numPer==null || numPer.equals("10")?"selected":"" %>>10개씩</option>
					<option value="5"  <%=numPer==null || numPer.equals("5")?"selected":"" %>>5개씩</option>					
				</select>
				</form>
			</div>
		</div>		
                
		<br>
		<table class="box">
			<th id="th1">처리상태</th>
			<th id="th1">번호</th>
			<th id="th1">제목</th>
			<th id="th1">문의일</th>

			<%if(list.isEmpty()){ %>
			<tr>
				<td id="conbox" colspan='4'>문의 내용이 존재 하지 않습니다.</td>
			</tr>
			<%}else{ 
			 for(Inquiry i : list) {%>
			
			<tr>			
				<%if(i.getAnswer_status().equals("Y")) { %>
				<td><a style="text-decoration:none;"
					href="<%=request.getContextPath()%>/answerDetail?no=<%=i.getI_No()%>"><button id="inquiry-btn">답변완료
				</a></button>
				</td>
				
				<%}else{ %>
				<td><a style="text-decoration:none;"
					href="<%=request.getContextPath()%>/answerDetail?no=<%=i.getI_No()%>"><button  id="inquiry-btn">확인중
				</a></button></td>
				<%} %>
				
				
				<td><%=i.getI_No() %></td>

				<td><a
					href="<%=request.getContextPath()%>/myInquiryDetail?no=<%=i.getI_No()%>">
						<%=i.getI_Title() %>
				</a></td>

				<td><%=i.getI_Date() %></td>

			</tr>
			<%} 
           	}%>
		</table>

		<div id="pageBar">
			<%=request.getAttribute("pageBar") %>
		</div>




		<div id="callArea">
			<p id="call">전화문의 1577-3822 | 운영시간 평일 9:00~18:00</p>
		</div>

	</div>

	<script>
	//사용자가 조회기간 지정하기
    $("#numPerPage").change(()=>{
        $("#numPerPageFrm").submit();
     });
	
	</script>

</section>
<br>
<br>
<br>

<%@ include file="/views/client/common/footer.jsp"%>