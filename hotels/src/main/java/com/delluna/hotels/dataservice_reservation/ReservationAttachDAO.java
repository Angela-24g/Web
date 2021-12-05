package com.delluna.hotels.dataservice_reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.delluna.hotels.common_reservation.ReservationAdm;
import com.delluna.hotels.common_reservation.ReservationAttach;
import com.delluna.hotels.util.ConnectionUtil;

@Repository
public class ReservationAttachDAO implements IReservationAttachDAO {

	@Override
	public void save(ReservationAttach rsvAdmAtc) {
		Connection conn = null;
		PreparedStatement statemanage = null;
		try {
			conn = ConnectionUtil.getConnection();
			statemanage = conn.prepareStatement("insert into reservation_attach(name,size,rsv_adm) values(?,?,?)");
			statemanage.setString(1, rsvAdmAtc.getName());
			statemanage.setLong(2, rsvAdmAtc.getSize());
			statemanage.setInt(3, rsvAdmAtc.getRsv_adm().getRezAdm_no());
			statemanage.executeUpdate();
			statemanage.close();
			conn.close();
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

	}

	@Override
	public List<ReservationAttach> selectByRsvAdmNo(int rsvAdmNo) {
		ArrayList<ReservationAttach> rsvAttach = new ArrayList<ReservationAttach>();
		try {
			Connection conn = ConnectionUtil.getConnection();
			Statement statemanage = conn.createStatement();
			String selectSQL = String.format("select * from reservation_attach where rsv_adm=%d", rsvAdmNo);
			ResultSet selectTbSQL = statemanage.executeQuery(selectSQL);
			while (selectTbSQL.next()) {// 다음 줄로
				int atcNo = selectTbSQL.getInt("no");
				String name = selectTbSQL.getString("name");
				long size = selectTbSQL.getLong("size");

				ReservationAttach atc = new ReservationAttach();
				atc.setNo(atcNo);
				atc.setName(name);
				atc.setSize(size);

				rsvAttach.add(atc);
			}
			selectTbSQL.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (rsvAttach.size() == 0) {
			rsvAttach = null;
		}
		return rsvAttach;
	}

	/*
	 * @Override public ReservationAttach findByNo(int rsvAtcNo) { ReservationAttach
	 * rsvAdmAtcNo = null; try { Connection conn = ConnectionUtil.getConnection();
	 * Statement statemanage = conn.createStatement(); String selectSQL =
	 * String.format("select * from attach where no=%d", rsvAtcNo); ResultSet
	 * selectTbSQL = statemanage.executeQuery(selectSQL); if (selectTbSQL.next())
	 * {// 다음 줄로 String name = selectTbSQL.getString("name"); long size =
	 * selectTbSQL.getLong("size"); int rsvAdmNo = selectTbSQL.getInt("rsvAdmNo");
	 * rsvAdmAtcNo = new ReservationAttach(); rsvAdmAtcNo.setNo(rsvAtcNo);
	 * rsvAdmAtcNo.setName(name); rsvAdmAtcNo.setSize(size); ReservationAdm rsvAdm =
	 * new ReservationAdm(); rsvAdm.setNo(rsvAdmNo); rsvAdmAtcNo.setRsvAdm(rsvAdm);
	 * } selectTbSQL.close(); conn.close(); } catch (Exception e) {
	 * e.printStackTrace(); }
	 * 
	 * return rsvAdmAtcNo; }
	 */

}
