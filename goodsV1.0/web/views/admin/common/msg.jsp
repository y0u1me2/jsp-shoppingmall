<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	/* 서버에서 보낸 메세지 변수로 선언  */
    	String msg = (String)request.getAttribute("msg");
    	String loc = (String)request.getAttribute("loc");
    	String script = (String)request.getAttribute("script");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 서버에서 보낸 메세지 띄워주기 -->
	<script>
		/* ''나 ""를 안해주면 출력을 안하고 변수를 찾게됨 */
		alert('<%=msg%>');
		
		/* script가 null이 아니면 실행하고 아니면 공란으로 둬라 */
		<%-- <%=request.getAttribute("script")!=null?request.getAttribute("script"):" " %> --%>
		<%=script!=null?script:" " %>
		
		location.replace("<%=request.getContextPath()%><%=loc%>");
	</script>
	
</body>
</html>