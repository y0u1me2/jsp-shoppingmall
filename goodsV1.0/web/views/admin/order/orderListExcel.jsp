<%@page import="com.web.admin.order.model.vo.OrderList"%>
<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%

List<OrderList> list = (List) request.getAttribute("list");
int totalPrice=(int)request.getAttribute("total");

response.setHeader("Content-Disposition","attachment;filename=productList.xls");
response.setHeader("Content-Description", "JSP Generated Data");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <table border="1" style="width: 875px;" class="tbodyCenter">
                        <col style="width:50px;">
                        <col style="width:auto;">
                        <col style="width:100px;">
                        <col style="width:100px;">
                        <col style="width:100px;">
						<col style="width:80px;">
                        <thead>
                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">상품정보</th>
                                <th scope="col">가격/수량</th>
                                <th scope="col">구매자</th>
                                <th scope="col">결제날짜</th>
                                <th scope="col">배송현황</th>
                            </tr>
                        </thead>
                       
                        <tbody>     
                        	   <%if(list.size()==0){ %> 
                        	   <tr>
	                        		<td id="conbox" colspan='8'>
	                        			<p style="padding:30px 0; margin:0;">검색된 회원 내역이 없습니다.</p>
	                        		</td>
	                        	</tr>
	                        	<%}else {
	                        		for(OrderList ol : list) {%>         
	                        	<tr id="centerInfo">
	                        		<td><%=ol.getoNo() %></td>
	                        		<td>
	                        			<img src="<%=request.getContextPath()%>/upload/custom/<%=ol.getCfileName()%>" width="50px" height="50px"/>
	                        			<%=ol.getpName() %> <%=ol.getcColor() %>
	                        		</td>
	                        		<td><%=ol.gettPrice()*ol.getoQuan() %>원</br><%=ol.getoQuan() %>개</td>
	                        		<td><%=ol.getoName() %></td>
	                        		<td><%=ol.getoDate() %></td>
	                        		<td>배송중</td>
	                        	</tr>	                   
	                        	 <%}
	                        		} %>
	                        	<%if(list.size()!=0){ %> 
	                        	 	<tr>
	                        	 		<td colspan="6" style="text-align:right">총매출 <%=totalPrice%>원</td>
	                        	 	</tr>
	                        	<%}%>
                        </tbody>
                       
                    </table>





</body>
</html>