package com.delluna.hotels.dataservice_adm;

import java.util.List;

import com.delluna.hotels.common_member.Member;

public interface IAdmDAO {

	Member memberDetail(int no);
	int memberEdit(Member member);
	List<Member> admMemberList(int page, int perpage, String col, String kwd);
	int getCount();
	int getCount(String kwd, String col);
	
} 
