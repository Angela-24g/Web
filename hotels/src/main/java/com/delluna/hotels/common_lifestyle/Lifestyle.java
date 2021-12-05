package com.delluna.hotels.common_lifestyle;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public class Lifestyle {
	private int no;
	private String type;
	private String subtype;
	private String name;
	private String info;
	private String info_detail;
	private String guide;
	private String hours;
	private String location;
	private String contact;
	private Timestamp wdate;
	private Timestamp modify_date;
	
	//1 대 다 관계 = Lifestyle : LifestyleImage
	private List<MultipartFile> imagesFiles;
	private List<LifestyleImage> lifestyleImages;
	
	//1 대 다 관계 = Lifestyle : LifestylePrice
	private List<String> price_types;
	private List<String> prices;
	private List<LifestylePrice> lifestylePrices;
	
	//1 대 다 관계 = Lifestyle : LifestyleFacility
	private List<MultipartFile> facilityFiles;
	private List<String> facility_titles;
	private List<String> facility_infos;
	private List<LifestyleFacility> lifestyleFacilities;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSubtype() {
		return subtype;
	}
	public void setSubtype(String subtype) {
		this.subtype = subtype;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getInfo_detail() {
		return info_detail;
	}
	public void setInfo_detail(String info_detail) {
		this.info_detail = info_detail;
	}
	public String getGuide() {
		return guide;
	}
	public void setGuide(String guide) {
		this.guide = guide;
	}
	public String getHours() {
		return hours;
	}
	public void setHours(String hours) {
		this.hours = hours;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public Timestamp getWdate() {
		return wdate;
	}
	public void setWdate(Timestamp wdate) {
		this.wdate = wdate;
	}
	public Timestamp getModify_date() {
		return modify_date;
	}
	public void setModify_date(Timestamp modify_date) {
		this.modify_date = modify_date;
	}
	
	//1 대 다 관계 = Lifestyle : LifestyleImage	
	public List<MultipartFile> getImagesFiles() {
		return imagesFiles;
	}
	public void setImagesFiles(List<MultipartFile> imagesFiles) {
		this.imagesFiles = imagesFiles;
	}
	public List<LifestyleImage> getLifestyleImages() {
		if(this.lifestyleImages != null) {
			//update & insert 시
			for(LifestyleImage lifestyleImage:lifestyleImages) {
				lifestyleImage.setLifestyle(this);
			}

		//insert만 할 때(처음 추가시)
		}else if(imagesFiles != null && this.lifestyleImages == null) {
			this.lifestyleImages = new ArrayList<LifestyleImage>();
			for(MultipartFile files:imagesFiles) {
				LifestyleImage image = new LifestyleImage();
				image.setName(files.getOriginalFilename());
				image.setSize(files.getSize());
				image.setLifestyle(this);
				
				lifestyleImages.add(image);
			}
		}
		return lifestyleImages;
	}
	public void setLifestyleImages(List<LifestyleImage> lifestyleImages) {
		for(int i = 0 ; i < lifestyleImages.size(); i++) {
			lifestyleImages.get(i).setLifestyle(this);
		}
		this.lifestyleImages = lifestyleImages;
	}
	
	//1 대 다 관계 = Lifestyle : LifestylePrice	
	public List<String> getPrice_types() {
		return price_types;
	}
	public void setPrice_types(List<String> price_types) {
		if(price_types!=null) {
		this.price_types = price_types;
		}
	}
	public List<String> getPrices() {
		return prices;
	}
	public void setPrices(List<String> prices) {
		this.prices = prices;
	}
	
	public List<LifestylePrice> getLifestylePrices() {
		//update & insert 문을 위해
		if(this.lifestylePrices != null) {
			for(LifestylePrice lifestylePrice: this.lifestylePrices) {
				lifestylePrice.setLifestyle(this);
			}
		
		}
		if(price_types != null && this.lifestylePrices == null) {
			this.lifestylePrices = new ArrayList<LifestylePrice>();
			for(int i = 0; i < price_types.size(); i++) {
				LifestylePrice lifestylePrice = new LifestylePrice();
				lifestylePrice.setLifestyle(this);
				
				String price_type = price_types.get(i);
				price_type = price_type.replace("\r\n", "<br>");
				lifestylePrice.setPrice_type(price_type);
				
				String price = prices.get(i);
				lifestylePrice.setPrice(price);	
				
				lifestylePrices.add(lifestylePrice);
			}
		}
		
		return lifestylePrices;
	}
	public void setLifestylePrices(List<LifestylePrice> lifestylePrices) {
		for(int i = 0 ; i < lifestylePrices.size(); i++) {
			lifestylePrices.get(i).setLifestyle(this);
		}
		this.lifestylePrices = lifestylePrices;
	}
	
	//1 대 다 관계 = Lifestyle : LifestyleFacility
	public List<MultipartFile> getFacilityFiles() {
		return facilityFiles;
	}
	public void setFacilityFiles(List<MultipartFile> facilityFiles) {
		this.facilityFiles = facilityFiles;
	}
	public List<String> getFacility_titles() {
		return facility_titles;
	}
	public void setFacility_titles(List<String> facility_titles) {
		List<String> forBr = new ArrayList<String>();
		for(String facility_title:facility_titles) {
			facility_title = facility_title.replace("\r\n", "<br>");
			forBr.add(facility_title);
		}
		this.facility_titles = forBr;
	}
	public List<String> getFacility_infos() {
		return facility_infos;
	}
	public void setFacility_infos(List<String> facility_infos) {
		List<String> forBr = new ArrayList<String>();
		for(String facility_info:facility_infos) {
			facility_info = facility_info.replace("\r\n", "<br>");
			forBr.add(facility_info);
		}
		this.facility_infos = facility_infos;
	}
	public List<LifestyleFacility> getLifestyleFacilities() {
		if(this.lifestyleFacilities != null) {
			//update & insert 시
			for(LifestyleFacility lifestyleFacility:lifestyleFacilities) {
				lifestyleFacility.setLifestyle(this);
			}

		//insert만 할 때(처음 추가시)
		}else if(facilityFiles != null && this.lifestyleFacilities == null) {
			this.lifestyleFacilities = new ArrayList<LifestyleFacility>();
			for(int i = 0; i<facilityFiles.size(); i++) {
				LifestyleFacility facility = new LifestyleFacility();
				facility.setLifeFacility_image_name(facilityFiles.get(i).getOriginalFilename());
				facility.setLifeFacility_image_size(facilityFiles.get(i).getSize());
				facility.setLifeFacility_title(facility_titles.get(i));
				facility.setLifeFacility_info(facility_infos.get(i));
				facility.setLifestyle(this);
				
				lifestyleFacilities.add(facility);
			}
		}
		
		return lifestyleFacilities;
	}
	public void setLifestyleFacilities(List<LifestyleFacility> lifestyleFacilities) {
		for(int i = 0 ; i < lifestyleFacilities.size(); i++) {
			lifestyleFacilities.get(i).setLifestyle(this);
		}
		this.lifestyleFacilities = lifestyleFacilities;
	}
}
