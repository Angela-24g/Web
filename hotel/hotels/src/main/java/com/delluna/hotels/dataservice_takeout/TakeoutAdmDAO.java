package com.delluna.hotels.dataservice_takeout;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.delluna.hotels.common_takeout.TakeoutAdm;

@Repository
public class TakeoutAdmDAO implements ITakeoutAdmDAO{

	@Autowired ITakeoutAdmMapper takeoutAdmMapper;
	@Autowired ITakeoutAttachMapper takeoutAttachMapper;
	@Autowired ITakeoutProductMapper takeoutProductMapper;

	@Override
	@Transactional
	public void save(TakeoutAdm takeoutAdm) {
		takeoutAdmMapper.save(takeoutAdm);
		if(takeoutAdm.getTakeoutAttachs() != null) {
			takeoutAttachMapper.saveAttach(takeoutAdm.getTakeoutAttachs());
		}
	}

	@Override
	@Transactional
	public List<TakeoutAdm> selectAll() {
		return takeoutAdmMapper.selectAll();
	}

	@Override
	@Transactional
	public TakeoutAdm findByNo(int no) {
		return takeoutAdmMapper.findByNo(no);
	}

	@Override
	@Transactional
	public void updateByNo(TakeoutAdm takeoutAdm) {
		takeoutAdmMapper.updateByNo(takeoutAdm);
	}

}
