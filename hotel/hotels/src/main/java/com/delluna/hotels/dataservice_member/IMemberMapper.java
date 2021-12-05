package com.delluna.hotels.dataservice_member;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.delluna.hotels.common_member.Member;

@Mapper
public interface IMemberMapper {
	
	//adm 회원 전체보기
	@Select("select * from member")
	List<Member> selectAll();
	
	//회원가입
	@Insert("insert into member(id,pw,name,birth,tel,email,first_name,last_name,post,address,detail_address,marketing) values(#{id},#{pw},#{name},#{birth},#{tel},#{email},#{first_name},#{last_name},#{post},#{address},#{detail_address},#{marketing})")
	@SelectKey(statement="select last_insert_id()", keyProperty="no", before=false, resultType=int.class)
	void save(Member member);
	
	//회원가입(관리자)
	@Insert("insert into member(id,pw,name,birth,tel,email,first_name,last_name,post,address,detail_address,state,grade) values(#{id},#{pw},#{name},#{birth},#{tel},#{email},#{first_name},#{last_name},#{post},#{address},#{detail_address},#{state},#{grade})")
	@SelectKey(statement="select last_insert_id()", keyProperty="no", before=false, resultType=int.class)
	void saveAdm(Member member);
	
	//아이디중복확인
	@Select("select if(count(*)=1,1,0) from member where id=#{id}")
	boolean isinId(@Param("id")String id);
	
	//이메일중복확인
	@Select("select if(count(*)=1,1,0) from member where email=#{email}")
	boolean isinEmail(@Param("email")String email);

	//로그인1: 아이디,비번,회원상태,회원등급으로 회원 존재하는지                                                            
	@Select("select if(count(*)=1,1,0) from member where id=#{id} and pw=#{pw} and state=#{state} and grade>=#{grade}")
	boolean isIn(@Param("id")String id, @Param("pw")String pw,@Param("state")String state,@Param("grade")int grade);
	//로그인2: 관리자 아이디,비번,회원등급으로 회원 존재하는지                                                            
	@Select("select if(count(*)=1,1,0) from member where id=#{id} and pw=#{pw} and (state=#{state1} or state=#{state2}) and grade>=#{grade}")
	boolean isInAdm(@Param("id")String id, @Param("pw")String pw,@Param("state1")String state1,@Param("state2")String state2,@Param("grade")int grade);
	
	//mypage 회원 이름출력
	@Select("select no,name from member where no=#{no}")
	Member findMember(@Param("no")int no);
	
	//mypage 회원 정보보기
	@Select("select * from member where no=#{no}")
	Member findByNo(@Param("no")int no);

	//전화번호로 입력받아서 전체를비교하고 이름도 비교하여서, 해당 아이디와 회원번호 꺼내기(예약번호로 넘겨줄 것임)
	@Select("select no, id from member where name=#{name} and tel=#{tel} and (state=#{state1} or state=#{state2}) and grade>=#{grade}")
	Member findid(@Param("name")String name, @Param("tel")String tel,@Param("state1")String state1,@Param("state2")String state2,@Param("grade")int grade);
	
	//아이디, 이름, 이메일 주소 받아서 회원 확인하기/해당 데이터가 존재하면 t 아니면 f로 나와야해서 boolean!
	@Select("select if(count(*)=1,1,0) from member where id=#{id} and name=#{name} and email=#{email} and (state=#{state1} or state=#{state2}) and grade>=#{grade}")
	boolean gomail(@Param("id")String id, @Param("name")String name, @Param("email")String email,@Param("state1")String state1,@Param("state2")String state2,@Param("grade")int grade);

	//로그인시 no,name 만 가져와 session 에 올리기                                                                
	@Select("select no,name,grade from member where id=#{id} and pw=#{pw}")
	HashMap<String,Object> islogin(@Param("id")String id, @Param("pw")String password);
	
	//비번 바꾸기
	@Insert("update member set pw=#{pw} where id=#{id}")
	void uppw(@Param("id")String id, @Param("pw")String pw);
	
	//관리자 로그인 가입,대기 상태확인                                                              
	@Select("select if(count(*)=1,1,0) from member where id=#{id} and pw=#{pw} and state=#{state}")
	boolean isApproval(@Param("id")String id, @Param("pw")String pw,@Param("state")String state);


	//관리자 가입,대기,탈퇴 상태 업데이트 - 탈퇴시 이용
	@Update("update member set state=#{state} where no=#{no}")
	void approvalAdm(@Param("state")String state,@Param("no")int no);

	//가입,대기,탈퇴 상태 업데이트 - 탈퇴시 이용
	@Update("update member set state=#{state} where no=#{no}")
	void approval(@Param("state")String state,@Param("no")int no);

	//클라이언트 마이페이지 회원정보수정
	@Update("update member set id=#{id}, pw=#{pw}, name=#{name}, tel=#{tel}, email=#{email}, first_name=#{first_name}, last_name=#{last_name}, "
			+ "post=#{post}, address=#{address}, detail_address=#{detail_address} where no =#{no}")
	void updateMypage(Member member);
	
	//로그인 횟수 나타내기
	@Update("update member set sno=#{sno} where id=#{id}")
	int updatelgno(@Param("sno")int sno, @Param("id")String id);
	
	//id로 정보 가져오기
	@Select("select sno from member where id=#{id}")
	Member findById(String id);
	
}
