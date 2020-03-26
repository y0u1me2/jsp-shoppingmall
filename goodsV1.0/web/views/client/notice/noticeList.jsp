<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/client/common/header.jsp" %>

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
	.td1,.td3{
		text-align:center;
	}
	.td2{
		text-align:left;
		padding-left:50px;
	}
	#pageBar{
		margin: 40px 0 40px 0;
	}
	#pageBar>a,#spanBar{
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
	#pageBar{
		text-align:center;
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
			<col width="70%">
			<col width="15%">
		</colgroup>
            <tr id="trstyle">
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
            </tr>
            <tr class="trst">
                <td class="td1">번호</td>
                <td class="td2">제목</td>
                <td class="td3">작성일</td>
            </tr>
            <tr class="trst">
                <td class="td1">번호</td>
                <td class="td2">제목</td>
                <td class="td3">작성일</td>
            </tr>
            <tr class="trst">
                <td class="td1">번호</td>
                <td class="td2">제목</td>
                <td class="td3">작성일</td>
            </tr>
            <tr class="trst">
                <td class="td1">번호</td>
                <td class="td2">제목</td>
                <td class="td3">작성일</td>
            </tr>
            <tr class="trst">
                <td class="td1">번호</td>
                <td class="td2">제목</td>
                <td class="td3">작성일</td>
            </tr>
            <tr class="trst">
                <td class="td1">번호</td>
                <td class="td2">제목</td>
                <td class="td3">작성일</td>
            </tr>
        </table>
	</div>
	<div id="pageBar">
		<a href="#"><</a>
		<a href="#">1</a>
		<a href="#">1</a>
		<a href="#">1</a>
		<a href="#">1</a>
		<a href="#">1</a>
		<a href="#">></a>
	</div>
</section>


<%@ include file="/views/client/common/footer.jsp" %>