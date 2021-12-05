package com.delluna.hotels.dataservice_reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.delluna.hotels.common_reservation.ReservationAdm;
import com.delluna.hotels.common_reservation.ReservationAttach;
import com.delluna.hotels.util.ConnectionUtil;

@Repository
public class ReservationAdmDAO implements IReservationAdmDAO {
	@Autowired
	IReservationAttachDAO reservationAttachDAO;
	@Autowired
	IReservationAdmMapper reservationAdmMapper;

	@Override
	public int save(ReservationAdm rsvAdm) {
		Connection conn = null;
		PreparedStatement statemanage = null;
		try {
			conn = ConnectionUtil.getConnection();
			statemanage = conn.prepareStatement(
					"insert into reservation_adm(title,title_s,date_start,date_end,content,benefits,pkg_rate) values(?,?,?,?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);

			statemanage.setString(1, rsvAdm.getTitle());
			statemanage.setString(2, rsvAdm.getTitle_s());
			statemanage.setString(3, rsvAdm.getDate_start());
			statemanage.setString(4, rsvAdm.getDate_end());
			statemanage.setString(5, rsvAdm.getContent());
			statemanage.setString(6, rsvAdm.getBenefits());
			statemanage.setDouble(7, rsvAdm.getPkg_rate());
			statemanage.executeUpdate();

			ResultSet rs = statemanage.getGeneratedKeys();
			rs.next();
			rsvAdm.setRezAdm_no(rs.getInt(1));// 새로생성된 번호 set
			rs.close();
			statemanage.close();
			conn.close();

			for (ReservationAttach atc : rsvAdm.getRsv_attach()) {
				reservationAttachDAO.save(atc);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (!statemanage.isClosed()) {
					statemanage.close();
				}
				if (!conn.isClosed()) {
					conn.close();
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return rsvAdm.getRezAdm_no();
	}

	@Override
	public ReservationAdm findByNoAddView(int rezAdm_no, boolean addView) {
		ReservationAdm selectRsv = null;
		try {
			Connection conn = ConnectionUtil.getConnection();
			Statement statemenage = conn.createStatement();
			if (addView) {
				statemenage.executeUpdate("update reservation_adm set views=views+1 where rezAdm_no=" + rezAdm_no);
			}
			String selectSQL = String.format("select * from reservation_adm where rezAdm_no=%d", rezAdm_no);
			ResultSet selectTbSQL = statemenage.executeQuery(selectSQL);
			if (selectTbSQL.next()) {// 다음 줄로
				String title = selectTbSQL.getString("title");
				String title_s = selectTbSQL.getString("title_s");
				String date_start = selectTbSQL.getString("date_start");
				String date_end = selectTbSQL.getString("date_end");
				String content = selectTbSQL.getString("content");
				String benefits = selectTbSQL.getString("benefits");
				java.sql.Date rsv_write = selectTbSQL.getDate("rsv_write");
				int hit = selectTbSQL.getInt("views");
				double pkg_rate = selectTbSQL.getDouble("pkg_rate");

				List<ReservationAttach> rsv_attach = reservationAttachDAO.selectByRsvAdmNo(rezAdm_no);

				selectRsv = new ReservationAdm();
				selectRsv.setRezAdm_no(rezAdm_no);
				selectRsv.setTitle(title);
				selectRsv.setTitle_s(title_s);
				selectRsv.setDate_start(date_start);
				selectRsv.setDate_end(date_end);
				selectRsv.setContent(content);
				selectRsv.setBenefits(benefits);
				selectRsv.setRsv_write(rsv_write);
				selectRsv.setViews(hit);
				selectRsv.setPkg_rate(pkg_rate);
				selectRsv.setRsv_attach(rsv_attach);
			}
			selectTbSQL.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectRsv;
	}

	@Override
	public ReservationAdm findByPrev(int rezAdm_no) {
		ReservationAdm selectPrev = null;
		try {
			Connection conn = ConnectionUtil.getConnection();
			Statement statemenage = conn.createStatement();
			String selectSQL = String.format(
					"SELECT * FROM reservation_adm WHERE rezAdm_no < %d ORDER BY rezAdm_no DESC LIMIT 1", rezAdm_no);
			ResultSet selectTbSQL = statemenage.executeQuery(selectSQL);
			if (selectTbSQL.next()) {// 다음 줄로
				String title = selectTbSQL.getString("title");
				String date_start = selectTbSQL.getString("date_start");
				String date_end = selectTbSQL.getString("date_end");
				java.sql.Date rsv_write = selectTbSQL.getDate("rsv_write");

				selectPrev = new ReservationAdm();
				selectPrev.setRezAdm_no(rezAdm_no);
				selectPrev.setTitle(title);
				selectPrev.setDate_start(date_start);
				selectPrev.setDate_end(date_end);
				selectPrev.setRsv_write(rsv_write);
			}
			selectTbSQL.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectPrev;
	}

	@Override
	public ReservationAdm findByNext(int rezAdm_no) {
		ReservationAdm selectNext = null;
		try {
			Connection conn = ConnectionUtil.getConnection();
			Statement statemenage = conn.createStatement();
			String selectSQL = String
					.format("SELECT * FROM reservation_adm WHERE rezAdm_no > %d ORDER BY rezAdm_no LIMIT 1", rezAdm_no);
			ResultSet selectTbSQL = statemenage.executeQuery(selectSQL);
			if (selectTbSQL.next()) {// 다음 줄로
				String title = selectTbSQL.getString("title");
				String date_start = selectTbSQL.getString("date_start");
				String date_end = selectTbSQL.getString("date_end");
				java.sql.Date rsv_write = selectTbSQL.getDate("rsv_write");

				selectNext = new ReservationAdm();
				selectNext.setRezAdm_no(rezAdm_no);
				selectNext.setTitle(title);
				selectNext.setDate_start(date_start);
				selectNext.setDate_end(date_end);
				selectNext.setRsv_write(rsv_write);
			}
			selectTbSQL.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectNext;
	}

	@Override
	public List<ReservationAdm> selectAll() {
		ArrayList<ReservationAdm> selectRsvs = new ArrayList<ReservationAdm>();
		try {
			Connection conn = ConnectionUtil.getConnection();
			Statement statemenage = conn.createStatement();
			String selectSQL = String.format(
					"select rezAdm_no,title,title_s,date_start,date_end,content,benefits,rsv_write,views,pkg_rate from reservation_adm order by rezAdm_no desc");
			ResultSet selectTbSQL = statemenage.executeQuery(selectSQL);
			while (selectTbSQL.next()) {
				int rezAdm_no = selectTbSQL.getInt("rezAdm_no");
				String title = selectTbSQL.getString("title");
				String title_s = selectTbSQL.getString("title_s");
				String date_start = selectTbSQL.getString("date_start");
				String date_end = selectTbSQL.getString("date_end");
				String content = selectTbSQL.getString("content");
				String benefits = selectTbSQL.getString("benefits");
				java.sql.Date rsv_write = selectTbSQL.getDate("rsv_write");
				int views = selectTbSQL.getInt("views");
				Double pkg_rate = selectTbSQL.getDouble("pkg_rate");

				ReservationAdm selectRsv = new ReservationAdm();
				selectRsv.setRezAdm_no(rezAdm_no);
				selectRsv.setTitle(title);
				selectRsv.setTitle_s(title_s);
				selectRsv.setDate_start(date_start);
				selectRsv.setDate_end(date_end);
				selectRsv.setContent(content);
				selectRsv.setBenefits(benefits);
				selectRsv.setRsv_write(rsv_write);
				selectRsv.setViews(views);
				selectRsv.setPkg_rate(pkg_rate);

				selectRsvs.add(selectRsv);
			}
			selectTbSQL.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (selectRsvs.size() == 0) {
			return null;
		}
		return selectRsvs;
	}

	@Override
	public List<ReservationAdm> selectByDate(String check_in, String check_out) {
		ArrayList<ReservationAdm> rsvByDateList = new ArrayList<ReservationAdm>();
		try {
			Connection conn = ConnectionUtil.getConnection();
			Statement statemenage = conn.createStatement();
			System.out.println("1");
			// String selectSQL = String.format("SELECT * FROM reservation_adm WHERE
			// date_format(date_start, '%Y-%m-%d') <= date_format(%s, '%Y-%m-%d') AND
			// date_format(date_end, '%Y-%m-%d') >= date_format(%s, '%Y-%m-%d')", check_in,
			// check_out);
			// String selectSQL = String.format("SELECT * FROM reservation_adm WHERE
			// (date(date_start) >= %s) AND (date(date_end) <= %s)", check_in, check_out);
			String sql = "SELECT * FROM reservation_adm ";
			sql += "WHERE date_format(date_start, '%Y-%m-%d') <= date_format('" + check_in + "', '%Y-%m-%d') ";
			sql += "AND date_format(date_end, '%Y-%m-%d') >= date_format('" + check_out + "', '%Y-%m-%d')";
			System.out.println(sql);
			ResultSet selectTbSQL = statemenage.executeQuery(sql);

			while (selectTbSQL.next()) {
				int rezAdm_no = selectTbSQL.getInt("rezAdm_no");
				String title = selectTbSQL.getString("title");
				String title_s = selectTbSQL.getString("title_s");
				String date_start = selectTbSQL.getString("date_start");
				String date_end = selectTbSQL.getString("date_end");
				String content = selectTbSQL.getString("content");
				String benefits = selectTbSQL.getString("benefits");
				java.sql.Date rsv_write = selectTbSQL.getDate("rsv_write");
				int views = selectTbSQL.getInt("views");
				int pkg_rate = selectTbSQL.getInt("pkg_rate");

				ReservationAdm selectRsv = new ReservationAdm();
				selectRsv.setRezAdm_no(rezAdm_no);
				selectRsv.setTitle(title);
				selectRsv.setTitle_s(title_s);
				selectRsv.setDate_start(date_start);
				selectRsv.setDate_end(date_end);
				selectRsv.setContent(content);
				selectRsv.setBenefits(benefits);
				selectRsv.setRsv_write(rsv_write);
				selectRsv.setViews(views);
				selectRsv.setPkg_rate(pkg_rate);

				rsvByDateList.add(selectRsv);
			}
			selectTbSQL.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (rsvByDateList.size() == 0) {
			return null;
		}
		return rsvByDateList;
	}

	@Override
	public ReservationAdm findByNo(int no) {
		return reservationAdmMapper.findByNo(no);
	}

	@Override
	public List<ReservationAdm> selectList(int page, int perpage, String col, String kwd) {
		StringBuffer SQL = new StringBuffer();

		ArrayList<ReservationAdm> list = new ArrayList<ReservationAdm>();
		int startPage = (page - 1) * perpage;

		try {

			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement psmt = null;
			ResultSet Mrs = null;

			if (col.equals("date_start")) {
				SQL.append("select * from reservation_adm ");
				SQL.append("where date_start like ? order by rezAdm_no desc limit ?,?");
				psmt = conn.prepareStatement(SQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				psmt.setInt(2, startPage);
				psmt.setInt(3, perpage);
				Mrs = psmt.executeQuery();
			} else if (col.equals("date_end")) {
				SQL.append("select * from reservation_adm ");
				SQL.append("where date_end like ? order by rezAdm_no desc limit ?,?");
				psmt = conn.prepareStatement(SQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				psmt.setInt(2, startPage);
				psmt.setInt(3, perpage);
				Mrs = psmt.executeQuery();
			} 

			while (Mrs.next()) {// 다음 줄로
				ReservationAdm rsv = new ReservationAdm();
				//번호	대표썸네일	제목	시작일	종료일	작성일
				rsv.setRezAdm_no(Mrs.getInt("rezAdm_no"));
				rsv.setTitle(Mrs.getString("title"));
				rsv.setDate_start(Mrs.getString("date_start"));
				rsv.setDate_end(Mrs.getString("date_end"));
				rsv.setRsv_write(Mrs.getDate("rsv_write"));

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
		String totalSQL = "select count(*) as count from reservation_adm";
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
		totalSQL.append("select count(*) as count from reservation_adm");

		int total = 0;

		try {

			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement psmt = null;
			ResultSet rs = null;

			if (col.equals("date_start")) {
				totalSQL.append(" where date_start like ?");
				psmt = conn.prepareStatement(totalSQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				rs = psmt.executeQuery();
				rs.next();
				total = rs.getInt("count");
			} else if (col.equals("date_end")) {
				totalSQL.append(" where date_end like ?");
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

}
