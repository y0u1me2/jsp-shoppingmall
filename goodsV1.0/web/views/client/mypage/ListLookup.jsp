<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/client/common/header.jsp" %>

<style>
       
        /*CONTACT US 고객센터 번호 및 이메일 휴일안내 */
        .goto {
            position: relative;
            bottom: 382px;
            left: 600px;
        }

       
        /*고객센터Home , 공지사항 등 */
        .aside {
            /* border: 1px solid hotpink; */
            width: 20%;
            height: 100%;
            line-height: 130%;
        }

        .aside2 {
            /* border: 1px solid hotpink; */
            width: 8%;
            height: 100%;
            line-height: 130%;
        }

      /*리스트 스타일*/
.lnb_list a {
	padding-top: 3px;
	padding-left: 13px;
	line-height: 25px;
	font-size: 16px;
	color: #949494;
	background: transparent
		url(https://s3-ap-northeast-2.amazonaws.com/redprintingweb.common/2017/img/icon/menu_arrow.svg)
		no-repeat left 6px;
	text-decoration:none;
}
        .senter>li>a{
            text-decoration: none;
            color: black;
        }
        ul{
            list-style:none;
        }
        .faqmiddle {
            width: 80%;
            /* height: 600px; */
            
        }
h2{
color:#5F5D5D;
}
h5{
color:#5F5D5D;
}
/* ======================================================================== */
    /* 섹션 스타일 */
    .back{
        width: 80%;
        position: relative;
        left: 10%;
        display: flex;
    }
    
    .backDiv{
        width:100%;
    }
    </style>
    
    <section class="back">
          <!-- HOME // CONTACT -->

          <div class="aside">
            <h5 style='line-height:400%'>&nbsp&nbsp HOME // CONTACT US</h5>
            <h2 style='line-height:300%'>&nbsp&nbsp마이페이지</h2>

           <ul class="lnb_list">
			<li><a href="<%=request.getContextPath()%>/orderDelivery">주문/배송 조회</a></li>
			<br>
			<li><a href="<%=request.getContextPath()%>/listLookUp"
			style="color:#0E0E0E; font-weight: bold;">찜 목록 조회</a></li>
			<br>
			<li><a href=>반품/환불</a></li>
			<br>
			<li><a href="<%=request.getContextPath()%>/MyInquiryWrite">1:1문의</a></li>
			<br />
			<li><a href="<%=request.getContextPath()%>/myInquiryList?mNo=<%=loginMember.getM_No() %>">1:1문의내역</a></li>
			<br>
			<li><a href="">쿠폰관리</a></li>
			<br>
			<li><a href="">포인트관리</a></li>
			<br>
			<li><a href="<%=request.getContextPath()%>/profile2">회원정보수정</a></li>
			<br>
			<li><a href="<%=request.getContextPath()%>/mmbrswthdr2">회원탈퇴</a></li>
			<br>
		</ul>
        </div>
        <!-- aside2 목록과붙어있는공간띄우기-->
        <div class="aside2"></div>



        <div class="faqmiddle">

            <table style="width:100%; padding-top: 65px;">
                <tr>
                    <td colspan=2 style="font-weight:bolder; font-size: 25px; border-bottom: 1px solid rgb(23, 7, 248);">
                        찜목록 조회</td> 
                </tr>
            </table>
                <div style="margin: 30px 0px;padding-bottom:10px;font-size: 12px;color: #3c3c3c;">
                    찜한 목록에 담긴 상품은 선택하여 바로 손쉽게 주문할 수 있습니다.<br>
                    상품을 선택하여 삭제 버튼을 눌러 삭제 하실 수 있습니다.
                </div>
                <div style="border-bottom: 1px solid #b1acac;"></div>
                <div style="border-bottom: 1px solid #b1acac;padding-top: 50px;"></div>
                <form style="text-align: right;padding-top: 20px;" action="#">
                    <input type="checkbox" value="Y" id="allcheck">
                <span style="font-size: 12px;">전체 선택</span>
                <button style="width: 80px; height: 40px; border-radius: 5px;background: #313030;color: rgb(233, 233, 229);">삭제</button>
                
            </form>
        </div>
               




    </section>



<%@ include file="/views/client/common/footer.jsp" %>