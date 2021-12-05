package com.delluna.hotels.dataservice_adm;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.delluna.hotels.common_member.Member;
import com.delluna.hotels.util.ConnectionUtil;


@Repository
public class AdmDAO implements IAdmDAO{
	
	public Member memberDetail(int no) {
		String sql = "select * from member where no=?";
		Member member = null;
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		try {

			conn = ConnectionUtil.getConnection();
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, no);
			rs= ptmt.executeQuery();
			rs.next();
			member = new Member();
			member.setNo(rs.getInt("no"));
			member.setName(rs.getString("name"));
			member.setId(rs.getString("id"));
			member.setPw(rs.getString("pw"));
			member.setBirth(rs.getString("birth"));
			member.setTel(rs.getString("tel"));
			member.setEmail(rs.getString("email"));
			member.setFirst_name(rs.getString("first_name"));
			member.setLast_name(rs.getString("last_name"));
			member.setPost(rs.getString("post"));
			member.setAddress(rs.getString("address"));
			member.setDetail_address(rs.getString("detail_address"));
			member.setJdate(rs.getTimestamp("jdate"));
			member.setState(rs.getString("state"));
			member.setGrade(rs.getInt("grade"));
			
			
			
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
		return member; //2반환: 데이터오류
	}
	
	public int memberEdit(Member member) {
		String sql = "update member set id=?, pw=?, name=?, tel=?, email=?, first_name=?, last_name=?,"
				+ " post=?, address=?, detail_address=?, state=?, grade=? where no =?";
		
		Connection conn = null;
		PreparedStatement ptmt = null;
		
		try {

			conn = ConnectionUtil.getConnection();
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, member.getId());
			ptmt.setString(2, member.getPw());
			ptmt.setString(3, member.getName()); // 1:적립 2:사용 3:기한만료 
			ptmt.setString(4, member.getTel());
			ptmt.setString(5, member.getEmail());
			ptmt.setString(6, member.getFirst_name());
			ptmt.setString(7, member.getLast_name());
			ptmt.setString(8, member.getPost());
			ptmt.setString(9, member.getAddress());
			ptmt.setString(10, member.getDetail_address());
			ptmt.setString(11, member.getState());
			ptmt.setInt(12, member.getGrade());
			ptmt.setInt(13, member.getNo());

			return ptmt.executeUpdate(); //1반환 :성공
			
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
	
	public List<Member> admMemberList(int page, int perpage, String col, String kwd){
		 StringBuffer SQL = new StringBuffer();
		 
		 ArrayList<Member> list=new ArrayList<Member>();
		 int startPage = (page-1)*perpage;
		 
		  try {

				Connection conn =  ConnectionUtil.getConnection();
				PreparedStatement psmt = null;
				ResultSet Mrs = null;
				
				if(col.equals("id")) {
					SQL.append("select * from member ");
					SQL.append("where id like ? order by no desc limit ?,?");
					psmt = conn.prepareStatement(SQL.toString());
					psmt.setString(1, "%"+kwd+"%");
					psmt.setInt(2, startPage);
					psmt.setInt(3, perpage);
					Mrs = psmt.executeQuery();
				}
				else if(col.equals("name")) {
					SQL.append("select * from member ");
					SQL.append("where name like ? order by no desc limit ?,?");
					psmt = conn.prepareStatement(SQL.toString());
					psmt.setString(1, "%"+kwd+"%");
					psmt.setInt(2, startPage);
					psmt.setInt(3, perpage);
					Mrs=psmt.executeQuery();
				}
				else if(col.equals("tel")) {
					SQL.append("select * from member ");
					SQL.append("where tel like ? order by no desc limit ?,?");
					psmt = conn.prepareStatement(SQL.toString());
					psmt.setString(1, "%"+kwd+"%");
					psmt.setInt(2, startPage);
					psmt.setInt(3, perpage);
					Mrs=psmt.executeQuery();
				}
				else if(col.equals("email")) {
					SQL.append("select * from member ");
					SQL.append("where email like ? order by no desc limit ?,?");
					psmt = conn.prepareStatement(SQL.toString());
					psmt.setString(1, "%"+kwd+"%");
					psmt.setInt(2, startPage);
					psmt.setInt(3, perpage);
					Mrs=psmt.executeQuery();
				}
				else if(col.equals("birth")) {
					SQL.append("select * from member ");
					SQL.append("where birth like ? order by no desc limit ?,?");
					psmt = conn.prepareStatement(SQL.toString());
					psmt.setString(1, "%"+kwd+"%");
					psmt.setInt(2, startPage);
					psmt.setInt(3, perpage);
					Mrs=psmt.executeQuery();
				}
				else if(col.equals("state")) {
					SQL.append("select * from member ");
					SQL.append("where state like ? order by no desc limit ?,?");
					psmt = conn.prepareStatement(SQL.toString());
					psmt.setString(1, "%"+kwd+"%");
					psmt.setInt(2, startPage);
					psmt.setInt(3, perpage);
					Mrs=psmt.executeQuery();
				}
				

				while(Mrs.next()) {//다음  줄로
				Member member = new Member();
				member.setNo(Mrs.getInt("no"));
				member.setName(Mrs.getString("name"));
				member.setId(Mrs.getString("id"));
				member.setEmail(Mrs.getString("email"));
				member.setTel(Mrs.getString("tel"));
				
				list.add(member);
				}
				
				Mrs.close();
				conn.close();
				}catch(Exception e) { e.printStackTrace(); }
		  
		  return list;			
	}
	
	public int getCount() {
		 String totalSQL="select count(*) as count from member";
		 int total = 0;
		 
		 try {

				Connection conn =  ConnectionUtil.getConnection();
				PreparedStatement psmt = conn.prepareStatement(totalSQL);
					
				psmt.executeQuery();
				ResultSet Trs = psmt.executeQuery(totalSQL);
				Trs.next();
				
				total = Trs.getInt("count");
				
				Trs.close();
				psmt.close();
				conn.close();
			
			
				}catch(Exception e) { e.printStackTrace(); }
		  
		  return total;		
		
	}
	
	public int getCount(String kwd, String col) {
		StringBuffer totalSQL = new StringBuffer();
		totalSQL.append("select count(*) as count from member");
		
		int total = 0;
		 
		try {

				Connection conn =  ConnectionUtil.getConnection();
				PreparedStatement psmt = null;
				ResultSet rs = null;
					
				if(col.equals("id")) {
					totalSQL.append(" where id like ?");
					psmt = conn.prepareStatement(totalSQL.toString());
					psmt.setString(1, "%"+kwd+"%");
					rs = psmt.executeQuery();
					rs.next();
					total = rs.getInt("count");
				}
				else if(col.equals("name")) {
					totalSQL.append(" where name like ?");
					psmt = conn.prepareStatement(totalSQL.toString());
					psmt.setString(1, "%"+kwd+"%");
					rs=psmt.executeQuery();
					rs.next();
					total = rs.getInt("count");
				}
				else if(col.equals("tel")) {
					totalSQL.append(" where tel like ?");
					psmt = conn.prepareStatement(totalSQL.toString());
					psmt.setString(1, "%"+kwd+"%");
					rs=psmt.executeQuery();
					rs.next();
					total = rs.getInt("count");
				}
				else if(col.equals("email")) {
					totalSQL.append(" where email like ?");
					psmt = conn.prepareStatement(totalSQL.toString());
					psmt.setString(1, "%"+kwd+"%");
					rs=psmt.executeQuery();
					rs.next();
					total = rs.getInt("count");
				}
				else if(col.equals("birth")) {
					totalSQL.append(" where birth like ?");
					psmt = conn.prepareStatement(totalSQL.toString());
					psmt.setString(1, "%"+kwd+"%");
					rs=psmt.executeQuery();
					rs.next();
					total = rs.getInt("count");
				}
				else if(col.equals("state")) {
					totalSQL.append(" where state like ?");
					psmt = conn.prepareStatement(totalSQL.toString());
					psmt.setString(1, "%"+kwd+"%");
					rs=psmt.executeQuery();
					rs.next();
					total = rs.getInt("count");
				}
				
				rs.close();
				psmt.close();
				conn.close();
			
			
				}catch(Exception e) { e.printStackTrace(); }
		  
		  return total;		
		
	}
}
