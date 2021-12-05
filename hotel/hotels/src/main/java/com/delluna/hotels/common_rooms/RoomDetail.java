package com.delluna.hotels.common_rooms;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class RoomDetail {
	private int roomdetail_no;
	private String room_view;
	private String room_location;
	private String room_bedtype;
	private int room_price;
	private MultipartFile thumbnailFile;
	private String room_thumb_name;
	private long room_thumb_size;
	private RoomType roomType;
	private int room_type_no;
	
	/* 1 대 다 RoomDetail : RoomImage */
	private List<MultipartFile> attachFiles;
	private List<RoomImage> roomImages;
	
	/* 1 대 다 RoomDetail : Rooms */
	private List<String> room_numbers;
	private List<Rooms> rooms;
	
	public RoomType getRoomType() {
		return roomType;
	}
	public void setRoomType(RoomType roomType) {
		this.roomType = roomType;
	}
	
	public String getRoom_view() {
		return room_view;
	}
	public void setRoom_view(String room_view) {
		this.room_view = room_view;
	}
	public String getRoom_location() {
		return room_location;
	}
	public void setRoom_location(String room_location) {
		this.room_location = room_location;
	}
	public String getRoom_bedtype() {
		return room_bedtype;
	}
	public void setRoom_bedtype(String room_bedtype) {
		this.room_bedtype = room_bedtype;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}
	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}
	public String getRoom_thumb_name() {
		if(!(thumbnailFile == null)) {
			this.room_thumb_name = this.thumbnailFile.getOriginalFilename();
		}
		return room_thumb_name;
	}
	public void setRoom_thumb_name(String room_thumb_name) {
		this.room_thumb_name = room_thumb_name;
	}
	public long getRoom_thumb_size() {
		if(!(thumbnailFile==null)) {
			this.room_thumb_size = this.thumbnailFile.getSize();
		}
		return this.room_thumb_size;
	}
	public void setRoom_thumb_size(long room_thumb_size) {
		this.room_thumb_size = room_thumb_size;
	}
	
	/* 1 대 다 RoomDetail : RoomImage */
	public List<MultipartFile> getAttachFiles() {
		return attachFiles;
	}
	public void setAttachFiles(List<MultipartFile> attachFiles) {
		this.attachFiles = attachFiles;
	}
	public List<RoomImage> getRoomImages() {
		if(attachFiles != null && this.roomImages == null) {
			this.roomImages = new ArrayList<RoomImage>();
			for(MultipartFile files:attachFiles) {
				RoomImage image = new RoomImage();
				image.setName(files.getOriginalFilename());
				image.setSize(files.getSize());
				image.setRoomDetail(this);
				
				roomImages.add(image);
			}
		}
		return roomImages;
	}
	public void setRoomImages(List<RoomImage> roomImages) {
		for(int i = 0 ; i < roomImages.size(); i++) {
			roomImages.get(i).setRoomDetail(this);
		}
		this.roomImages = roomImages;
	}
	
	/* 1 대 다 RoomDetail : Rooms */

	public List<String> getRoom_numbers() {
		return room_numbers;
	}
	public void setRoom_numbers(List<String> room_numbers) {
		this.room_numbers = room_numbers;
	}
	
	public List<Rooms> getRooms() {
		if(room_numbers != null && this.rooms == null) {
			this.rooms = new ArrayList<Rooms>();
			for(int i = 0; i < room_numbers.size(); i++) {
				Rooms room = new Rooms();
				room.setRoomDetail(this);
				
				String room_number = room_numbers.get(i);
				room.setRoom_number(room_number);
				
				rooms.add(room);
			}
		}
		return rooms;
	}
	public void setRooms(List<Rooms> rooms) {
		for(int i = 0 ; i < rooms.size(); i++) {
			rooms.get(i).setRoomDetail(this);
		}
		this.rooms = rooms;
	}
	public int getRoom_type_no() {
		return room_type_no;
	}
	public void setRoom_type_no(int room_type_no) {
		this.room_type_no = room_type_no;
	}
	public int getRoomdetail_no() {
		return roomdetail_no;
	}
	public void setRoomdetail_no(int roomdetail_no) {
		this.roomdetail_no = roomdetail_no;
	}
	
	
}
