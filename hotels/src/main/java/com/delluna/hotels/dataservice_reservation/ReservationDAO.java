package com.delluna.hotels.dataservice_reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.delluna.hotels.common_reservation.Reservation;
import com.delluna.hotels.common_reservation.ReservationAdm;
import com.delluna.hotels.common_reservation.ReservationJoin;
import com.delluna.hotels.util.ConnectionUtil;

@Repository
public class ReservationDAO implements IReservationDAO {
	@Autowired
	IReservationMapper reservationMapper;
	@Autowired
	IReservationAdmDAO reservationAdmDAO;

	@Override
	@Transactional
	public void save(Reservation reservation) {
		reservationMapper.save(reservation);
	}

	@Override
	@Transactional
	public void editRsv(Reservation rsvUpdate) {
		reservationMapper.editRsv(rsvUpdate);
	}

	@Override
	public void delete(int no) {
		reservationMapper.delete(no);
	}

	/*
	 * @Override
	 * 
	 * @Transactional public List<Reservation> selectByPage(int page, int
	 * sizePerPage, RefInteger totalSize) { // TODO implement here return null; }
	 */

	@Override
	@Transactional
	public List<Reservation> selectAll() {
		return reservationMapper.selectAll();
	}

	@Override
	@Transactional
	public List<Reservation> selectAllByMemberNo(int member_no) {
		return reservationMapper.selectAllByMemberNo(member_no);
	}

	@Override
	@Transactional
	public void updateState(String state, int no) {
		reservationMapper.updateState(state, no);
	}

	@Override
	@Transactional
	public Reservation findByNo(int no) {
		return reservationMapper.findByNo(no);
	}

	@Override
	@Transactional
	public Reservation findByRsvNo(int no) {
		return reservationMapper.findByRsvNo(no);
	}

	@Override
	@Transactional
	public Reservation findByPrev(int no) {
		return reservationMapper.findByPrev(no);
	}

	@Override
	@Transactional
	public Reservation findByNext(int no) {
		return reservationMapper.findByNext(no);
	}

	@Override
	public int findByNoRoom(int no) {
		return reservationMapper.findByNoRoom(no);
	}

	@Override
	public ReservationAdm findByNoAdm(ReservationAdm rsvAdmNo) {
		return reservationMapper.findByNoAdm(rsvAdmNo);
	}

	@Override
	public ReservationJoin selectRsvJoinNo(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reservation findByRRRNo(int no) {
		return reservationMapper.findByRRRNo(no);
	}

	@Override
	public List<Reservation> selectList(int page, int perpage, String col, String kwd) {
		StringBuffer SQL = new StringBuffer();

		ArrayList<Reservation> list = new ArrayList<Reservation>();
		int startPage = (page - 1) * perpage;

		try {

			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement psmt = null;
			ResultSet Mrs = null;

			if (col.equals("name")) {
				SQL.append("select * from reservation ");
				SQL.append("where name like ? order by no desc limit ?,?");
				psmt = conn.prepareStatement(SQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				psmt.setInt(2, startPage);
				psmt.setInt(3, perpage);
				Mrs = psmt.executeQuery();
			} else if (col.equals("tel")) {
				SQL.append("select * from reservation ");
				SQL.append("where tel like ? order by no desc limit ?,?");
				psmt = conn.prepareStatement(SQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				psmt.setInt(2, startPage);
				psmt.setInt(3, perpage);
				Mrs = psmt.executeQuery();
			} else if (col.equals("email")) {
				SQL.append("select * from reservation ");
				SQL.append("where email like ? order by no desc limit ?,?");
				psmt = conn.prepareStatement(SQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				psmt.setInt(2, startPage);
				psmt.setInt(3, perpage);
				Mrs = psmt.executeQuery();
			} else if (col.equals("check_in")) {
				SQL.append("select * from reservation ");
				SQL.append("where check_in like ? order by no desc limit ?,?");
				psmt = conn.prepareStatement(SQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				psmt.setInt(2, startPage);
				psmt.setInt(3, perpage);
				Mrs = psmt.executeQuery();
			} else if (col.equals("check_out")) {
				SQL.append("select * from reservation ");
				SQL.append("where check_out like ? order by no desc limit ?,?");
				psmt = conn.prepareStatement(SQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				psmt.setInt(2, startPage);
				psmt.setInt(3, perpage);
				Mrs = psmt.executeQuery();
			} else if (col.equals("state")) {
				SQL.append("select * from reservation ");
				SQL.append("where state like ? order by no desc limit ?,?");
				psmt = conn.prepareStatement(SQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				psmt.setInt(2, startPage);
				psmt.setInt(3, perpage);
				Mrs = psmt.executeQuery();
			}

			while (Mrs.next()) {// 다음 줄로
				Reservation rsv = new Reservation();
				// 번호	예약상품	예약자	시작일	종료일	예약상태	작성일
				rsv.setNo(Mrs.getInt("no"));
				rsv.setName(Mrs.getString("name"));
				rsv.setCheck_in(Mrs.getString("check_in"));
				rsv.setCheck_out(Mrs.getString("check_out"));
				rsv.setState(Mrs.getString("state"));
				rsv.setDate_write(Mrs.getString("date_write"));

				list.add(rsv);
			}

			Mrs.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public int getCount() {
		String totalSQL = "select count(*) as count from reservation";
		int total = 0;

		try {

			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement psmt = conn.prepareStatement(totalSQL);

			psmt.executeQuery();
			ResultSet Trs = psmt.executeQuery(totalSQL);
			Trs.next();

			total = Trs.getInt("count");

			Trs.close();
			psmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return total;

	}

	public int getCount(String kwd, String col) {
		StringBuffer totalSQL = new StringBuffer();
		totalSQL.append("select count(*) as count from reservation");

		int total = 0;

		try {

			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement psmt = null;
			ResultSet rs = null;

			if (col.equals("name")) {
				totalSQL.append(" where name like ?");
				psmt = conn.prepareStatement(totalSQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				rs = psmt.executeQuery();
				rs.next();
				total = rs.getInt("count");
			} else if (col.equals("tel")) {
				totalSQL.append(" where tel like ?");
				psmt = conn.prepareStatement(totalSQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				rs = psmt.executeQuery();
				rs.next();
				total = rs.getInt("count");
			} else if (col.equals("email")) {
				totalSQL.append(" where email like ?");
				psmt = conn.prepareStatement(totalSQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				rs = psmt.executeQuery();
				rs.next();
				total = rs.getInt("count");
			} else if (col.equals("check_in")) {
				totalSQL.append(" where check_in like ?");
				psmt = conn.prepareStatement(totalSQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				rs = psmt.executeQuery();
				rs.next();
				total = rs.getInt("count");
			} else if (col.equals("check_out")) {
				totalSQL.append(" where check_out like ?");
				psmt = conn.prepareStatement(totalSQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				rs = psmt.executeQuery();
				rs.next();
				total = rs.getInt("count");
			} else if (col.equals("state")) {
				totalSQL.append(" where state like ?");
				psmt = conn.prepareStatement(totalSQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				rs = psmt.executeQuery();
				rs.next();
				total = rs.getInt("count");
			}

			rs.close();
			psmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return total;

	}

	// @Override
	// public ReservationJoin selectRsvJoinNo(int no) {
	// return reservationMapper.selectRsvJoinNo(no);
	// }

}
