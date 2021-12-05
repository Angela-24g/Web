<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 헤더  -->
<jsp:include page="../common/common_header.jsp"></jsp:include>
<!-- 헤더끝  -->

<section id="container">

<!-- 서브헤더 : 필요시 사용!
	<jsp:include page="../common/common_subHeader.jsp">
		<jsp:param value="lifestyle" name="submenu" />
		<jsp:param value="spa" name="ssubmenu1" />
		<jsp:param value="kidsvillage" name="ssubmenu2" />
	</jsp:include> -->
<!-- 서브헤더 끝  -->
	
	<div class="hotelParadiseWrap">
		<div class="innerBox">
		
		<div class="contTitle">
			<h1>TO GO BOX</h1>
		</div>

		<div class="reservationWrap">
			<div class="reservationBox">
				<img alt="" src="images/facility/takeout/takeout_thum2.jpg">
			</div>
			<div class="reservationAside">
				<h2>스위트 애프터눈 티 TO-GO</h2>
				<span>
				델루나 호텔 파티셰리가 준비한 To Go 애프터눈 티와 함께
				어디에서 든 아늑하고 근사한 티 타임을 즐겨보세요.
				</span>
				<div class="rate"><p>46,000 원 ~</p></div>
				<div class="row">
					<div class="w20">판매단위</div>
					<div>1개</div>
				</div>
				<div class="row">
					<div class="w20">중량/용량</div>
					<div>-</div>
				</div>
				<div class="row">
					<div class="w20">포장타입</div>
					<div>실온/종이박스</div>
				</div>
				<div class="row">
					<div class="w20">Pick Up 장소</div>
					<div>본관 1층 로비라운지 '크리스탈 가든'</div>
				</div>
				<div class="row">
					<div class="w20 line">날짜 선택</div>
					<div><input class="w100" type="date" name="pickUpDate" min="${today}"></div>
				</div>
				<div class="row">
					<div class="w20 line">수령 시간</div>
					<div>
						<select name="hour" class="w40">
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
						</select>
						<span>시</span>
						
						<select name="minute" class="w40">
							<option value="00">00</option>
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="50">50</option>
						</select>
						<span>분</span>
					</div>
				</div>
				<div class="row" id="product">
					<div class="w20 line">상품 선택</div>
					<div class="box">
					<select name="product" class="w100" onchange="selectProduct(this.value); totalPrice(); ">
						<option value="">선택</option>
						<option value="라면">라면</option>
						<option value="치킨">치킨</option>
						<option value="피자">피자</option>
						<c:forEach var="takeout" items="${takeoutList}">
							<option value="${takeout.product}"><c:out value="${takeout.product}"></c:out></option>
						</c:forEach>
					</select>
						
					</div>
				</div>
				<div class="row txtRight">
					<p><span class="line">총 상품가격</span><span id="total">0원</span></p>
				</div>
				
				<input id="btn" type="button" onclick="submitForm()" value="상품 결제하기">
				
			</div>
		</div>
		
		<div class="contTitle">
			<h1>상품 설명</h1>
		</div>
		<div class="content">
			<img alt="설명 사진" src="images/facility/takeout/takeout_detail.jpg">
			<c:forEach var="takeoutAttach" items="${takeoutAttachList}">
				<img alt="설명 사진" src="${takeoutAttach.location}">
			</c:forEach>
		</div>
				
		</div>
	</div>
</section>
<script>
function selectProduct(product){
	 var box = '<div class="check productBox'+product+'">';
	 	 box += '<div class="left"> ';
	 	 box += '<p>'+product+'</p>';
	 	 box += '<input type="number" id="count" name="count" min="1" value="1" placeholder="갯수를 입력해주세요" onchange="addPrice(this.value,\''+product+'\'); totalPrice();">개';
	 	 box += '</div>';
	 	 box += '<div class="right">';
	 	 box += '<a href="javascript:void(0)" onclick="deleteBox(\''+product+'\');totalPrice();">x</a>';
	 	 box += '<p id="price">300원</p>';
	 	 box += '<input type="hidden" value="300" id="perPrice">';
	 	 box += '</div></div>';
	 	 
	if($(".check").hasClass("productBox"+product)){
		alert("이미 올려진 상품입니다.")
		return false;
	}
	 	 
	$(".box").append(box);
	
	 	 
}

function deleteBox(product){
	$(".productBox"+product).remove();
}

function addPrice(count,product){
	var perPrice = $("#perPrice").val();
	var total = perPrice*count;
	
	$(".productBox"+product).find("#price").html(total+"원");
}

function totalPrice(){
	var total = 0;
	var count = $(".check").length;
	
	for(var i = 0; i < count; i++){
		var price = $(".check").eq(i).find("#price").text().replace("원","");
		total += Number(price);
	}
	
	$("#total").html(total+"원");

}

</script>

<style>
:root{
	/* color */ 
	--brown-color: #9c836a;
	--brown-light-color: #e6e3df;
	--black-color: #333;
	--black-white-color: #666;
	--red-color:#e66045;
	/* font-size */
	--large-size: 30px;
	--midium-size: 16px;
}

.contTitle{border-bottom:1px solid var(--brown-light-color);}
.contTitle h1{font-size:var(--midium-size); color:var(--brown-color); font-weight: bold; margin-bottom: 20px;}

.reservationWrap{width:100%; display: flex; margin: 50px 0 ;}
.reservationWrap .reservationBox{width:50%;}
.reservationWrap .reservationAside{width:50%; }
.reservationWrap .reservationAside h2{font-size:24px; font-weight:bold; color:black; padding-bottom:20px;}
.reservationWrap .reservationAside span{padding-bottom:20px;}
.reservationWrap .reservationAside .rate{font-size: 26px; color:var(--brown-color); padding:20px 0; border-bottom:1px solid var(--brown-light-color);}
.content{margin-top:50px;}

.line{margin: auto 0;}
.none{display: none;}
.txtRight{justify-content: flex-end;}
.row{padding:20px 0; display:flex; border-bottom: 1px solid var(--brown-light-color); width:100%;}
input, select{padding:10px; outline:none; border:1px solid var(--brown-light-color); } 
.w20{width:20%;}
.w100{width:300px;}
.w40{width:140px;}
#btn{background-color: var(--brown-color); color:white; font-size:20px; font-weight:bold; padding:20px 10px; border-radius: 5px; width:100%;}
#btn:hover{background-color:var(--brown-dark-color); transition: all .3s ease;}
#total{color:var(--brown-color); font-size:20px; padding-left: 10px;}



.check {
    border: 1px solid lightgray;
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
    padding:10px;
}

.right {
    position: relative;
}
.right a {
    position: absolute;
    top: -4px;
    right: 6px;
}
#price{
	position: absolute;
    bottom: 12px;
    right: 5px;
}

input#count {
    padding: 0;
    margin: 10px 0;
}
</style>
<!-- 푸터  -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- 푸터 끝  -->