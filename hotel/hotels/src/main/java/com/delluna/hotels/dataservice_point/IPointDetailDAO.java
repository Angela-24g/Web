package com.delluna.hotels.dataservice_point; 


import java.util.List;

import com.delluna.hotels.common_point.PointDetail;


public interface IPointDetailDAO {
	
	//(수정필요),회원넘버,상태,포인트량,현재시간,만료시간(현재시간+1년)이 들어감
	int save(PointDetail pointDetail);
	int pay(int memberNo,int payAmount);
	
	//현재시간과 만료시간을 비교하여 상태를 변경함
	void expired(int memberNo);
	
	//만료되기 한달전의 포인트양을 알려준다.
	int soonExpireAmount(int memberNo);
	
	//만료되기 한달전의 포인트리스트를 알려준다.
	List<PointDetail> soonExpireList(int memberNo);
}
