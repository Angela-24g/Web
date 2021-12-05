package com.delluna.hotels.dataservice_restaurants;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.delluna.hotels.common_restaurants.Restaurants;
import com.delluna.hotels.common_restaurants.RestaurantsNon;
import com.delluna.hotels.util.ConnectionUtil;

@Repository
public class RestaurantsDAO implements IRestaurantsDAO {
	@Autowired
	IRestaurantsMapper restaurantsMapper;

	@Override
	@Transactional
	public void save(Restaurants restaurants) { // 예약내용저장
		restaurantsMapper.save(restaurants);
	}
	
	@Override
	@Transactional
	public void saveNon(RestaurantsNon restaurantsNon) { // 비회원예약내용저장
		restaurantsMapper.saveNon(restaurantsNon);
	}

	@Override
	@Transactional
	public void editRt(Restaurants rtUpdate) {
		restaurantsMapper.editRt(rtUpdate);
	}

	@Override
	@Transactional
	public List<Restaurants> selectAll() {
		return restaurantsMapper.selectAll();
	}
	
	@Override
	@Transactional
	public void update(String state, int no) {
		restaurantsMapper.updateRt(state, no);
	}

	@Override
	@Transactional
	public List<Restaurants> selectAllByMemberNo(int member_no) {
		return restaurantsMapper.selectAllByMemberNo(member_no);
	}

	@Override
	@Transactional
	public Restaurants findByNo(int no) {
		return restaurantsMapper.findByNo(no);
	}

	@Override
	@Transactional
	public Restaurants findByPrev(int no) {
		return restaurantsMapper.findByPrev(no);
	}

	@Override
	@Transactional
	public Restaurants findByNext(int no) {
		return restaurantsMapper.findByNext(no);
	}

	@Override
	@Transactional
	public void delete(int no) {
		restaurantsMapper.delete(no);
	}

	@Override
	public List<Restaurants> selectPage(int page, int perpage, String col, String kwd) {
		StringBuffer SQL = new StringBuffer();

		ArrayList<Restaurants> list = new ArrayList<Restaurants>();
		int startPage = (page - 1) * perpage;

		try {

			Connection conn = ConnectionUtil.getConnection();
			PreparedStatement psmt = null;
			ResultSet Mrs = null;

			if (col.equals("name")) {
				SQL.append("select * from restaurants ");
				SQL.append("where name like ? order by no desc limit ?,?");
				psmt = conn.prepareStatement(SQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				psmt.setInt(2, startPage);
				psmt.setInt(3, perpage);
				Mrs = psmt.executeQuery();
			} else if (col.equals("tel")) {
				SQL.append("select * from restaurants ");
				SQL.append("where tel like ? order by no desc limit ?,?");
				psmt = conn.prepareStatement(SQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				psmt.setInt(2, startPage);
				psmt.setInt(3, perpage);
				Mrs = psmt.executeQuery();
			} else if (col.equals("restaurant_name")) {
				SQL.append("select * from restaurants ");
				SQL.append("where restaurant_name like ? order by no desc limit ?,?");
				psmt = conn.prepareStatement(SQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				psmt.setInt(2, startPage);
				psmt.setInt(3, perpage);
				Mrs = psmt.executeQuery();
			} else if (col.equals("date_reserve")) {
				SQL.append("select * from restaurants ");
				SQL.append("where date_reserve like ? order by no desc limit ?,?");
				psmt = conn.prepareStatement(SQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				psmt.setInt(2, startPage);
				psmt.setInt(3, perpage);
				Mrs = psmt.executeQuery();
			} else if (col.equals("state")) {
				SQL.append("select * from restaurants ");
				SQL.append("where state like ? order by no desc limit ?,?");
				psmt = conn.prepareStatement(SQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				psmt.setInt(2, startPage);
				psmt.setInt(3, perpage);
				Mrs = psmt.executeQuery();
			}

			while (Mrs.next()) {// 다음 줄로
				Restaurants restaurants = new Restaurants();
				restaurants.setNo(Mrs.getInt("no"));
				restaurants.setName(Mrs.getString("name"));
				restaurants.setRestaurant_name(Mrs.getString("restaurant_name"));
				restaurants.setDate_reserve(Mrs.getString("date_reserve"));

				list.add(restaurants);
			}

			Mrs.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int getCount() {
		return restaurantsMapper.getCount();
	}

	@Override
	public int getCount(String kwd, String col) {
		StringBuffer totalSQL = new StringBuffer();
		totalSQL.append("select count(*) as count from restaurants");

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
			} else if (col.equals("restaurant_name")) {
				totalSQL.append(" where restaurant_name like ?");
				psmt = conn.prepareStatement(totalSQL.toString());
				psmt.setString(1, "%" + kwd + "%");
				rs = psmt.executeQuery();
				rs.next();
				total = rs.getInt("count");
			} else if (col.equals("date_reserve")) {
				totalSQL.append(" where date_reserve like ?");
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

	@Override
	public RestaurantsNon selectNonall(String name, String tel) {
		return restaurantsMapper.selectNonall(name, tel);
	}

	@Override
	public List<RestaurantsNon> selectNonAll(String name, String tel) {
		return restaurantsMapper.selectNonAll(name, tel);
	}

	@Override
	public int resNo() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateRt1(String state, int no) {
		restaurantsMapper.updateRt1(state, no);
		
	}

	@Override
	public boolean isnon(String name, String tel) {
		// TODO Auto-generated method stub
		return restaurantsMapper.isnon(name, tel);
	}

}
