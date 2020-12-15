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
        }
        /*회원탈퇴 유의사항*/
        .out-bg{
            background: #e7ebef;
            margin: 20px 0 0 0;
            border: 1px solid #c0c9ce;
            padding: 20px !important;
        }
        /*회원탈퇴 안내 체크박스 */
        .checkbox-inline {
        display: inline-block;
        padding-left: 20px;
        margin-bottom: 0;
        vertical-align: middle;
        font-weight: 400;
        cursor: pointer;
        font-size: 14px;
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
            <h5 style='line-height:400%'>&nbsp&nbsp HOME //</h5>
            <h2 style='line-height:300%'>&nbsp&nbsp마이페이지</h2>

            <ul class="lnb_list">
                <li><a href="<%=request.getContextPath()%>/orderDelivery">주문/배송 조회</a></li><br />
                <li><a href="#">찜 목록 조회</a></li><br />
                <li><a href="">반품/환불</a></li><br />
                <li><a href="<%=request.getContextPath()%>/MyInquiryWrite">1:1상담</a></li><br />
                <li><a href="<%=request.getContextPath()%>/myInquiryList?mNo=<%=loginMember.getM_No() %>">상담내역</a></li><br>               
                <li><a href="">쿠폰관리</a></li><br />
                <li><a href="">포인트관리</a></li><br />
                <li><a href="<%=request.getContextPath()%>/profile2">회원정보수정</a></li><br />
                <li><a href="<%=request.getContextPath()%>/mmbrswthdr2"style="color:#0E0E0E; font-weight: bold;">회원탈퇴</a></li><br />
            </ul>
        </div>
        <!-- aside2 목록과붙어있는공간띄우기-->
        <div class="aside2"></div>



        <div class="faqmiddle">

            <table style="width:100%; padding-top: 65px;">
                <tr>
                    <td colspan=2 style="font-weight:bolder; font-size: 25px; border-bottom: 1px solid rgb(23, 7, 248);">
                        회원탈퇴</td>
                </tr>
            </table>
            <table style="width: 100%;">
            <p style="padding: 70px 0px 9px;">회원님 굿굿즈 서비스를 이용하시는데 불편함이 있으셨나요?</p>
            <p style="color: #979898;font-size: 12px;">1) 굿굿즈에서 발송하는 메일 수신거부는 '마이페이지 > 회원정보조회'에서 확인하세요.<br>
                2) 이용 불편 및 각종 문의 사항은 고객센터로 문의 주시면 성심 성의껏 답변 드리겠습니다.<br>
                - 자주 묻는 질문 / 1:1 온라인 문의 / 전화 문의: 1544-0000 (평일 오전 9시 ~ 오후 6시)

            </p>
        </table>
            <div class="out-bg" style="margin-top: 40px !important;">
                <h5>회원탈퇴 전, 유의사항을 확인해 주시기 바랍니다. </h5>
                <ol style="font-size: 12px;padding: 15px;">
                    <li>회원탈퇴 시 회원전용 웹 서비스를 이용이 불가합니다.</li>
                    <li>거래정보가 있는 경우, 전자상거래 등에서의 소비자 보호에 관한 기록, 대금결제 및 재화 등의 공급에 관한<br>
                        기록은 5년동안 보존됩니다.</li>
                    <li>회원탈퇴 후 굿굿즈 서비스에 입력하신 상품문의 및 후기, 댓글은 삭제되지 않으며, 회원정보 삭제로 인해<br> 
                        작성자 본인을 확인할 수 없어 편짐 및 삭제처리가 원천적으로 불가능 합니다.</li>
                    <li>상품문의 및 후기, 댓글 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.</li>
                </ol>
            </div>
            <label class="checkbox-inline">
                <input type="checkbox" id="agree"name="agree">
                상기 회원탈퇴 시 처리사항 안내를 확인하였음에 동의합니다.
            </label>
            <div style="margin-top: 50px !important;"></div>
            <div style="text-align: center;font-size: 12px; color: #979898;">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 확인합니다.
            <form action="<%=request.getContextPath() %>/mmbrswthdr" onsubmit="return delChk();" method="post" style="padding: 10px 0px 10px;">
            	<input type="hidden" name="em" value="<%=loginMember.getM_Email()%>"> 
                <input type="password" style="width: 180px;height: 40px;"placeholder=" 패스워드입력" name="password">   
                <button type="submit" style="width: 100px;height: 40px; border-radius: 5px;background: #313030;color: rgb(233, 233, 229);">
                		확인
                </button>
            </form>
        </div>
        </div>

    </section>
	
	<script>
	function delChk(){
		
		const agree = $('#agree');
		if(agree.is(":checked") == true){
			if(confirm('정말 탈퇴하시겠습니까?')){
				return true;
			}else{
				return false;
			}
		}else{
			alert("체크 박스에 동의해주세요");
			return false;
		}
		
	};
	
	</script>


<%@ include file="/views/client/common/footer.jsp" %>