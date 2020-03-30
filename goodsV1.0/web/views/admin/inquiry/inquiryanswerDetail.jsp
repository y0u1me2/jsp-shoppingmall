<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.web.inquiry.model.vo.Inquiry"%>

<%
	Inquiry i = (Inquiry)request.getAttribute("i");
%>

<style>

div.content-wrapper{
	background-color:white;
	position: relative;
	left: 100px;
}

div.goodsback{
	width:80%;
	height:auto;
	position: relative;
	top:100px;
}

* {
	margin: 0;
}

body {
	width: 1366px;
	height: auto;
}


/* 1:1문의 텍스트 */
h1#title {
	font-weight: bolder;
	font-size: 30px;
	position: relative;
	top: 10px;
	;
}

/*제목 밑에 라인 */
hr#line1 {
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

 /* 답변하기 버튼 */
#update-btn{
        height: 35px;
        width: 100px;
        border: solid 1px rgb(147, 147, 194);
        background: white;
        border-radius: 5px;
        font-size: 15px;
        color: rgb(134, 134, 133);
        margin-right: 5px;
        position:relative;
        top:-2px;
    }

    .back-btn:hover{
        background:rgb(251, 251, 249);
        outline: none;
    } 
    
    a span{
    	text-decoration: none;
        color: rgb(95, 93, 93);
    }
    


</style>
	
<%@ include file="/views/admin/common/header.jsp" %>



 <div class="content-wrapper">

		<br><br>
		<div class="goodsback">
		<h1 id="title">문의내역</h1>
		<hr id="line1">
		<br>
		<br>
		<div id="detailBack">

			<input type="hidden" name="no" value="<%=i.getI_No() %>"/>
			<div>
				<h1 id="title2">고객님의 문의 내용입니다.</h1>
			</div>
			<br>

			<table id="tbl-detail">
				<tr>
					<th>제목</th>
					<td><%=i.getI_Title()%></td>
				</tr>
				<tr>
					<th>문의유형</th>
					<td><%=i.getI_Type() %></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><%=i.getI_Phone() %></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<%if(i.getI_Original_Filename()!=null){ %> 
						<a href="<%=request.getContextPath()%>/admin/answerDetailFileDownLoad?filePath=<%=i.getI_Renamed_Filename()%>">
							<img src="<%=request.getContextPath()%>/images/common/file.png" width="25px;" />
								<span><%=i.getI_Original_Filename()%></span> 
						</a>
						<%} %>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><%=i.getI_Content() %></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center"><input
						type="button" id="update-btn" value="답변하기" 
						onclick="fn_answer();">
		
					</td>
				</tr>
			</table>
			</div>
		</div>
		
	<script>
	
		//답변하기 버튼을 누르면 답변페이지로 이동한다.
		 function fn_answer(){
			location.replace("<%=request.getContextPath()%>/InquiryAnswerView?ino=<%=i.getI_No()%>");		
		} 
		
	</script>	
		
</div>



<%@ include file="/views/admin/common/footer.jsp" %>