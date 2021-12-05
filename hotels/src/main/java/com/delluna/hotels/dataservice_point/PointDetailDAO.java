package com.delluna.hotels.dataservice_point;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.delluna.hotels.common_point.PointDetail;
import com.delluna.hotels.util.ConnectionUtil;
import com.delluna.hotels.util.ITimeDAO;
import com.delluna.hotels.util.TimeDAO;

@Repository
public class PointDetailDAO implements IPointDetailDAO{

	@Autowired ITimeDAO timeDAO;
	
	//포인트 적립
	public int save(PointDetail pointDetail) {
		String sql = "insert into point_detail(member_no,state,amount,point_event_no,trans_date,expire_date) values (?,?,?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement ptmt = null;
		
		try {
			conn = ConnectionUtil.getConnection();
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, pointDetail.getMember_no());
			ptmt.setInt(2, 1);// 1:적립 2:사용 3:기한만료 
			ptmt.setInt(3, pointDetail.getAmount());
			ptmt.setInt(4, pointDetail.getPointEventNo().getNo());
			ptmt.setDate(5, timeDAO.nowTime());
			ptmt.setDate(6, timeDAO.expireTime());

			return ptmt.executeUpdate(); 

			
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
	
	//포인트 사용
	public int pay(int memberNo,int payAmount) {
		
		String 적립된것들 = "select amount from point_detail where member_no = ? and state = 1 and amount > 0;";
		String amount변경 = "update point_detail set amount = ? where member_no = ? and state = 1 and amount > 0 limit 1;";
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		int point = 0;
		 
		//payAmount = 지불할 금액
		//point = 현재가지고 있는 포인트
		try {
			
			
			conn = ConnectionUtil.getConnection();
			ptmt = conn.prepareStatement(적립된것들);
			ptmt.setInt(1, memberNo);

			rs = ptmt.executeQuery();

			while(rs.next()) {
				//현재가지고 있는 포인트를 지불할 금액이 될때까지 쌓아줌
			 	point += (rs.getInt("amount"));
			 	System.out.println(point);
	
			 	//지불할 금액이 아직 더 크다면 계속 진행
			 	if(point-payAmount < 0) {
				 	PreparedStatement ptmt1 = conn.prepareStatement(amount변경);
				 	ptmt1.setInt(1, 0);
				 	ptmt1.setInt(2, memberNo);
				 	ptmt1.executeUpdate();
				 	System.out.println("작");
				 	continue;
				 	
			 	}//지불할 금액과 포인트가 같다면 그 포인트를 0으로 만들고 끝냄
			 	else if(point-payAmount == 0) {
				 	PreparedStatement ptmt1 = conn.prepareStatement(amount변경);
				 	ptmt1.setInt(1, 0);
				 	ptmt1.setInt(2, memberNo);
				 	System.out.println("같");
				 	return ptmt1.executeUpdate();
				 	
			 	}//포인트가 남는다면 잔금을 마지막에 사용한 포인트에 돌려줌
			 	else if(point-payAmount > 0) {
			 		PreparedStatement ptmt1 = conn.prepareStatement(amount변경);
			 		ptmt1.setInt(1, point - payAmount);
				 	ptmt1.setInt(2, memberNo);
				 	System.out.println("크");
				 	return ptmt1.executeUpdate();
			 	}
			 	System.out.println("-----------구분-----------");
			}}

			 	 catch (Exception e) {
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
		return -1; //2반환: 데이터오류
	}
	
	//곧 만료된 포인트의 양
	public int soonExpireAmount(int memberNo) {

		String sql = "select sum(amount) as sum from point_detail where member_no = ? and state=1 and amount>0"
				+ " and year(expire_date)=year(now()) and month(expire_date)-1=month(now()) ";
		
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionUtil.getConnection();
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, memberNo);
			rs = ptmt.executeQuery();
			rs.next();
			
			return rs.getInt("sum");

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
		return 0; //0반환: 데이터오류
	}
	
	//포인트 만료 시키기
	public void expired(int memberNo) {
		//pointEvenet와 같은 설명임
		String setSql = "set sql_safe_updates=0;";
		String sql = "update point_detail set state=3  where member_no=? and (date(expire_date) < now())";
		
		Connection conn = null;
		PreparedStatement ptmt = null;
		PreparedStatement setPtmt = null;
		ResultSet rs = null;
		//테스트
		memberNo = 1;
		
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
	
	//쓸일 잇는지 아직 모름 (수정필요)
	public List<PointDetail> soonExpireList(int memberNo){
		List<PointDetail> list = new ArrayList<PointDetail>();
		String sql = "select * from point_detail where member_no = ? and state=1 and amount>0"
				+ " and year(expire_date)=year(now()) and month(expire_date)-1=month(now())";
		
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		//테스트
		memberNo = 1;
		
		try {
			conn = ConnectionUtil.getConnection();
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, memberNo);
			rs = ptmt.executeQuery();

			while(rs.next()) {

				PointDetail point = new PointDetail();
				point.setNo(rs.getInt("no"));
				point.setState(rs.getInt("state"));
				point.setAmount(rs.getInt("amount"));
				point.setTrans_date(rs.getDate("trans_date"));
				point.setExpire_date(rs.getDate("expire_date"));
				//나중에 리스트 추가할것
								
				list.add(point);
				
				return list;
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
		return null; //2반환: 데이터오류
	}
}
