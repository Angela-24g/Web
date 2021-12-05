package com.delluna.hotels;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.HashMap;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.delluna.hotels.dataservice_rooms.IRoomDetailDAO;
import com.delluna.hotels.dataservice_rooms.IRoomTypeDAO;
import com.delluna.hotels.dataservice_rooms.IRoomsDAO;
import com.delluna.hotels.manage_paging.IPagingService;
import com.delluna.hotels.manage_rooms.IRoomAdmService;
import com.delluna.hotels.manage_rooms.RoomAdmService;
import com.delluna.hotels.ui_adm.RoomsAdmController;
import com.delluna.hotels.util.BusinessResult;
import com.delluna.hotels.util.RESULTCODE;

import config.MvcConfig;

@ExtendWith({SpringExtension.class, MockitoExtension.class})
@ContextConfiguration(classes = {MvcConfig.class}) //테스트에 사용할 컨텍스트 설정을 담은 클래스 혹은 xml 파일
@WebAppConfiguration
public class RoomsAdmServiceTest {
	
	@Mock IRoomTypeDAO roomTypeDAO;
	@Mock IRoomDetailDAO roomDetailDAO;
	@Mock IRoomsDAO roomsDAO;

	
	@InjectMocks
	private RoomAdmService roomAdmService;
	

	
	@BeforeEach
	void start() {
		roomAdmService = new RoomAdmService();
		roomAdmService.roomTypeDAO = roomTypeDAO;
	}
	
	@Test
	public void test1() throws Exception {
		
		//Mock 객체 초기화
		
		BusinessResult br = roomAdmService.gotoAdmRoomWrite();
		
		Assertions.assertNotNull(roomTypeDAO);
		//Assertions.assertNotNull(roomAdmService.roomTypeDAO);
		Assertions.assertNotNull(br);
		Assertions.assertEquals(br.getCode(), RESULTCODE.정상);
		
	}
	

}
