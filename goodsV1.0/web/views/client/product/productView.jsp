<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.LinkedHashMap, com.web.product.model.vo.Product, com.web.product.model.vo.ProductImage" %>
<%@ include file="/views/client/common/header.jsp" %>

<%
	Product p = (Product)request.getAttribute("product");
	LinkedHashMap<String, String> images = (LinkedHashMap<String, String>)request.getAttribute("images");
%>
    <style>
 
    /* 전체 화면 배경 색상 */
     section{
     	margin-top:10px;
        background: rgb(251, 251, 249);
        display: flex;
    }
        
    /* -------------------------------------------------상품이미지 컨테이너(화면 왼쪽 부분) ----------------------------------------------------*/
    #img-container{
         border: 1px solid black;
         width: 50%;
         height: 680px;
    }
	
	
	
	/* ---------------------------------------------------옵션 선택 화면(오른쪽 부분)---------------------------------------------------------*/
    #content-container{
        width: 50%;
        height: auto;
        border: 1px solid black;
        position: relative;
    }
	
	
	
	/* --------------------------상품 설명 텍스트 부분----------------------------*/
	div#product-info{
	
	}
	
	/* 상품명 텍스트 */
    #product_name{
        font-size: 30px; 
        font-weight: bold; 
        color: rgb(131, 130, 130);
        padding :30px 0;
    }

    /* 상품가격 텍스트 */
    #product_price{
        font-size: 20px; 
        font-weight: bolder;
        color: rgb(63, 61, 61);  
    }
	
    
    
    /* ------------------------ 색상 선택 버튼 영역 ------------------------------*/
    div#radio-btn-container{
    	display:flex; 
    	justify-content: space-around; 
    	padding: 50px 0;
    }
	/* 색상 라디오 버튼이랑 텍스트 묶은 div */
	div.radio-div{
		margin:0px 10px; 
		text-align:center;
	}
	
	/* 라디오 버튼  공통 스타일(동그라미 모양) */
	input[type="radio"]{
		 width:40px;
	     height:40px;
	     border-radius:50%;
	     -webkit-appearance:none;
	     outline:none;
    }
    
     /* 라디오 버튼 클릭했을 때 공통 스타일 */
    input[type="radio"]:checked{
    	/*border: 2px solid rgb(131, 130, 130);*/
    	border: 2px solid pink;
    }
    
    /* 빨강색 버튼 클릭했을때 테두리 색깔 파란색 */
    input[type="radio"]#블랙:checked{
    
    }
	
	/* 라디오 버튼 밑에 써있는 텍스트 */
	div.radio-div label{
        font-size: 12px; 
        font-weight: bold; 
        color: rgb(138, 135, 135);
    }

    /* 흰색 버튼 */
    input[type="radio"]#화이트{
         background:white;   
     }
	
	

    /* 검정색  버튼*/
    input[type="radio"]#블랙{
         background:black;
    }
    
    

    /* 분홍색 버튼 */
    input[type="radio"]#핑크{
        background:palevioletred; 
    }
             

    /* 초록색 버튼 */
    input[type="radio"]#그린{
         background:rgb(143, 245, 202);
    }
        

     /* 파란색 버튼 */
    input[type="radio"]#블루{
         background:rgb(138, 226, 241);
    }
    
    
     /* 노랑색 버튼 */
    input[type="radio"]#옐로우{
         background:yellow;
    }
    
     /* 빨강색 버튼 */
    input[type="radio"]#레드{
         background:red;
    }
    
     
    
     /* 네이비색 버튼 */
    input[type="radio"]#네이비{
         background:navy;
    }
    
     /* 보라색 버튼 */
    input[type="radio"]#퍼플{
         background:purple;
    }
   
    

    
    /* 만들기 버튼 */
    .make-btn{
         height: 40px;
         width: 200px;
         background: #313030;
         border-radius: 7px;
         border: 0;
         font-size: 15px;
         color: rgb(233, 233, 229);
         
     }
     .make-btn:hover{
         background: black;
         outline: none;
     }

     

    

    /* ------------------------------- 배송정보 텍스트 영역 --------------------------------------*/
    
    #delivery-info{
    	position:absolute; 
    	bottom: 0; 
    	width:100%;
    }
    
    
    /* 텍스트 스타일 */
    #delivery-info table td{
        font-size: 15px; 
        font-weight: bold; 
        color: rgb(138, 135, 135);
    }

</style>



<section>

<!-- 상품 이미지(왼쪽 화면) -->
<div id="img-container">
	<img style="width:100%;" src="" alt="이미지 없음">
</div>



<div id="content-container">
    
        <div id="product-info">
            <p id="product_name"><span><%=p.getpName() %></span></p>
            <p id="product_price">가격: <%=p.getpPrice() %>원</p>          
        </div>
        

    
    
    
    
    
        <div class="color-select" style="text-align:center; border:1px solid black; position:relative; top:50px; margin-bottom:50px;">
        	<p style="font-size:20px;  font-weight: bold; ">색상 선택</p>
    		
    		<form action="<%=request.getContextPath() %>/product/custom" method="post" onsubmit="return invalid();">
    			<input type="hidden" name="pNo" value="<%=p.getpNo()%>">
    			<input type="hidden" name="mNo" value="<%=loginMember!=null?loginMember.getM_No():""%>">
    			<input type="hidden" id="imgFile" name="imgFile" value="">
    			
				    		
    			<div id="radio-btn-container">
    			
    				<%for(String key : images.keySet() ){ %>
    					<div class="radio-div">
    						<input type="hidden" value="<%=images.get(key)%>">
		                    <input id="<%=key %>" type="radio" name="colorType" value="<%=key %>" style="display: block;">
	                        <label for="<%=key %>"><span class="label" style="display: block;"><%=key %></span></label>
	               		</div>
    		        <%} %>
    			
	                
                </div>
		    	<button class="make-btn">만들기</button>
		 	</form>
        </div>


   
   
   <div id="delivery-info">
		<table>
			<tr>
				<td style="width:30%;">사이즈</td>
				<td>2.8cm x 3.8cm</td>
			</tr>
			
			<tr>
				<td>배송안내</td>
				<td>제작 1~2일 및 택배배송 1~2일 소요</td>
			</tr>
			
			<tr>
				<td>배송비</td>
				<td>2,500원(5만원 이상 주문시 무료)</td>
			</tr>
			
		</table>
   </div>

</div>




<script>
	function invalid(){
		if($(':radio[name="colorType"]:checked').length < 1){
			alert('색상을 선택하세요');
			return false;
		}
		return true;
	}

	$(function(){
		//처음 페이지 로딩됐을 때 모든 라디오 버튼 선택 해제
		$('input[type=radio]').each(function(){
			$(this).prop("checked", false);
		});
		
		//첫번째 색상을 임의로 이미지 컨테이너에 띄워줌
		var firstRadio = $('.radio-div:first input[type=radio]');
		$('#img-container img').attr('src', '<%=request.getContextPath()%>/images/product/'+firstRadio.prev().val());
		
		//라디오 버튼 누를때마다 이미지 컨테이너에 보여지는 이미지 바꿔주고, 인풋 태그에 해당 파일명 넣어주기 
		$('.radio-div input').click(function(){
			var file = $(this).prev().val();
			$('#img-container img').attr('src', '<%=request.getContextPath()%>/images/product/'+file);
			$('#imgFile').val(file);
		})
	})

</script>

</section>
<br><br><br><br>

<%@ include file="/views/client/common/footer.jsp" %>
