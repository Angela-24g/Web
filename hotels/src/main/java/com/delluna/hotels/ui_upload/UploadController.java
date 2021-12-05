package com.delluna.hotels.ui_upload;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class UploadController {

	@GetMapping(value="/display")
	public ResponseEntity<Resource> display(String type,int no,String filename,HttpServletRequest request){
		
		//공통경로
		String path = request.getSession().getServletContext().getRealPath("/upload/");
		String folder = type + "/" + no + "/";
		System.out.println(path + folder);
		
		Resource resource = new FileSystemResource(path+folder+filename);
		if(!resource.exists()) {//파일이 존재하지 않으면 404 error
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}
		HttpHeaders header = new HttpHeaders();
		Path filePath = null;
		try {
			filePath = Paths.get(path + folder + filename);	//file의 경로를 구한다.
			//파일의 확장자명(.jpg, .png ) 에 따라 달라지는 Content-Type, IMAGE/JPEG or IMAGE/PNG
			header.add("Content-Type", Files.probeContentType(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource,header,HttpStatus.OK);
	}
	
}
