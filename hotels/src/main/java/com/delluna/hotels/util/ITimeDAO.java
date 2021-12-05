package com.delluna.hotels.util;

import java.sql.Date;

public interface ITimeDAO {
	//현재시간
	Date nowTime();
	//만료시간
	Date expireTime();
	//만료될 시간
	Date soonExpireTime(Date time);
}
