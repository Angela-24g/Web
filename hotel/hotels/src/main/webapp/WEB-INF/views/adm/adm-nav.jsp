<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="adm_nav">
	<ul class="adm_menu">
		<li class="adm_menu_box"><a href="javascript:;" onclick="jsTapChange('adm')" class="fc_menu">메인</a>
			<ul class="adm_menu_2depth">
				<li><a href="javascript:;" onclick="jsTapChange('adm')"><strong>관리자메인</strong></a></li>
			</ul></li>
		<li class="adm_menu_box"><a href="javascript:;" onclick="jsTapChange('adm','adm-member-list')" class="fc_menu">회원</a></li>
		<li class="adm_menu_box"><a href="javascript:;" onclick="jsTapChange('adm','rooms','mainList')" class="fc_menu">룸</a>
			<ul class="adm_menu_2depth">
				<li><a href="javascript:;" onclick="jsTapChange('adm','rooms','mainList')"><strong>룸 관리</strong></a></li>
				<li><a href="javascript:;" onclick="jsTapChange('adm','rooms','list')">-룸 리스트</a></li>
				<li><a href="javascript:;" onclick="jsTapChange('adm','rooms','write')">-룸 등록</a></li>
				<li><a href="javascript:;" onclick="jsTapChange('adm','adm-rsv-list')">-예약가능상품 리스트</a></li>
				<li><a href="javascript:;" onclick="jsTapChange('adm','adm-rsv-write')">-예약가능상품 등록</a></li>
				<li><a href="javascript:;" onclick="jsTapChange('adm','user-rsv-list')">-예약내역(사용자)</a></li>
			</ul></li>
		<li class="adm_menu_box"><a href="javascript:;" onclick="jsTapChange('adm','user-rt-list')" class="fc_menu">레스토랑</a>
			<ul class="adm_menu_2depth">
				<li><a href="javascript:;" onclick="jsTapChange('adm','user-rt-list')"><strong>레스토랑 관리</strong></a></li>
				<li><a href="javascript:;" onclick="jsTapChange('adm','user-rt-list')">-예약내역(사용자)</a></li>
			</ul></li>
		<li class="adm_menu_box"><a href=javascript:;" onclick="jsTapChange('adm','lifestyle','list')" class="fc_menu">라이프스타일</a>
			<ul class="adm_menu_2depth">
				<li><a href=javascript:;" onclick="jsTapChange('adm','lifestyle','list')"><strong>라이프스타일 관리</strong></a></li>
				<li><a href=javascript:;" onclick="jsTapChange('adm','lifestyle','write')">-라이프스타일 등록</a></li>
			</ul></li>
		<li class="adm_menu_box"><a class="fc_menu">회원문의</a>
			<ul class="adm_menu_2depth">
				<li><a href=javascript:;" onclick="jsTapChange('adm','adm-qna-list')"><strong>회원문의 관리</strong></a></li>
				
				<li><a href=javascript:;" onclick="jsTapChange('adm','adm-rqna-list')"><strong>답변 확인</strong></a></li>
			</ul></li>

	</ul>
</nav>

<script type="text/javascript" src="/js/adm/adm-nav.js?ver=1"></script>