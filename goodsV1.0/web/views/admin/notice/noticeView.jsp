<%@page import="com.web.notice.model.vo.NoticeComment"%>
<%@page import="com.web.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/client/common/header.jsp" %>
<% 
	String[] arr=new String[1];
	arr[0]="첨부파일이 없습니다";
	Notice n=(Notice)request.getAttribute("notice"); 
	if(n.getnOriginalFile()!=null){
		int num=n.getnOriginalFile().lastIndexOf(",");
		String orifile=n.getnOriginalFile().substring(0,num);
		arr=orifile.split(",");
	}
	List<NoticeComment> list=(List)request.getAttribute("list");
%>

<style>
	section.back{
		width: 80%;
    	position: relative;
    	left: 10%;
    	margin-bottom:20px;
	}
	div.top{
		width: 100%;
		margin-bottom:25px;
	}
	#hone{
		font-size: 25px;
    	position: relative;
    	top: 10px;
    	text-align: center;
    	color: rgb(66, 66, 66);
    	font-weight: lighter;
	}
	div.bottom{
		border-top:1px solid black;
		position: relative;
    	padding: 15px 20px;
    	border-bottom: 1px solid #d5d5d5;
	}
	.bottom>h2{
		padding:10px 0 0 30px;
		font-weight:lighter;
		
	}
	/* 공지사항 정보 */
	.info{
		padding-left:30px;
		padding-top: 10px;
    	font-size: 13px;
	}
	.info li:first-child{
		margin-left: 0;
    	padding-left: 0;
	}
	.info li{
		position: relative;
   		display: inline-block;
    	float: left;
    	margin-left: 10px;
    	padding-left: 10px;
    	color: #444;
	}
	.info li.date{
		float:right;
	}
	.info:after{
		content: "";
    	display: block;
    	visibility: hidden;
    	clear: both;
	}
	/* 파일 및 내용 */
	.upfile{
		position: relative;
    	padding: 15px 20px;
    	border-bottom: 1px solid black;
	}
	.upfile>p{
		padding-left:30px;
	}
	.content{
		position: relative;
    	padding: 15px 20px;
    	border-bottom: 1px solid black;
		text-align:left;
		height:300px;
	}
	.context{
		width:80%;
		height:auto;
		line-height:180%;
		padding:10px 0 0 30px;
		word-break:break-all;
	}
	.not-btn{
		display: block;
    	margin: 20px 12px 0 0;
    	text-align: right;
	}
	.not-btn .button:first-child {
    	margin-top: 0;
	}
	.not-btn .button {
    	display: inline;
	}
	/* 댓글 및 대댓글 */
	#comment-container{
		padding:20px 0 0 12px;
		width:100%;
		height:100px;
	}
	#comment-content{
		width:90%;
		height:70px;
		text-align:left;
		padding-top:5px;
	}
	.cm-writer{
		font-weight:bolder;
		font-size:15px;
	}
	#btn-insert{
		width:80px;
		height:70px;
	}
	#nc_container{
		margin-top:10px;
		padding-bottom:10px;
		width:100%;
		height:auto;
	}
	#nc_tbl{
		width:100%;
		border-collapse: collapse;
		
	}
	#nc_tbl tr td:first-of-type{
		padding: 5px 5px 5px 50px;
		border-bottom:1px solid black;
	}
	#nc_tbl tr td:last-of-type{
		text-align:right;
		width: 100px;
		padding-right:12px;
		border-bottom:1px solid black;
	}
	.btn-reply{
		display:none;
	}
	tr:hover button.btn-reply{
		display:inline;
	}
	#nc_tbl .level2 td:first-of-type{
		padding-left:80px
	}
	.reply{
		text-align:right;
		width:100%;
		height:auto;
	}
