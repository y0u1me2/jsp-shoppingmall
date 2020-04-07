<%@page import="com.web.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/client/common/header.jsp" %>
<% List<Notice> list=(List)request.getAttribute("list"); %>

<style>
	section.back{
		width: 80%;
    	position: relative;
    	left: 10%;
	}
	.back-div{
		width:100%;
		margin-bottom:25px;
	}
	.bottom{
		border-top:1px solid black;
	}
	#hone{
		font-size: 25px;
    	position: relative;
    	top: 10px;
    	text-align: center;
    	color: rgb(66, 66, 66);
    	font-weight: lighter;
	}
	table#tbl-notice{
		border-top: 1px solid black;
    	border-collapse: collapse;
    	width: 100%;
    	border-top:1px solid #e2e0e0; 
    	padding: 5px 0; 
    	} 
	#trstyle{
		height:50px;
		border-bottom:1px solid #eee;
		text-align:center;
	}
	.trst{
		height:50px;
		border-bottom:1px solid #eee;
		font-size:13px;
	}
	.td1{
		text-align:center;
	}
	.td2{
		text-align:left;
		padding-left:50px;
	}
	#pageBar{
		width:100%;
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
	 #pageBar>span.cPage{
    	border: 1px solid #191919;
    	color: #191919;
    }
</style>
<section class="back">
	<div class="back-div top">
		<br>
		<h1 id="hone">공지사항</h1>
		<br>
	</div>
	<div class="back-div bottom">
		<table id="tbl-notice">
		<colgroup>
			<col width="15%">
			<col width="60%">
			<col width="5%">
			<col width="15%">
			
		</colgroup>
			<thead>
            <tr id="trstyle">
                <th>번호</th>
                <th>제목</th>
                <th>조회수</th>
                <th>작성일</th>
            </tr>
            </thead>
            <tbody>
            <%for(Notice n: list) {%>
            <tr class="trst">
                <td class="td1"><%=n.getnNo() %></td>
                <td class="td2">
                	<a style="text-decoration:underline" href="<%=request.getContextPath()%>/notice/noticeView?nNo=<%=n.getnNo()%>">
                	<%=n.getnTitle() %>
                	</a>
                </td>
                <td class="td1"><%=n.getnReadcount() %></td>
                <td class="td1"><%=n.getnDate() %></td>
            </tr>
            <%} %>
            </tbody>
        </table>
	</div>
	<div id="pageBar">
		<%=request.getAttribute("pageBar") %>
	</div>
</section>


<%@ include file="/views/client/common/footer.jsp" %>