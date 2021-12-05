package com.delluna.hotels.common_takeout;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;



public class TakeoutAdm {

	private int no;
	private String title;
	private String content;
	private String sales_unit;
	private String weight;
	private String location;
	private String packaging;
	private Date date_write;
	
	/*1 대 다 takeoutAdm : takeoutAttach*/
	private List<MultipartFile> attachFiles;
	private List<TakeoutAttach> takeoutAttachs;
	
	/*1대 다 takeoutAdm : takeoutProduct*/
	private List<Integer> product_numbers;
	private List<String> product_names;
	private List<TakeoutProduct> takeoutProduct;
	
	/*1 대 다 takeoutAdm : takeoutAttach*/
	public List<MultipartFile> getAttachFiles() {
		return attachFiles;
	}
	public void setAttachFiles(List<MultipartFile> attachFiles) {
		this.attachFiles = attachFiles;
	}
	public List<TakeoutAttach> getTakeoutAttachs() {
		if(attachFiles != null && this.takeoutAttachs == null) {
			this.takeoutAttachs = new ArrayList<TakeoutAttach>();
			for(MultipartFile files:attachFiles) {
				TakeoutAttach attch = new TakeoutAttach();
				attch.setName(files.getOriginalFilename());
				attch.setSize(files.getSize());
				attch.setTakeout_adm_no(this);;
				
				takeoutAttachs.add(attch);
			}
		}
		return takeoutAttachs;
	}
	public void setTakeoutAttachs(List<TakeoutAttach> takeoutAttachs) {
		for(int i = 0 ; i < takeoutAttachs.size(); i++) {
			takeoutAttachs.get(i).setTakeout_adm_no(this);
		}
		this.takeoutAttachs = takeoutAttachs;
	}
	
	/*1대 다 takeoutAdm : takeoutProduct*/
	
	public List<Integer> getProduct_numbers() {
		return product_numbers;
	}
	public List<String> getProduct_names() {
		return product_names;
	}
	public void setProduct_names(List<String> product_names) {
		this.product_names = product_names;
	}
	public void setProduct_numbers(List<Integer> product_numbers) {
		this.product_numbers = product_numbers;
	}
	public List<TakeoutProduct> getTakeoutProduct() {
		if(product_names != null && product_numbers != null && this.takeoutProduct == null) {
			this.takeoutProduct = new ArrayList<TakeoutProduct>();
			for(int i = 0; i < product_numbers.size(); i++) {
				TakeoutProduct product = new TakeoutProduct();
				product.setTakeout_adm_no(this);
				
				int product_price = product_numbers.get(i);
				product.setPrice(product_price);
				
				String product_name = product_names.get(i);
				product.setName(product_name);
				
				takeoutProduct.add(product);
			}
		}
		return takeoutProduct;
	}
	public void setTakeoutProduct(List<TakeoutProduct> takeoutProduct) {
		for(int i = 0; i < takeoutProduct.size(); i++) {
			takeoutProduct.get(i).setTakeout_adm_no(this);
		}
		
		this.takeoutProduct = takeoutProduct;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSales_unit() {
		return sales_unit;
	}
	public void setSales_unit(String sales_unit) {
		this.sales_unit = sales_unit;
	}
	
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getPackaging() {
		return packaging;
	}
	public void setPackaging(String packaging) {
		this.packaging = packaging;
	}
	public Date getDate_write() {
		return date_write;
	}
	public void setDate_write(Date date_write) {
		this.date_write = date_write;
	}
	
	
}