</style>
<section class="back">
	<div class="back-div top">
		<br><br>
		<h1 id="hone">공지사항</h1>
		<br><br>
	</div>
	<div class="back-div bottom">
		<h2><%=n.getnTitle() %></h2>
		<ul class="info">
			<li class="writer">작성자 <%=n.getnWriter() %></li>
			<li class="readcount">조회수 <%=n.getnReadcount() %></li>
			<li class="date">작성일 <%=n.getnDate() %></li>
		</ul>
	</div>
	<div class="upfile">
		<%if(n.getnOriginalFile()!=null){ %>
        <%for(String s : arr){ %>
        <p>
        <a href="<%=request.getContextPath()%>/notice/noticeFileDownload?fileName=<%=s%>">
        <img src="<%=request.getContextPath()%>/images/notice/file.png" width="15px" height="15px">
        <%=s %>
        </a>
        </p>
         <%} %>
         <%}else{ %>
         <p><%=arr[0] %></p>
         <%} %>
	</div>
	<div class="content">
		<p class="context"><%=n.getnContent() %></p>
	</div>
	<div id="nc_container">
		<table id="nc_tbl">
		<% if(list!=null && !list.isEmpty()){
			for(NoticeComment nc : list){ 
			if(nc.getNcLevel()==1){ %>
			<tr class="level1">
				<td>
					<sup class="cm-writer"><%=nc.getNickName() %></sup>&nbsp&nbsp&nbsp
					<sup><%=nc.getNcDate() %></sup>
					</br>
					<p><%=nc.getNcContent() %></p>
				</td>
				<td>
					<button class="btn-reply" name="commentNo" value="<%=nc.getNcNo()%>">답글</button> 
				</td>
			</tr>
			<%}else if(nc.getNcLevel()==2){ %>
			<tr class="level2" style="background-color:#f7f7f7">
				<td>
					<sup class="cm-writer"><%=nc.getNickName() %></sup>&nbsp&nbsp&nbsp
					<sup><%=nc.getNcDate() %></sup>
					</br>
					<p><%=nc.getNcContent() %></p>
				</td>
				<td>
				</td>
			</tr>
			<%		} 
				}
			}%>
		</table>
	</div>
	<div id="comment-container">
				<form action="<%=request.getContextPath() %>/notice/noticeComment" method="post" onsubmit="return nosubmit();">
					<input type="text" name="commentContent" id="comment-content" />
					<button type="submit" id="btn-insert">댓글등록</button>
					<input type="hidden" name="noticeNo" value="<%=n.getnNo()%>"/>
					<input type="hidden" name="commentWriter" value="<%=loginMember!=null?loginMember.getM_No():""%>"/>
					<input type="hidden" name="commentLevel" value="1"/>
					<input type="hidden" name="commentNo" value="0"/>
				</form>
	</div>
	<p class="not-btn">
		<span class="button small">
			<span class="typeA">
				<button type="button"onclick="goList()">목록</button>
			</span>
		</span>
	</p>
	<script>
	//목록으로이동
	function goList(){
	location.replace("<%=request.getContextPath()%>/notice/noticeList");
	}
	
	//비로그인시 댓글등록 못하게 막아놈
	if(<%=loginMember==null%>){
		$("#btn-insert").prop("disabled",true);
	}else{
		$("#btn-insert").prop("disabled",false);
	}
	
	//비로그인시 로그인하라고 나옴
	$(function(){
		$("input[name=commentContent]").click(function(){
			if(<%=loginMember==null%>){
				alert("로그인후 이용하세요!!")
			}
		})
	});
	
	//대댓글 클릭시 아래뜨게하기
	$(".btn-reply").click(function(){
		if(<%=loginMember!=null%>){
			const tr=$("<tr>").attr("class","reply");
			const td=$("<td>").css({
				"display":"none","text-align":"right"
			}).attr("colspan",2);
			const form=$("<form>").attr({
				"action":"<%=request.getContextPath()%>/notice/noticeComment",
				"method":"post"
			});
			const boardRef=$("<input>").attr({
					"type":"hidden",
					"name": "noticeNo",
					"value":"<%=n.getnNo()%>"
			});
			const writer=$("<input>").attr({
				"type":"hidden",
				"name": "commentWriter",
				"value":"<%=loginMember!=null?loginMember.getM_No():""%>"
			});
			const level=$("<input>").attr({
				"type":"hidden",
				"name": "commentLevel",
				"value":"2"
			});
			const comment=$("<input>").attr({
				"type":"text",
				"name": "commentContent"
			});
			const commentRef=$("<input>").attr({
				"type":"hidden",
				"name": "commentNo",
				"value":$(this).val()
			});
			const btn=$("<button>").attr({
				"type":"submit","class":"btn-insert2"
			}).html("등록");
			
			form.append(boardRef).append(writer).append(level).append(comment).append(commentRef).append(btn);
			td.append(form);
			tr.append(td);
			($(this).parent().parent()).after(tr);
			tr.children("td").slideDown(500);
			$(this).off("click");
		}
	})
	//서밋 안시키기
	function nosubmit(){
		if($("#comment-content").val().length<1){
			return false;
		}else{
			return true;
		}
	}
	
</script>
</section>


<%@ include file="/views/client/common/footer.jsp" %>