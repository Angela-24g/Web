<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="hidden" name="progress" id="progress" value="">
<input type="hidden" name="select_no" id="select_no" value="">

<form name="searchFrm" method="get" id="searchFrm" action="reservation-list">

<input type="hidden" id="page" name="page" value="1" />
<input type="hidden" id="search_no" name="search_no" value="" />
<input type="text" id="check_in" name="check_in" value="${check_in}">
<input type="text" id="check_out" name="check_out" value="${check_out}">
//채워야함(ReservationController 에서 나연씨께 부탁)
<select class="selectBox" id="search_room_type" name="search_room_type">
<select class="selectBox" name="search_abult" id="search_abult">
<select class="selectBox" name="search_elementary" id="search_elementary">
<select class="selectBox" name="search_child" id="search_child">
<select class="selectBox" name="search_baby" id="search_baby">
</form>

<form name="writeFrm" method="get" id="writeFrm" action="/reservation-reserve">
//페이지 로딩시 채워짐 reservation_adm 완료, room_type 완료
<input type="hidden" id="rezAdm_no" name="rezAdm_no" value="" />
<input type="hidden" id="roomType_no" name="roomType.no" value="" />

//페이지 로딩시 채워 짐 - reservation 테이블
<input type="hidden" id="date_start" name="date_start" value="" />
<input type="hidden" id="date_end" name="date_end" value="" />
<input type="hidden" id="room_count" name="room_count" value="" />
<input type="hidden" id="count_adult" name="count_adult" value="" />
<input type="hidden" id="count_elementary" name="count_elementary" value="" />
<input type="hidden" id="count_child" name="count_child" value="" />
<input type="hidden" id="count_baby" name="count_baby" value="" />

<input type="radio" id="extraBed1" name="extraBed" tabindex="0" value="Y"onclick="fnRoomChange(72600);">
<input type="radio" id="extraBed2" name="extraBed" tabindex="0" value="N"onclick="fnRoomChange(0);">
<input type="hidden" id="bedPrice" name="price_bed" value="0">
<input type="hidden" id="roomPrice" name="price_product" >
<input type="hidden" id="taxPrice" name="price_service">
<input type="hidden" id="optionPrice" name="price_options">
<input type="hidden" id="price_total" name="price_total">
//??
<input type="hidden" id="daily_str" name="daily_str" value="" />
<input type="hidden" id="pro_progress" name="pro_progress" value="">

//선택시 채워짐 room_detail 완료
<input type="radio" id="VIEWTYPE0" name="view" tabindex="0" value="시티" onclick="fnCView();">
<input type="radio" id="LOCATION0" name="location" tabindex="0" value="본관" onclick="fnTView();">
<input type="radio" id="BEDTYPE2" name="bedtype" tabindex="0" value="온돌" onclick="fnRoomSelect();">


<input type="hidden" id="roomPrice" name="price_product" >
<input type="hidden" id="taxPrice" name="price_service">
<input type="hidden" id="optionPrice" name="price_options">
<input type="hidden" id="price_total" name="price_total">
</form>