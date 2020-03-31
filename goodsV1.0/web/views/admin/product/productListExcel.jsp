<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.web.product.model.vo.Product"%>
<%

List<Product> list = (List) request.getAttribute("list");

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

<table class="box">
					<tr style="background-color: rgb(245, 245, 245); height: 40px;">
						<td><input type="checkbox" name="allCheck"></td>
						<td>번호</td>
						<td>카테고리</td>
						<td>이미지</td>
						<td>상품명</td>
						<td>상품가격</td>

					</tr>

					<%
							if (list.isEmpty()) {
						%>
					<tr>
						<td id="conbox" colspan='6'>상품 내역이 존재 하지 않습니다.</td>
					</tr>
					<%
							} else {
						%>
					
						<%
							for (Product p : list) {
								if (p.getpStatus().equals("Y")) {				
						%>
					<tr>
						<td><input type="checkbox" class="prowCheck" name="pRowCheck" 
							value="<%=p.getpNo()%>"></td>

						<td><%=p.getpNo()%></td>

						<td><%=p.getpCategory()%></td>

						<td><img
							src="<%=request.getContextPath()%>/images/product/thumbnail/<%=p.getpThumbnail() %>"
							width="40px" alt="이미지 없음"></td>

						<td><%=p.getpName()%></td>

						<td><%=p.getpPrice()%></td>
					
						</form>
					</tr>
					<%
								}
							}
							}
						%>
				</table>











</body>
</html>