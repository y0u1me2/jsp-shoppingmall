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
	<p>결제가 완료되었습니다.</p>
	</br>
	<p>주문내역을 확인하시겠습니까?</p>
	</div>
	<div>
	<button id="btn1"><a href="<%=request.getContextPath() %>/orderDelivery"
						style="text-decoration:none;">주문내역</button>
	<button id="btn2"><a href="<%=request.getContextPath() %>/index.jsp"
						style="text-decoration:none;">메인페이지</a></button>
	</div>
	</div>
</section>
<%@ include file="/views/client/common/footer.jsp" %>
