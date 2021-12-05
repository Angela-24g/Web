package com.delluna.hotels.manage_lifestyle;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.delluna.hotels.common_lifestyle.Lifestyle;
import com.delluna.hotels.common_lifestyle.LifestylePrice;
import com.delluna.hotels.dataservice_lifestyle.ILifestyleDAO;
import com.delluna.hotels.util.BusinessResult;
import com.delluna.hotels.util.RESULTCODE;

@Service("lifestyleAdmService")
public class LifestyleAdmService implements ILifestyleAdmService{
	@Autowired ILifestyleDAO lifestyleDAO;
	
	@Override
	public BusinessResult gotoAdmLifestyleWrite() {
		return new BusinessResult();
	}

	@Override
	public BusinessResult registerLifestyle(Lifestyle lifestyle,HttpServletRequest request) {
		
		lifestyleDAO.save(lifestyle);
		String 새경로 = null;
		if(lifestyle.getImagesFiles() != null) {
			/* 서버실제경로/upload 폴더생성 */
			//System.out.println(request.getSession().getServletContext().getRealPath("/upload"));
			String path = request.getSession().getServletContext().getRealPath("/upload");
			File buildFolder = new File(path);
			buildFolder.mkdir();
			
			/* 서버실제경로/upload/lifestyle 폴더생성 */
			path = request.getSession().getServletContext().getRealPath("/upload/lifestyle");
			File buildFolder2 = new File(path);
			buildFolder2.mkdir();
			
			/* 서버실제경로/upload/lifestyle/no 폴더생성 */
			새경로 = path + "//" + lifestyle.getNo();
			System.out.println(새경로);
			File folder = new File(새경로);
			folder.mkdir();
			
			for(MultipartFile multipartFile: lifestyle.getImagesFiles()) {
				
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
		}
		if(lifestyle.getFacilityFiles() != null) {
			for(MultipartFile multipartFile: lifestyle.getFacilityFiles()) {
				
				String uploadFileName = multipartFile.getOriginalFilename();
//				
				//IE has file path
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
				
				File file = new File(새경로 + "//" + uploadFileName);
				
				try {
					multipartFile.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		
		return new BusinessResult();
	}

	@Override
	public BusinessResult gotoAmdLifestyleList(int page,String col,String kwd) {
		List<Lifestyle> lifestyles = null;
		
		if(kwd == null) {
			lifestyles = lifestyleDAO.selectLifeLimit(page, 5);
		}
		else if(col.equals("type")) {
			lifestyles = lifestyleDAO.selectKwdLifeLimit(kwd,page,5);
			if(lifestyles==null) {
				return new BusinessResult(RESULTCODE.존재하지않는검색결과,"");
			}
		}
		
		return new BusinessResult(lifestyles);
	}

	@Override
	public BusinessResult gotoAmdLifestyleView(int no) {
		Lifestyle lifestyle = lifestyleDAO.selectLifestyleByNo(no);
		int countAll = lifestyleDAO.countAll();
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("countAll", countAll);
		map.put("lifestyle", lifestyle);
		return new BusinessResult(map);
	}

	@Override
	public BusinessResult deleteLifestyle(int no) {
		lifestyleDAO.deleteLifestyle(no);
		return new BusinessResult();
	}

	@Override
	public BusinessResult gotoUpdateLifestyle(int no) {
		Lifestyle lifestyle = lifestyleDAO.selectLifestyleByNo(no);
		
		if(lifestyle.getInfo()!=null) {
			lifestyle.setInfo(lifestyle.getInfo().replace("<br>","\r\n"));
		}
		if(lifestyle.getInfo_detail()!=null) {
			lifestyle.setInfo_detail(lifestyle.getInfo_detail().replace("<br>","\r\n"));
		}
		if(lifestyle.getGuide()!=null) {
			lifestyle.setGuide(lifestyle.getGuide().replace("<br>","\r\n"));
		}
		if(lifestyle.getHours()!=null) {
			lifestyle.setHours(lifestyle.getHours().replace("<br>","\r\n"));
		}
		if(lifestyle.getLocation()!=null) {
			lifestyle.setLocation(lifestyle.getLocation().replace("<br>","\r\n"));
		}
		
		List<LifestylePrice> lifestylePrices = new ArrayList<LifestylePrice>();
		if(lifestyle.getLifestylePrices()!=null) {
			for(LifestylePrice lifestylePrice:lifestyle.getLifestylePrices()) {
				if(lifestylePrice.getPrice_type() != null) {
					lifestylePrice.setPrice_type(lifestylePrice.getPrice_type().replace("<br>","\r\n"));
				}
				lifestylePrices.add(lifestylePrice);
			}
			lifestyle.setLifestylePrices(lifestylePrices);
		}
		
		return new BusinessResult(lifestyle);
	}
	
	@Override
	public BusinessResult updateLifestyle(Lifestyle lifestyle,HttpServletRequest request) {
		lifestyleDAO.deleteLifestyleDt(lifestyle);
		lifestyleDAO.updateLifestyle(lifestyle);
		
		//추가 파일 업로드시 저장
		String 새경로 = null;
		String path = null;
		
		path = request.getSession().getServletContext().getRealPath("/upload/lifestyle");
		새경로 = path + "//" + lifestyle.getNo();
		
		if(lifestyle.getImagesFiles() != null) {

			
			for(MultipartFile multipartFile:lifestyle.getImagesFiles()) {
				
				String uploadFileName = multipartFile.getOriginalFilename();
//				
				//IE has file path
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
				
				File file = new File(새경로 + "//" + uploadFileName);
				
				try {
					multipartFile.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		if(lifestyle.getFacilityFiles() != null) {
			for(MultipartFile multipartFile:lifestyle.getFacilityFiles()) {
				// 
				String uploadFileName = multipartFile.getOriginalFilename();
//				
				//IE has file path
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
				
				File file = new File(새경로 + "//" + uploadFileName);
				
				try {
					multipartFile.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		return new BusinessResult();
	}
	
}
