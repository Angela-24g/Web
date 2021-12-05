<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="/add/lifestyle" class="formbox" method="post" enctype="multipart/form-data">
			<ul>
				<li>
					<span>라이프스타일 종류: </span> 
					<select name="type" id="type">
						<option value="spa">spa</option>
						<option value="kidsvillage">kidsvillage</option>
					</select>
				</li>
				<li>
					<span>라이프스타일 서브종류: </span> 
					<input type="text" name="subtype" />
				</li>
				<li>
					<span>라이프스타일 이름: </span> 
					<input type="text" name="name" />
				</li>
			</ul>
			<ul>
				<li>
					<span>간단한 소개: </span> 
					<textarea rows="5" cols="20" name="info"></textarea>
				</li>
			</ul>
			<ul>
				<li>
					<span>상세 소개: </span> 
					<textarea rows="10" cols="100" name="infoDetail"></textarea>
				</li>
			</ul>
			<ul>
				<li>
					<span>영업시간: </span> 
					<textarea rows="5" cols="100" name="hours"></textarea>
				</li>
			</ul>
			<ul>
				<li>
					<span>위치: </span> 
					<textarea rows="5" cols="100" name="location"></textarea>
				</li>
				<li>
					<span>연락처: </span> 
					<input type="text" name="contact"/>
				</li>
			</ul>
			<ul>
				<li>
					<span>요금 구분: </span>
					<ul id="pricelist"></ul>
					<button onclick="addPriceType()" type="button">요금종류추가</button>
				</li>
			</ul>
			<ul>
				<li>
					<span>첨부 추가: </span>
					<ul id="attachlist"></ul>
					<button onclick="addAttach()" type="button">첨부추가</button>
				</li>
			</ul>
			
			<ul>
				<li>
					<input type="submit" value="등록하기"/>
				</li>
			</ul>
		</form>
	</div>
</body>
<script type="text/javascript">
	function addAttach(e) {
		var attachList = document.querySelector("#attachlist");

		if (attachList.childNodes.length > 0
				&& attachList.childNodes[attachList.childNodes.length - 1].childNodes[0].value == "") {
			return 0;
		}

		var li = document.createElement("li");
		var fileInput = document.createElement("input");
		fileInput.type = "file";
		var btnDelete = document.createElement("input");
		btnDelete.type = "button";
		btnDelete.value = "삭제";
		btnDelete.containerLi = li;

		btnDelete.addEventListener("click", function(event) {
			var li=event.target.containerLi;
			var ul=li.parentNode;
			ul.removeChild(li);
		})

		li.appendChild(fileInput);
		li.appendChild(btnDelete);

		attachList.appendChild(li);
		
		if(attachList.childNodes != null){
			var i = attachList.childNodes.length - 1;
			var fileInput = attachList.childNodes[i].childNodes[0];
			fileInput.name = "imagesFiles[" + i +  "]";
		}
	}
	
	function addPriceType(e) {
		var 리스트 = document.querySelector("#pricelist");
		
		if (리스트.childNodes.length > 0
				&& 리스트.childNodes[리스트.childNodes.length - 1].childNodes[1].value == "") {
			return 0;
		}

		var li = document.createElement("li");
		
		var input1 = document.createElement("input");
		input1.type = "text";

		input1.placeholder = "성인";
		
		var input2 = document.createElement("input");
		input2.type = "text";
		input2.placeholder = "원단위";
		
		var btnDelete = document.createElement("input");
		btnDelete.type = "button";
		btnDelete.value = "삭제";

		btnDelete.containerLi = li;

		btnDelete.addEventListener("click", function(event) {
			var li=event.target.containerLi;
			var ul=li.parentNode;
			ul.removeChild(li);
		})

		li.appendChild(input1);
		li.appendChild(input2);
		li.appendChild(btnDelete);

		리스트.appendChild(li);
		
		var i = 리스트.childNodes.length - 1;
		
		if(리스트.childNodes != null){
			var select = 리스트.childNodes[i].childNodes[0];
			select.name = "price_types[" + i +  "]";
		}
		
		if(리스트.childNodes != null){
			var input = 리스트.childNodes[i].childNodes[1];
			input.name = "prices[" + i +  "]";
		}
	}
</script>
</html>