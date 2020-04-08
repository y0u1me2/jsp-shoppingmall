<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/client/common/header.jsp" %>

 <style>
       
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
        
       /*고객센터 목록 앞에보이는 것*/
       .lnb_list a {
    padding-top: 3px;
    padding-left: 13px;
    line-height: 25px;
    font-size: 16px;
    color: #949494;
    background: transparent url(https://s3-ap-northeast-2.amazonaws.com/redprintingweb.common/2017/img/icon/menu_arrow.svg) no-repeat left 6px;
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
        /*회원정보 수정 글씨 센터 맞추기*/
        .sort{
            text-align: center;
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
            <h5 style='line-height:400%'>&nbsp&nbsp HOME // </h5>
            <h2 style='line-height:300%'>&nbsp&nbsp마이페이지</h2>

            <ul class="lnb_list">
                <li><a href="<%=request.getContextPath()%>/orderDelivery">주문/배송 조회</a></li><br />
                <li><a href="#">찜 목록 조회</a></li><br />
                <li><a href=>반품/환불</a></li><br />
                <li><a href="<%=request.getContextPath()%>/MyInquiryWrite">1:1상담</a></li><br />
                <li><a href="<%=request.getContextPath()%>/myInquiryList?mNo=<%=loginMember.getM_No() %>">상담내역</a></li><br>
                <li><a href="">쿠폰관리</a></li><br />
                <li><a href="">포인트관리</a></li><br />
                <li><a href="<%=request.getContextPath()%>/profile2" style="color:#0E0E0E; font-weight: bold;">회원정보수정</a></li><br />
                <li><a href="<%=request.getContextPath()%>/mmbrswthdr2">회원탈퇴</a></li><br />
            </ul>
        </div>
        <!-- aside2 목록과붙어있는공간띄우기-->
        <div class="aside2"></div>



        <div class="faqmiddle">

            <table style="width:100%; padding-top: 65px;">
                <tr>
                    <td colspan=2 style="font-weight:bolder; font-size: 25px; border-bottom: 1px solid rgb(23, 7, 248);">
                        회원정보 수정</td>
                </tr>
               
            </table>
            <div class="sort" style="margin: 30px 150px;padding: 50px; border: 1px solid rgb(221, 210, 210); ;">
               <div style="padding-bottom: 3% ;">비밀번호 확인</div>
               <div style= "border-bottom: 1px solid #979898; padding-top: 10px;"></div><br>
               <div style="font-size: 12px;padding-bottom: 30px; color: #979898;">회원님의 정보를 안전하게 보호하기 위해<br>
                    비밀번호를 다시 한번 확인합니다.
                </div>
                <form action="<%=request.getContextPath() %>/profile" method="post">
                 <input type="hidden" name="editMember" value="<%=loginMember.getM_Email()%>"> 
                <!-- <input type="hidden" name="editMember" value="apdlwl1582@naver.com"> -->
                <input type="password" style="width: 280px;height: 40px;"placeholder=" 패스워드입력" name="password">   
                <button style="width: 100px;height: 40px; border-radius: 5px;background: #313030;color: rgb(233, 233, 229);">확인</button>
            </form>
            </div>
        </div>
               




    </section>


<%@ include file="/views/client/common/footer.jsp" %>