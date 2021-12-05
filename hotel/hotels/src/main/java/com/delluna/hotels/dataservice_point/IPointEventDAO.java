package com.delluna.hotels.dataservice_point;



import java.sql.Date;
import java.util.List;

import com.delluna.hotels.common_point.PointEvent;

public interface IPointEventDAO {

	//물건번호,회원넘버,상태,포인트량,현재시간,만료시간(현재시간+1년)이 들어감
	int save(PointEvent pointEvent);
	int pay(PointEvent pointEvent);
	
	//현재시간과 만료시간을 비교하여 상태를 변경함
	void expired(int memberNo);
	
	//로그인상태에서 검색 변경에 따라 리스트를 올려줌
	List<PointEvent> pointList(int memberNo, String col, Date startDate, Date endDate);
	
	//상태가 무엇인지에 따라 그것의 총합(SUM)을 보여줌
	//1:적립,2:사용,3:만료
	int totalPoint(int memberNo, int state);
	
	//특정 포인트이벤트의 정보를 가져와줌
	PointEvent findByNo(int memberNo, int state);
	
}
