<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<style>
body {
  background-color:#343a40;
  width:100%;
}

* {
  box-sizing: border-box;
}

.wrapper {
	width:30%;
	position: relative;
	left:50%;
  	margin-left:-15%;
}

/* style the container */
.container {
  width:100%;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px 0 30px 0;
  
} 

/* style inputs and link buttons */
input,
.btn {
  width: 100%;
  padding: 12px;
  border: none;
  border-radius: 4px;
  margin: 5px 0;
  opacity: 0.85;
  display: inline-block;
  font-size: 17px;
  line-height: 20px;
  text-decoration: none; /* remove underline from anchors */
}

input:hover,
.btn:hover {
  opacity: 1;
}


/* style the submit button */
input[type=submit] {
  background-color: #343a40;
  color: white;
  cursor: pointer;
}

/* Two-column layout */
.col {
  float: left;
  width: 100%;
  margin: auto;
  padding: 0 50px;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}



</style>
</head>
<body>

<div class="wrapper">
	<img src="<%=request.getContextPath() %>/resources/images/logo_white.png" style="width:100%; height:250px">
	<div class="container">
	  <form action="<%=request.getContextPath() %>/admin/loginCheck" method="post">
	    <div class="row">
	
	      <div class="col">
	        <input type="text" name="userId" placeholder="관리자 아이디" autocomplete="off" required>
	        <input type="password" name="password" placeholder="패스워드" required>
	        <input type="submit" value="Login">
	      </div>
	      
	    </div>
	  </form>
	</div>

</div>

</body>
</html>