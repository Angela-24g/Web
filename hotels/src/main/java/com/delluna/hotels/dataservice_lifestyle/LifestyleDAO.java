package com.delluna.hotels.dataservice_lifestyle;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.delluna.hotels.common_lifestyle.Lifestyle;
import com.delluna.hotels.common_lifestyle.LifestyleFacility;
import com.delluna.hotels.common_lifestyle.LifestyleImage;
import com.delluna.hotels.common_lifestyle.LifestylePrice;

@Repository
public class LifestyleDAO implements ILifestyleDAO {
	@Autowired ILifestyleMapper lifestyleMapper;
	@Autowired ILifestyleImageMapper lifestyleImageMapper;
	@Autowired ILifestylePriceMapper lifestylePriceMapper;
	@Autowired ILifestyleFacilityMapper lifestyleFacilityMapper;
	
	@Override
	@Transactional
	public void save(Lifestyle lifestyle) {
		if(lifestyle.getInfo()!=null) {
			lifestyle.setInfo(lifestyle.getInfo().replace("\r\n","<br>"));
		}
		if(lifestyle.getInfo_detail()!=null) {
			lifestyle.setInfo_detail(lifestyle.getInfo_detail().replace("\r\n","<br>"));
		}
		
		if(lifestyle.getGuide()!=null) {
			lifestyle.setGuide(lifestyle.getGuide().replace("\r\n","<br>"));
		}
		if(lifestyle.getHours()!=null) {
			lifestyle.setHours(lifestyle.getHours().replace("\r\n","<br>"));
		}
		if(lifestyle.getLocation()!=null) {
			lifestyle.setLocation(lifestyle.getLocation().replace("\r\n","<br>"));
		}
		
		lifestyleMapper.save(lifestyle);
		
		if(lifestyle.getLifestylePrices() != null) {
		lifestylePriceMapper.savePrices(lifestyle.getLifestylePrices());
		}
		if(lifestyle.getImagesFiles() != null) {
			lifestyleImageMapper.saveImages(lifestyle.getLifestyleImages());
		}
		if(lifestyle.getFacilityFiles() != null) {
			lifestyleFacilityMapper.saveFacility(lifestyle.getLifestyleFacilities());
		}
	}
	@Override
	@Transactional
	public List<Lifestyle> selectAll() {
		
		return lifestyleMapper.selectAll();
	}
	@Override
	public Lifestyle selectLifestyleByNo(int no) {
		Lifestyle lifestyle = lifestyleMapper.selectLifestyleByNo(no);
		
		return lifestyle;
	}

	@Override
	@Transactional
	public Lifestyle selectSsub(String type, String subtype) {
		
		return lifestyleMapper.selectSsub(type, subtype);
	}

	@Override
	@Transactional
	public void updateLifestyle(Lifestyle lifestyle) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		lifestyle.setModify_date(Timestamp.valueOf(sdf.format(timestamp)));
		
		if(lifestyle.getInfo()!=null) {
			lifestyle.setInfo(lifestyle.getInfo().replace("\r\n","<br>"));
		}
		if(lifestyle.getInfo_detail()!=null) {
			lifestyle.setInfo_detail(lifestyle.getInfo_detail().replace("\r\n","<br>"));
		}
		
		lifestyleMapper.updateLifestyle(lifestyle);
		//이미지 수정
		if(lifestyle.getLifestyleImages() != null) {
			
			//새파일 추가시
			if(lifestyle.getImagesFiles() != null) {
				for(MultipartFile multipartFile: lifestyle.getImagesFiles()) {
					LifestyleImage image = new LifestyleImage();
					image.setLifestyle(lifestyle);
					image.setName(multipartFile.getOriginalFilename());
					image.setSize(multipartFile.getSize());
					
					lifestyle.getLifestyleImages().add(image);
				}
			}
			//update & insert 코드
			lifestyleImageMapper.upInsertLifestyleImages(lifestyle.getLifestyleImages());
		}
		
		//가격 수정
		if(lifestyle.getLifestylePrices() != null) {
			//가격 추가시
			if(lifestyle.getPrice_types() != null) {
				for(int i = 0; i < lifestyle.getPrice_types().size(); i++) {
					LifestylePrice lifestylePrice = new LifestylePrice();
					lifestylePrice.setLifestyle(lifestyle);
					
					String price_type = lifestyle.getPrice_types().get(i);
					price_type = price_type.replace("\r\n", "<br>");
					lifestylePrice.setPrice_type(price_type);
					
					String price = lifestyle.getPrices().get(i);
					lifestylePrice.setPrice(price);	
					
					lifestyle.getLifestylePrices().add(lifestylePrice);
				}
				
			}
			//update & insert 코드
			lifestylePriceMapper.upInsertLifestylePrice(lifestyle.getLifestylePrices());
		}
		//세부시설 수정
		if(lifestyle.getLifestyleFacilities() != null) {
			
			//새파일 추가시
			if(lifestyle.getFacilityFiles() != null) {
				for(int i=0; i<lifestyle.getFacilityFiles().size();i++) {
					LifestyleFacility facility = new LifestyleFacility();
					facility.setLifeFacility_image_name(lifestyle.getFacilityFiles().get(i).getOriginalFilename());
					facility.setLifeFacility_image_size(lifestyle.getFacilityFiles().get(i).getSize());
					facility.setLifeFacility_title(lifestyle.getFacility_titles().get(i));
					facility.setLifeFacility_info(lifestyle.getFacility_infos().get(i));
					facility.setLifestyle(lifestyle);
					
					lifestyle.getLifestyleFacilities().add(facility);
				}
			}
			
			//update & insert 코드
			lifestyleFacilityMapper.upInsertLifestyleFacility(lifestyle.getLifestyleFacilities());
		}
	}
	@Override
	public void deleteLifestyle(int lifestyle_no) {
		lifestyleImageMapper.deleteAllLifestyleImage(lifestyle_no);
		lifestylePriceMapper.deleteAllLifestylePrice(lifestyle_no);
		lifestyleFacilityMapper.deleteAllLifestyleFacility(lifestyle_no);
		lifestyleMapper.deleteLifestyle(lifestyle_no);
	}
	
	@Override
	public void deleteLifestyleDt(Lifestyle lifestyle) {
		lifestyleImageMapper.deleteLifestyleImage(lifestyle.getNo(),lifestyle.getLifestyleImages());
		lifestylePriceMapper.deleteLifestylePrice(lifestyle.getNo(),lifestyle.getLifestylePrices());
		lifestyleFacilityMapper.deleteLifestyleFacility(lifestyle.getNo(),lifestyle.getLifestyleFacilities());
		
	}
	@Override
	public int countAll() {
		return lifestyleMapper.countAll();
	}
	@Override
	public int getCount(String type) {
		return lifestyleMapper.getCount(type);
	}
	@Override
	public List<Lifestyle> selectLifeLimit(int page, int perpage) {
		int startPage = (page-1)*perpage;
		return lifestyleMapper.selectLifeLimit(startPage, perpage);
	}
	@Override
	public List<Lifestyle> selectKwdLifeLimit(String type, int page, int perpage) {
		int startPage = (page-1)*perpage;
		return lifestyleMapper.selectKwdLifeLimit(type, startPage, perpage);
	}
	@Override
	public List<Lifestyle> selectTypeSubtype(String type){
		return lifestyleMapper.selectTypeSubtype(type);
	}
	
	@Override
	public Lifestyle selectByTypeSubt(String type,String subtype){
		return lifestyleMapper.selectByTypeSubt(type, subtype);
	}

}
