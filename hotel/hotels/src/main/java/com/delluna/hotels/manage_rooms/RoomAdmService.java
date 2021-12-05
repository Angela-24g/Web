package com.delluna.hotels.manage_rooms;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import com.delluna.hotels.common_reservation.RezAdmRoomType;
import com.delluna.hotels.common_rooms.RoomDetail;
import com.delluna.hotels.common_rooms.RoomType;
import com.delluna.hotels.common_rooms.Rooms;
import com.delluna.hotels.dataservice_rooms.IRoomDetailDAO;
import com.delluna.hotels.dataservice_rooms.IRoomTypeDAO;
import com.delluna.hotels.dataservice_rooms.IRoomsDAO;
import com.delluna.hotels.manage_paging.PagingService;
import com.delluna.hotels.util.BusinessResult;
import com.delluna.hotels.util.RESULTCODE;

@Service("roomAdmService")
public class RoomAdmService implements IRoomAdmService{
	
	@Autowired @Qualifier("roomTypeDAO")public IRoomTypeDAO roomTypeDAO;
	@Autowired @Qualifier("roomDetailDAO") IRoomDetailDAO roomDetailDAO;
	@Autowired @Qualifier("roomsDAO") IRoomsDAO roomsDAO;
	
	@Override
	public BusinessResult gotoAdmMainList() {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		List<Integer> roomTypeNumbers = roomTypeDAO.selectAllNo();
		List<String> deluxeImages = new ArrayList<String>();
		List<String> predeluxeImages = new ArrayList<String>();
		List<String> suiteImages = new ArrayList<String>();
		
		List<String> deluxeView = new ArrayList<String>();
		List<String> predeluxeView = new ArrayList<String>();
		List<String> suiteView = new ArrayList<String>();
		
		for(int room_type_no:roomTypeNumbers) {
			List<RoomDetail> roomDetails = roomDetailDAO.selectDtThumbnail(room_type_no);
			for(RoomDetail roomDetail:roomDetails) {
				String room_view = roomDetail.getRoom_view();
				String room_thumb_name = roomDetail.getRoom_thumb_name();
				//long room_thumb_size = (long)map.get("room_thumb_size");
				if(room_type_no==1) {
					deluxeImages.add(room_thumb_name);
					deluxeView.add(room_view);
				}else if(room_type_no==2) {
					predeluxeImages.add(room_thumb_name);
					predeluxeView.add(room_view);
				}else if(room_type_no==3) {
					suiteImages.add(room_thumb_name);
					suiteView.add(room_view);
				}
			}
			hashMap.put("디럭스뷰", deluxeView);
			hashMap.put("프리미엄 디럭스뷰", predeluxeView);
			hashMap.put("스위트뷰", suiteView);
			
			hashMap.put("디럭스", deluxeImages);
			hashMap.put("프리미엄 디럭스", predeluxeImages);
			hashMap.put("스위트", suiteImages);
		}
		return new BusinessResult(hashMap);
	}
	
	@Override
	@Transactional
	public BusinessResult gotoAdmRoomsList(int page,String col,String kwd) {
		List<Rooms> rooms = null;
		if(kwd == null) {
			rooms = roomsDAO.selectRooms(page, 10,"", "");
		}
		else {
			rooms = roomsDAO.selectRooms(page,10,col,kwd);
			if(rooms==null) {
				return new BusinessResult(RESULTCODE.존재하지않는검색결과,"");
			}
		}
		
		return new BusinessResult(rooms);
	}

	@Override
	@Transactional
	public BusinessResult gotoAdmRoomWrite() {
		
		return new BusinessResult();
	}
	
