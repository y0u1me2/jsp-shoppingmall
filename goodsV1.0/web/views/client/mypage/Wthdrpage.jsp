<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/client/common/header.jsp" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원탈퇴완료화면</title>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<style>
    .scstyle {
        position: relative;
        height: 90%;
        top: 1px;
        bottom: 100px;
    }
    .box{
        text-align: center;
        position: relative;
        top: 150px;
        left: 400px;
        width: 600px;
        height: 300px;
        border: 1px solid rgb(200, 200, 200);
    }

    .box>div{
        position: relative;
        top: 100px;
    }

    #btn1{
         height: 40px;
         width: 150px;
         border-radius: 7px;
         margin-left: auto;
         margin-right: auto;
         border: 0;
         font-size: 15px;
		color: #B8B8B8;
         position: relative;
         left: 2px;
         top: 60px;
     }
     #btn1:hover{
         outline: none;
     }
	.iBtn1{
    	cursor:pointer;
    	}
    .iBtn1:hover{
         background-color:#747474;
         color:white;
     }
</style>

<section class="scstyle">




<div class="box">
    <div>
<p>탈퇴 완료되었습니다.</p>
<p>그동안 굿굿즈를 이용해주셔서 감사합니다.</p>
<button id="btn1" class="iBtn1" style="background-color: #eee;color: #989898;"><a href="<%=request.getContextPath()%>/">메인화면 이동</a></button>
</div>

</div>
</section>

<%@ include file="/views/client/common/footer.jsp" %>