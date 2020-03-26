<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/client/common/header.jsp" %>

<style>
	section.back{
		width: 80%;
    	position: relative;
    	left: 10%;
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
    	border-bottom: 1px solid #d5d5d5;
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
    	margin: 20px 0;
    	text-align: right;
	}
	.not-btn .button:first-child {
    	margin-top: 0;
	}
	.not-btn .button {
    	display: inline;
	}
	
</style>
<section class="back">
	<div class="back-div top">
		<br><br>
		<h1 id="hone">공지사항</h1>
		<br><br>
	</div>
	<div class="back-div bottom">
		<h2>제목</h2>
		<ul class="info">
			<li class="writer">작성자 admin</li>
			<li class="readcount">조회수 10</li>
			<li class="date">작성일 2020-03-21</li>
		</ul>
	</div>
	<div class="upfile">
		<p>errornotzoo.jpg</p>
	</div>
	<div class="content">
		<p class="context">아아아아아
		아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아
		아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아
		아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아
		아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아
		아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아
		</p>
	</div>
	<p class="not-btn">
		<span class="button small">
			<span class="typeA">
				<button type="button" class="list" onclick="goList()">목록</button>
			</span>
		</span>
	</p>
	
</section>

<%@ include file="/views/client/common/footer.jsp" %>