	@Override
	@Transactional
	public BusinessResult gotoAdmRoomTypeWrite() {
		return new BusinessResult();
	}
	@Override
	@Transactional
	public BusinessResult registerRoomType(RoomType roomType,RoomDetail roomDetail,HttpServletRequest request) {
		
		int roomType_no = 0;
		String path = "";
		String 새경로 ="";
		try {
//			룸타입 저장
			// 존재하지 않은 타입일 때 저장
			if(!roomTypeDAO.isInType(roomType.getType())) {
				
				roomTypeDAO.save(roomType); //저장하면 PK 값 가져옴
				roomType_no = roomType.getNo();
			}else {
				// 존재하는 타입일 시 번호만 가져오기
				roomType_no =roomTypeDAO.selectNo(roomType.getType());
			}
			
//			룸디테일 저장
			roomDetail.setRoomType(roomType);
			roomDetail.getRoomType().setNo(roomType_no);
			roomDetailDAO.save(roomDetail);
			
			//썸네일 저장
			if(roomDetail.getThumbnailFile() != null) {
				/* 서버실제경로/upload 폴더생성 */
				path = request.getSession().getServletContext().getRealPath("/upload");
				File buildFolder = new File(path);
				buildFolder.mkdir();
				
				/* 서버실제경로/upload/rooms 폴더생성 */
				path = request.getSession().getServletContext().getRealPath("/upload/rooms");
				File buildFolder2 = new File(path);
				buildFolder2.mkdir();
				
				/* 서버실제경로/upload/rooms/no 폴더생성 */
				새경로 = path + "//" + roomType_no;
				File folder = new File(새경로);
				folder.mkdir();
				
				
				MultipartFile multipartFile = roomDetail.getThumbnailFile();

				//IE has file path
				String uploadFileName = multipartFile.getOriginalFilename();
//				
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
				
				File file = new File(새경로 + "//" + uploadFileName);
				
				try {
					multipartFile.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			//세부이미지 저장
			if(roomDetail.getAttachFiles() != null) {
				for(MultipartFile multipartFile: roomDetail.getAttachFiles()) {
					//IE has file path
					String uploadFileName = multipartFile.getOriginalFilename();
					
					File file = new File(새경로 + "//" + uploadFileName);
					
					try {
						multipartFile.transferTo(file);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return new BusinessResult();
	}

	@Override
	public BusinessResult registerRooms(RoomDetail roomDetail) {
		int roomdetail_no = roomDetailDAO.BedtypeForNo(roomDetail);
		
		roomDetail.setRoomdetail_no(roomdetail_no);
		roomsDAO.saveRooms(roomDetail.getRooms());
		return new BusinessResult();
	}

	@Override
	public BusinessResult getRoomDetailsAdm(RoomDetail roomDetail) {
		//room_type 전체 가져오기
		String html = "";
		
		try {
			
			//해당 룸타입의 뷰 꺼내기
			List<RoomDetail> roomViews = roomDetailDAO.selectView(roomDetail);
			
			html ="<dl class=\"form_block\">\r\n<dt>뷰 *</dt>\r\n<dd>\r\n";
			for(int i = 0; i < roomViews.size(); i++) {
				html += "<div class=\"radioBox\">\r\n" + 
						"<input type=\"radio\" id=\"VIEWTYPE" + i + "\" name=\"room_view\" tabindex=\"0\" value=\"" + roomViews.get(i).getRoom_view() + "\" onclick=\"fnCView();\">"+
						"<label for=\"VIEWTYPE" + i + "\">" + roomViews.get(i).getRoom_view() + "</label>\r\n" + 
						"</div>\r\n";
			}
			
			//해당 룸타입의 위치 꺼내기
			List<RoomDetail> roomLocations = roomDetailDAO.firstLocation(roomDetail);
			html += "</dd>\r\n</dl>\r\n<dl class=\"form_block\">\r\n<dt>위치 *</dt>\r\n<dd id=\"locationRadio\">\r\n";
			for(int i = 0; i < roomLocations.size(); i++) {
				html += "<div class=\"radioBox\">\r\n" + 
						"<input type=\"radio\" id=\"LOCATION" + i + "\" name=\"room_location\" tabindex=\"0\" value=\"" + roomLocations.get(i).getRoom_location() + "\" disabled=\"disabled\">" +
						"<label for=\"LOCATION" + i + "\">" + roomLocations.get(i).getRoom_location() + "</label>\r\n" +
						"</div>\r\n";
			}
						
				
			//해당 룸타입의 베드타입 꺼내기		
			List<RoomDetail> roomBedtypes = roomDetailDAO.firstBedtype(roomDetail);
						
			html += "</dd>\r\n</dl>\r\n<dl class=\"form_block\">\r\n<dt>베드타입 *</dt>\r\n<dd id=\"bedRadio\">\r\n"; 
			for(int i = 0; i < roomBedtypes.size(); i++) {
				html += "<div class=\"radioBox\">\r\n" + 
						"<input type=\"radio\" id=\"BEDTYPE" + i + "\" name=\"room_bedtype\" tabindex=\"0\" value=\"" + roomBedtypes.get(i).getRoom_bedtype() + "\" disabled=\"disabled\">\r\n" + 
						"<label for=\"BEDTYPE" + i + "\">" + roomBedtypes.get(i).getRoom_bedtype() + "</label>\r\n" + 
						"</div>\r\n";
			}
					
			html += "</dd>\r\n</dl>\r\n</div>";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return new BusinessResult(html);
	}

}
