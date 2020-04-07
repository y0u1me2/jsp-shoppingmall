<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/client/common/header.jsp" %>
<style>
	 #payCompleteBox{
        text-align: center;
        position: relative;
        width: 450px;
        height: 200px;
        border: 1px solid rgb(200, 200, 200);
       	margin-top :60px;
       	margin-bottom : 100px;
       	margin-left: 458px;
    }

    #payCompleteBox>div{
        position: relative;
        top: 30px;
    }

    #btn1{
        height: 40px;
         width: 100px;
         background: white;
         border-radius: 7px;
         margin-left: auto;
         margin-right: 10px;
         border: 1px solid gray ;
         font-size: 15px;
         color: gray;
         position: relative;
         left: 2px;
         top: 30px;
         
     }
     #btn1:hover{
         background: rgb(235, 235, 235);
         outline: none;
     }
     #btn2{
         height: 40px;
         width: 100px;
         background: white;
         border-radius: 7px;
         margin-left: auto;
         margin-right: auto;
         border: 1px solid gray ;
         font-size: 15px;
         color: gray;
         position: relative;
         left: 2px;
         top: 30px;
     }
     #btn2:hover{
       	background: rgb(235, 235, 235);
         outline: none;
     }
</style>
<section>
	<div id="payCompleteBox">
	<div>
	<p>결제가 정상적으로 처리되지 않았습니다.</p>
	</br>
	<p>관리자에게 문의해주시기 바랍니다.</p>
	</div>
	<div>
	<button id="btn1"><a href="<%=request.getContextPath() %>/MyInquiryWrite"
						style="text-decoration:none; rgb(233, 233, 229);">1:1문의하기</a></button>
	<button id="btn2"><a href="<%=request.getContextPath() %>/index.jsp"
						style="text-decoration:none;">메인페이지</a></button>
	</div>
	</div>
</section>
<%@ include file="/views/client/common/footer.jsp" %>
