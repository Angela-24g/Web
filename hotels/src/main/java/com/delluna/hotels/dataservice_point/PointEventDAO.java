package com.delluna.hotels.dataservice_point;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.delluna.hotels.common_point.PointEvent;
import com.delluna.hotels.dataservice_member.IMemberDAO;
import com.delluna.hotels.dataservice_reservation.IReservationDAO;
import com.delluna.hotels.util.ConnectionUtil;
import com.delluna.hotels.util.ITimeDAO;

@Repository
public class PointEventDAO implements IPointEventDAO {
	@Autowired IReservationDAO reservationDAO;
	@Autowired IMemberDAO memberDAO;
	@Autowired ITimeDAO timeDAO;

	//적립 메소드
	public int save(PointEvent pointEvent) {
		String sql = "insert into point_event(reservation_no,member_no,state,amount,trans_date,expire_date) values (?,?,?,?,?,?)";
	
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		try {

			conn = ConnectionUtil.getConnection();
			ptmt = conn.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
			ptmt.setInt(1, pointEvent.getReservation_no().getNo());
			ptmt.setInt(2, pointEvent.getMember_no().getNo());
			ptmt.setInt(3, 1); // 1:적립 2:사용 3:기한만료 
			ptmt.setInt(4, pointEvent.getAmount());
			ptmt.setDate(5, timeDAO.nowTime());
			ptmt.setDate(6, timeDAO.soonExpireTime(timeDAO.nowTime()));
			ptmt.executeUpdate(); 
			
			rs = ptmt.getGeneratedKeys();
			rs.next();
			return rs.getInt(1); //성공시 키 반환
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {//연결자, 명령자 닫아줘야지 오류 안걸림
				if(conn !=null)conn.close();
				if(ptmt !=null)ptmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return -1; //2반환: 데이터오류
	}
	
	//사용 메소드
	public int pay(PointEvent pointEvent) {
		String sql = "insert into point_event(reservation_no,member_no,state,amount,trans_date,expire_date) values (?,?,?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement ptmt = null;
		
		
		try {
			conn = ConnectionUtil.getConnection();
			ptmt = conn.prepareStatement(sql);
			
			ptmt.setInt(1, pointEvent.getReservation_no().getNo());
			ptmt.setInt(2, pointEvent.getMember_no().getNo());
			ptmt.setInt(3, 2);// 1:적립 2:사용 3:기한만료 
			ptmt.setInt(4, pointEvent.getAmount());
			ptmt.setDate(5, timeDAO.nowTime());
			ptmt.setDate(6, timeDAO.expireTime());

			return ptmt.executeUpdate(); //1반환 :성공
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn !=null)conn.close();
				if(ptmt !=null)ptmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return -1; //2반환: 데이터오류
	}
	
	//리스트 product, member 불러오기 오류
	public List<PointEvent> pointList(int memberNo, String col, Date startDate, Date endDate){
		
		StringBuffer sql = new StringBuffer(); 
		//sql을 버퍼로 사용하면 문장 이어붙히기가 편해진다. 코드도 깔끔해짐
		List<PointEvent> list = new ArrayList<PointEvent>();

		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		try {
			
			conn = ConnectionUtil.getConnection();
			
			//col의 기본값은 "all"이며 col값이 달라지면 sql문도 달라짐
			if(col.equals("all")) {
				
				sql.append("select * from point_event where member_no=? ");
				
				//만약 시작날짜와 끝날짜가 정해지지 않으면 추가 sql문을 적지 않는다.
				if(startDate == null || endDate == null) {
					ptmt = conn.prepareStatement(sql.toString());
					ptmt.setInt(1, memberNo);
					rs = ptmt.executeQuery();
				}
				//시작날짜와 끝날짜가 정해져 있다면 날짜 범위를 정해주는 추가 sql문을 붙혀준다.
				else { 
					sql.append("and (date(trans_date) between ? and ?)");
					ptmt = conn.prepareStatement(sql.toString());
					ptmt.setInt(1, memberNo);
					ptmt.setDate(2, startDate);
					ptmt.setDate(3, endDate);
					rs = ptmt.executeQuery();
				}
			}//col이 save(적립)일 때
			else if(col.equals("save")) {

				sql.append("select * from point_event where member_no=? and state = 1 ");
				
				if(startDate == null || endDate == null) {
					ptmt = conn.prepareStatement(sql.toString());
					ptmt.setInt(1, memberNo);
					rs = ptmt.executeQuery();
				}
				else { 
					sql.append("and (date(trans_date) between ? and ?)");
					ptmt = conn.prepareStatement(sql.toString());
					ptmt.setInt(1, memberNo);
					ptmt.setDate(2, startDate);
					ptmt.setDate(3, endDate);
					rs = ptmt.executeQuery();
				}

			}//col이 pay(사용)일 때
			else if(col.equals("pay")) {
				
				sql.append("select * from point_event where member_no=? and state = 2 ");
				
				if(startDate == null || endDate == null) {
					ptmt = conn.prepareStatement(sql.toString());
					ptmt.setInt(1, memberNo);
					rs = ptmt.executeQuery();
				}
				else { 
					sql.append("and (date(trans_date) between ? and ?)");
					ptmt = conn.prepareStatement(sql.toString());
					ptmt.setInt(1, memberNo);
					ptmt.setDate(2, startDate);
					ptmt.setDate(3, endDate);
					rs = ptmt.executeQuery();
				}
				
			}//col이 expire(만기)일 때
			else if(col.equals("expire")) {
				
				sql.append("select * from point_event where member_no=? and state = 3 ");
				
				if(startDate == null || endDate == null) {
					ptmt = conn.prepareStatement(sql.toString());
					ptmt.setInt(1, memberNo);
					rs = ptmt.executeQuery();
				}
				else { 
					sql.append("and (date(trans_date) between ? and ?)");
					ptmt = conn.prepareStatement(sql.toString());
					ptmt.setInt(1, memberNo);
					ptmt.setDate(2, startDate);
					ptmt.setDate(3, endDate);
					rs = ptmt.executeQuery();
				}
	
			}//혹시 모를 값이 들어올 경우 대비
			else {
				sql.append("select * from point_event where member_no=? ");
				ptmt = conn.prepareStatement(sql.toString());
				ptmt.setInt(1, memberNo);
				rs = ptmt.executeQuery();
			}

			while(rs.next()) {

				PointEvent point = new PointEvent();
				point.setNo(rs.getInt("no"));
				point.setState(rs.getInt("state"));
				point.setAmount(rs.getInt("amount"));
				point.setReservation_no(reservationDAO.findByRsvNo(rs.getInt("reservation_no")));				
				point.setMember_no(memberDAO.findMember(rs.getInt("member_no")));
				point.setTrans_date(rs.getDate("trans_date"));
				point.setExpire_date(rs.getDate("expire_date"));
								
				list.add(point);
				
			}
			
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn !=null)conn.close();
				if(ptmt !=null)ptmt.close();
				if(rs !=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}
	
	//상태에 따른 총합 포인트
	public int totalPoint(int memberNo, int state) {
		String sql =  "select SUM(amount) as point from point_event where member_no=? and (state=? or state=?)";
		
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		int point = 0;
		
		try {
			conn = ConnectionUtil.getConnection();
			//상태가 2면 총사용총합
			if(state == 2) {
				sql =  "select SUM(amount) as point from point_event where member_no=? and state=?";
				ptmt = conn.prepareStatement(sql);
				ptmt.setInt(1, memberNo);
				ptmt.setInt(2, state);
			}
			//상태가 1이면  총적립총합
			else if(state == 1){
				ptmt = conn.prepareStatement(sql);
				ptmt.setInt(1, memberNo);
				ptmt.setInt(2, state);
				ptmt.setInt(3, 3);
			} 
			//상태가 0이면 남은 포인트
			else if(state == 0){
				ptmt = conn.prepareStatement(sql);
				ptmt.setInt(1, memberNo);
				ptmt.setInt(2, 1);
				ptmt.setInt(3, 2);
			} 
			rs = ptmt.executeQuery();
			while(rs.next()) {
				point = rs.getInt("point");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn !=null)conn.close();
				if(ptmt !=null)ptmt.close();
				if(rs !=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return point;
	}
	
	//포인트의 정보를 받아줌
	public PointEvent findByNo(int pointEventNo, int state) {
		String sql =  "select * from point_event where no=? and state=? order by no desc";
		
		
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionUtil.getConnection();
			
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, pointEventNo);
			ptmt.setInt(2, state);
			
			rs = ptmt.executeQuery();
			rs.next();
			PointEvent point = new PointEvent();
			point.setNo(rs.getInt("no"));
			point.setReservation_no(reservationDAO.findByRsvNo(rs.getInt("reservation_no")));
			point.setMember_no(memberDAO.findMember(rs.getInt("member_no")));
			point.setAmount(rs.getInt("amount"));
			point.setTrans_date(rs.getDate("trans_date"));
			point.setExpire_date(rs.getDate("expire_date"));
			
			return point;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn !=null)conn.close();
				if(ptmt !=null)ptmt.close();
				if(rs !=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null; //2반환: 데이터오류
	}
	
	//포인트 만료 시키기
	public void expired(int memberNo) {
		//안전핀 해제같은 코드임 안해주면 오류걸림
		String setSql = "set sql_safe_updates=0;";
		String sql = "update point_event set state=3  where member_no=? and (date(expire_date) < now())";
		
		Connection conn = null;
		PreparedStatement ptmt = null;
		PreparedStatement setPtmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionUtil.getConnection();
			setPtmt = conn.prepareStatement(setSql);
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, memberNo);
			setPtmt.executeUpdate();
			ptmt.executeUpdate();


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn !=null)conn.close();
				if(ptmt !=null)ptmt.close();
				if(rs !=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}
	
	
	
	
	
}
