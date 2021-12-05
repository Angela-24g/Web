package com.delluna.hotels.dataservice_notice;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.One;

import com.delluna.hotels.common_notice.Qna;
import com.delluna.hotels.common_notice.Qnares;

@Mapper
public interface IQnaMapper {

	
		// qna : 번호, 질문유형, 제목, 내용, 날짜, 작성자
		// rqna: 저장 - 번호, 응답내용, 작성자(회원번호), 상태(대기(평소에는), 완료)
	
	
	//클라이언트 단
	
	//질문 저장
	@Insert("insert into qna(question, title, contents, writer, qsts) values(#{question},#{title},#{contents}, #{writer.no}, #{qsts})")
	int save(Qna qna); 
	
	//질문 숫자 제한하여 가져오기
	@Select("select * from qna order by no desc limit #{start}, #{cnt}")
	@Results(value= {
   			@Result(property="no",column="no"),
   			@Result(property="question",column="question"),
   			@Result(property="title",column="title"),
   			@Result(property="contents",column="contents"),
   			@Result(property="wdate",column="wdate"),
   			@Result(property="qsts",column="qsts"),
   			@Result(property="writer",column="writer",one=@One(select="com.delluna.hotels.dataservice_member.IMemberMapper.findByNo"))
   			})
	List<Qna> SelectALL(@Param("start") int start,@Param("cnt") int cnt);
	
	//질문 목록 찾기
	@Select("select * from qna where writer = #{writer} order by no desc")
	List<Qna> selectAll(@Param("writer")int writer);
	
	@Select("select * from qna order by no desc")
	@Results(value= {
   			@Result(property="no",column="no"),
   			@Result(property="question",column="question"),
   			@Result(property="title",column="title"),
   			@Result(property="contents",column="contents"),
   			@Result(property="wdate",column="wdate"),
   			@Result(property="qsts",column="qsts"),
   			@Result(property="writer",column="writer",one=@One(select="com.delluna.hotels.dataservice_member.IMemberMapper.findByNo"))
   			})
	List<Qna> select();
	//관리자 단 
   
	    //전체 리스트 뽑기(답변)
    	@Select("select * from rqna order by no desc limit #{start}, #{cnt}")
	    List<Qnares> Select(@Param("start") int start,@Param("cnt") int cnt);
		//답변 개수 
    	@Select("select count(*) from rqna")
    	public int qrCount();
    	
	    @Select("select * from qna where no=#{no}")
	    Qna findByNo(@Param("no")int no);
	    
	   
		//질문 삭제(마이페이지에서 하시면 됩니다)
	    @Delete("delete from qna where no=#{no}")
		void delete(@Param("no")int no);

	    //답변 삭제(글번호로 맞춰서!)
	    @Delete("delete from rqna where qno=#{qno}")
		void deleteR(@Param("qno") int qno);
	    
	    //답변 저장하기
		@Insert("insert into rqna(response,subject,qno,qstate) values(#{response},#{subject},#{qno},#{qstate})")
		void saverqna(Qnares qnares);
	    //답변 번호 확인하기(이미 작성한 번호가 있는지 확인)
		@Select("select * from rqna")
		Qnares getRqno();
		//답변 상태 업데이트하기(qna에!)
		@Update("update qna left join rqna on qna.no=rqna.qno set qna.qsts=#{qsts},rqna.qstate=#{qstate} where qna.no=#{no}")
		void udState(@Param("qstate") String qstate,@Param("qsts") String qsts, @Param("no") int no);
		//답변에 대한 데이터 가져오기
		@Select("select * from rqna where qno=#{qno}") 
		Qnares findByQno(@Param("qno")int qno);
		//질문 갯수 세기
		@Select("select count(*) from qna")
		public int getCount();
		//답변 수정
		@Update("update rqna set response=#{response} where qno=#{qno}")
		void udateResp(@Param("response") String response, @Param("qno") int qno );
		//답변 삭제(선택한 답변 삭제하기)(그리고 답변 대기로 바꿀 것) - update구문 mapper 이용하기
		@Delete("delete from rqna where no=#{no}")
		void deleteResp(@Param("no") int no);
}
