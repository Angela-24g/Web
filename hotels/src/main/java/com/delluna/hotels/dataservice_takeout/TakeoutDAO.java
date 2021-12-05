package com.delluna.hotels.dataservice_takeout;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.delluna.hotels.common_takeout.Takeout;

@Repository
public class TakeoutDAO implements ITakeoutDAO{
	
	@Autowired ITakeoutMapper takeoutMapper;

	@Override
	@Transactional
	public void save(Takeout takeout) {
		takeoutMapper.save(takeout);
	}

	@Override
	@Transactional
	public List<Takeout> selectAll() {
		return takeoutMapper.selectAll();
	}

	@Override
	@Transactional
	public void findByNo(int no) {
		takeoutMapper.findByNo(no);
	}

	@Override
	@Transactional
	public void updateByNo(Takeout takeout) {
		takeoutMapper.updateByNo(takeout);	
	}

	
}
