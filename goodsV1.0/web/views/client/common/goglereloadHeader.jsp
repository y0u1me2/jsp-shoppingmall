<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.web.member.model.vo.Member"%>
<%
	int loginCount =  (int)session.getAttribute("loginCount");//로그인 세션
	Member loginedMember = (Member)session.getAttribute("loginedMember");//로그인 세션
%>
    
    
							<div class="container">
				<ul class="right-top">
					<li>
						<button type="button"><a href="<%=request.getContextPath() %>/notice/noticeList"
						style="text-decoration:none;">공지사항</a></button>
					</li>
					<li>
						<button type="button"><a href="<%=request.getContextPath() %>/schome"
						style="text-decoration:none;">고객센터</a></button>
					</li>
					<li>
						<button type="button">주문/배송</button>
					</li>
					<li>
						<button type="button">장바구니</button>
					</li>
					<%
						if (loginCount==0) {
					%>
					<li>
						<button type="button" onclick="openEnroll()">회원가입</button>
					</li>
					<li>
						<button type="button" onclick="openLogin()">로그인</button>
					</li>
				</ul>
			</div>
		</div>
		<%
			} else {
		%>
		<li>
			<div class="dropdown" id="memberName">
				<div class="dropdown-scope">
					<button type="button">
						<h4><%=loginedMember.getM_NickName()%>
							님
						</h4>
					</button>
				</div>
				<div id="infomation">
					<ul>
						<li>
						<button type="button">
						<a href="<%=request.getContextPath()%>/orderDelivery">마이페이지</a>
						</button></li>
						<li>
							<button type="button">
								<a href="<%=request.getContextPath()%>/myReviewList">나의 리뷰</a>
							</button>
						</li>
						<li>
							<button type="button">
								<a onclick="signOut();" href="<%=request.getContextPath()%>/logout.do">로그아웃</a>
							</button>
						</li>
					</ul>
				</div>
			</div>
		</li>
		</ul>
		</div>


		<%
			}
		%>
		    <script src="<%=request.getContextPath()%>/js/headerScript.js" charset="utf-8"></script>