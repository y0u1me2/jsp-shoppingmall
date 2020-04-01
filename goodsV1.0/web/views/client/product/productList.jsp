<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, com.web.product.model.vo.Product"%>

<%
	List<Product> list = (List<Product>)request.getAttribute("list");
%>


<%@ include file="/views/client/common/header.jsp" %>

    <style>
     	section{
     		text-align: center;
     	}
     	
        /*  카테고리 구분 타이틀  */
        #category{
            font-size: 27px;
            color: rgb(87, 86, 86);
            margin: 50px 0;
        }

        /* 전체 큰 박스 */
        #outer-container{
        	width:90%;
        	position : relative;
        	left: 5%;
	        display: flex;
	        flex-wrap: wrap;
	        font-size: 20px;
	        font:bold;
	        padding: 0px;
	        text-align: left;
	        margin-bottom: 100px;
        }
		
		.inner-container {
			margin: 50px;
		}
		
		
		/* 썸네일 이미지에 마우스 가져갔을 때 손모양으로 바뀜 */
		.inner-container:hover{
			cursor: pointer
		}
		
		/* 굵은 글씨 */
        .bold {
        	margin-top: 30px;
            color:rgb(107, 105, 105); 
            font-weight: bold;
            font-size: 18px;
        }
		
		/* 일반 글씨 */
		.normal{
			font-size: 13px; 
			color: rgb(110, 109, 109);
		}

    </style>


<section>

<h1 id="category"><%=request.getParameter("category") %></h1>

 	<!-- 전체 컨테이너 -->
	<div id="outer-container" style="border:1px solid black">

		<!-- 썸네일 이미지랑 상품명, 소개글 묶음 박스 -->
		<% for(Product p : list){ %>
		     <div class="inner-container" onclick="location.href='<%=request.getContextPath()%>/product/view?pNo=<%=p.getpNo()%>'">
		     	<img src="<%=request.getContextPath()%>/images/product/<%=p.getpThumbnail() %>" width="300px" height="300px" alt="이미지 없음">
		        <p class="bold"><%=p.getpName() %></p>
		        <p class="normal"><%=p.getpComment() %></p>
		     </div>
	     <%} %>
	
	     
	</div>
</section>



<%@ include file="/views/client/common/footer.jsp" %>