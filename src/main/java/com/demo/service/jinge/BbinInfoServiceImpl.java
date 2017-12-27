package com.demo.service.jinge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.jinge.BbinInfoRepository;
import com.demo.model.BbinInfo;

@Service
public class BbinInfoServiceImpl implements BbinInfoService {
	@Autowired
	BbinInfoRepository bbinInfoRepository;
	public void saveBbinfo(BbinInfo bb) {
		// TODO Auto-generated method stub
		bbinInfoRepository.save(bb);
	}

}
