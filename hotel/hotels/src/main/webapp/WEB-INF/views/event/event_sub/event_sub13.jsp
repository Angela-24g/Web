<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <!-- 헤더  -->
<jsp:include page="../../common/common_header.jsp"></jsp:include>
<!-- 헤더끝  -->
<section id="container">
   <form id="form1" name="form1">
       <input type="hidden" id="P_SEQ" name="P_SEQ" value="">
      <input type="hidden" id="SBU_CD" name="SBU_CD" value="">
      <input type="hidden" id="PAGE_SIZE" name="PAGE_SIZE" value="9">
      <input type="hidden" id="PAGE_NO" name="PAGE_NO" value="1">
      
      <input type="hidden" id="EVT_TYPE" name="EVT_TYPE" value="EVENT">
      <input type="hidden" id="ORDER_COLUMN" name="ORDER_COLUMN" value="1">
   </form>

   <div class="eventViewWrap innerBox">
      <h1>EVENTS</h1>
      <div class="viewBox">
         <h2>LAVENDER HEALING & FLOWERY SPA</h2>
         
            <p class="img"></p><p><img alt="null" src="/images/event/lavender.jpg"></p>
<p></p>
         

         <div class="cont">
            <p class="text">5월엔 여기를 보라보라! 보랏빛 향기 품은 라벤더 힐링 봄 꽃 스파</p>
            <p class="date">2021.05.01(토) ~ 2021.07.15(목)</p>
            <div class="share">
            <ul class="uls">
            <li class="icon1"><a href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fwww.busanparadisehotel.co.kr"><img alt="" src="/images/event/facebook.png"></a></li>
            <li class="icon2"><a href=https://twitter.com/hashtag/%ED%8C%8C%EB%9D%BC%EB%8B%A4%EC%9D%B4%EC%8A%A4%ED%98%B8%ED%85%94%EB%B6%80%EC%82%B0?lang=ko"><img alt="" src="/images/event/twitter.png"></a></li>
          
         </ul>
            <button></button>
            <button></button>
             <!--   <a href="#sharePop1" class="btnShare" onclick="javascript:setShareUrl();layerPopOpen('#sharePop1');">공유하기</a> -->
            </div>
            <div class="btnGroup"></div>
         </div>
         <div class="viewBtnGroup">
            <a href="/event/eventView?SBU_CD=&P_SEQ=12&PAGE_SIZE=9&PAGE_NO=1&ORDER_COLUMN=1" class="btnPrev"><span>이전 글로</span></a>
            <a href="/event" class="btnList">목록으로</a>   <!-- href: javascript:jsList() -->
            <a href="/event/eventView?SBU_CD=&P_SEQ=14&PAGE_SIZE=9&PAGE_NO=1&ORDER_COLUMN=1" class="btnNext"><span>다음 글로</span></a>
         </div>

         

      </div>
   </div>
</section>

<!-- 푸터  -->
<jsp:include page="../../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->