package com.delluna.hotels;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.HashMap;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.delluna.hotels.manage_rooms.IRoomAdmService;
import com.delluna.hotels.ui_adm.RoomsAdmController;
import com.delluna.hotels.util.BusinessResult;

import config.MvcConfig;

@ExtendWith({SpringExtension.class, MockitoExtension.class})
@ContextConfiguration(classes = {MvcConfig.class}) //테스트에 사용할 컨텍스트 설정을 담은 클래스 혹은 xml 파일
@WebAppConfiguration
public class RoomsAdmControllerTest {
	@Mock
	private IRoomAdmService roomAdmService;
	
	@InjectMocks
	private RoomsAdmController roomsAdmController;
	
	private MockMvc mockMvc;
	
	@BeforeEach
	void encoding() {
		mockMvc = MockMvcBuilders.standaloneSetup(roomsAdmController)
				.addFilter(new CharacterEncodingFilter("UTF-8",true))
				.build();
	}
	
	@Test
	public void gotoAdmMainListTest() throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("디럭스", "디럭스이미지이름");
		
		BusinessResult br=new BusinessResult(map);
		
		Mockito.when(   roomAdmService.gotoAdmMainList()  ).thenReturn(br);
		
		mockMvc.perform(get("/adm/rooms/mainList"))
		.andExpect(status().isOk())
		//.andExpect(MockMvcResultMatchers.model().size(0))
		.andExpect(view().name("adm/adm-rooms-mainList"))
		.andExpect(model().attribute("css","adm/adm-rooms-list.css"));
//		.andExpect(model().attribute("deluxeCity","1555489275637.jpg"));
	}
	

}
