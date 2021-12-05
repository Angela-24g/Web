package com.delluna.hotels.util;

import java.sql.Date;
import java.util.Calendar;

import org.springframework.stereotype.Repository;

@Repository
public class TimeDAO implements ITimeDAO{

	public Date nowTime() {
		Date date_now = new Date(System.currentTimeMillis());
		//현재시간을 밀리세컨드로 받음
		return date_now;
	}
	
	public Date expireTime() {
		//캘런더 불러옴
		Calendar cal = Calendar.getInstance();
		
		//현재 시간에 1년을 추가
	    cal.setTime(new java.util.Date());
	    cal.add(Calendar.YEAR, 1);
		Date date_after = new Date(cal.getTimeInMillis()); 
		
		return date_after;
	} 
	
	public Date soonExpireTime(Date time) {
		//위와 같은 방식
		Calendar cal = Calendar.getInstance();
	    cal.setTime(time);
	    cal.add(Calendar.MONTH, +1);
		Date date_after = new Date(cal.getTimeInMillis()); 
		
		return date_after;
	}
}
