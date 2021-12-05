package com.delluna.hotels.util;

public class BusinessResult {
	RESULTCODE code = RESULTCODE.정상;
	String message = null;//던져줄 메시지
	Object value = null;//DB에서 요청오는 모든 것들은 여기에 담기.
	
	public BusinessResult() {//값은 없는 성공
		code=RESULTCODE.정상;
		message=null;
		value=null;
	}
	public BusinessResult(Object value) {//값이 있는 성공
		code=RESULTCODE.정상;
		message=null;
		this.value=value;
	}
	
	public BusinessResult(RESULTCODE code, String message) {//code와 메시지 직접 지정(주로 실패시)
		this.code=code;
		this.message=message;
	}
	
	public RESULTCODE getCode() {
		return code;
	}
	public void setCode(RESULTCODE code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getValue() {
		return value;
	}
	public void setValue(Object value) {
		this.value = value;
	}
	
}
