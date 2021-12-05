<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="adm-header.jsp"></jsp:include>
<div class="wrapper">
	<jsp:include page="adm-nav.jsp"></jsp:include>
	<div class="adm_content">
		<form action="" method="post">
			<table border="1">
			<caption>회원정보 수정</caption>
				<tbody>
					<tr>
						<td  colspan="3"><h1>테이크 아웃 등록하기</h1></td>
					</tr>
					<tr>
						<th colspan="1">제목</th>
						<td colspan="2"><input type="text" name="title" placeholder="제목"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="2"><textarea name="content" rows="" cols="" placeholder="내용"></textarea></td>
					</tr>
					<tr>
						<th>픽업장소</th>
						<td colspan="2"><input type="text" name="location" placeholder="픽업장소"></td>
					</tr>
					<tr>
						<th>제품명 몇 가격</th>
						<td colspan="2">
						<input type="hidden" name="product">
						<input type="hidden" name="price">
						<input type="button" onclick="addProduct()" value="추가">
						<ul id="products">
						</ul>
						</td>
					</tr>
					<tr>
						<th>판매단위</th>
						<td colspan="2"><input type="text" name="sales_unit" placeholder="판매단위"></td>
					</tr>
					<tr>
						<th>중량/용량</th>
						<td colspan="2"><input type="text" name="weight" placeholder="중량/용량"></td>
					</tr>
					<tr>
						<th>상품설명 이미지</th>
						<td colspan="2">
						첨부 <input type="button" onclick="첨부요소추가하다()" value="추가"><br>
						<br>
						***첫번째 사진은 썸네일 입니다.***<br>
						<br>
						<ul id="attachlist"></ul>
						</td>
					</tr>
					<tr>
						<td colspan="3"><input id="bt" type="submit" value="등록하기"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>

<script>
function 첨부요소추가하다(){
	
	var 첨부리스트 = document.querySelector("#attachlist")
	//마지막 파일이 선택이 안되어 있는 경우 첨부파일 추가 무효
	if(첨부리스트.childNodes.length>0 &&
			첨부리스트.childNodes[첨부리스트.childNodes.length-1].childNodes[0].value==""){
		return 0;
	}
	var li = document.createElement("li");
	var fileInput = document.createElement("input");
	fileInput.type="file";
	var btnDelete = document.createElement("input");
	btnDelete.type = "button"
	btnDelete.value = "삭제"
	//containerLi 라는 속성 새로생성
	btnDelete.containerLi = li;
	btnDelete.addEventListener("click",function(event){
		//event.target  => 이벤트요소 발생
		var li = event.target.containerLi;
		var ul = li.parentNode;
		ul.removeChild(li);
	});
	li.appendChild(fileInput);
	li.appendChild(btnDelete);
	첨부리스트.appendChild(li);
	
}

function addProduct(){
	
	var products = document.querySelector("#products");

	var li = document.createElement("li");
	var Input1 = document.createElement("input");
	Input1.type="text";
	Input1.placeholder="제품명";
	var Input2 = document.createElement("input");
	Input2.type="number";
	Input2.placeholder="가격";
	var btnDelete = document.createElement("input");
	btnDelete.type = "button"
	btnDelete.value = "삭제"
	//containerLi 라는 속성 새로생성
	btnDelete.containerLi = li;
	btnDelete.addEventListener("click",function(event){
		//event.target  => 이벤트요소 발생
		var li = event.target.containerLi;
		var ul = li.parentNode;
		ul.removeChild(li);
	});
	li.appendChild(Input1);
	li.appendChild(Input2);
	li.appendChild(btnDelete);
	products.appendChild(li);
	
}

function 게시물등록하다(){
	var attachlist = document.querySelector("#attachlist");
	var products = document.querySelector("#products");
	
	for(var idx=0;idx<attachlist.childNodes.length;idx++){
		var fileInput = attachlist.childNodes[idx].childNodes[0];
		fileInput.name = "attachFiles["+idx+"]";
	}
	
	var products;
	var prices;
	
	var productList = docunment.getElementsByName("product")[0].value;
	var priceList = docunment.getElementsByName("prices")[0].value;
	
	for(var idx=0;idx<products.children.length;idx++){
		var product = products.children[idx].children[0].value();
		var price = products.children[idx].children[1].value();
		products += product+"/";
		prices += price+"/";
	}
	
	productList = products;
	priceList = prices;

	return true;
}
</script>

<style>
input{width:30%;}
textarea{width:80%;}
</style>

<jsp:include page="../common/footer.jsp"></jsp:include>