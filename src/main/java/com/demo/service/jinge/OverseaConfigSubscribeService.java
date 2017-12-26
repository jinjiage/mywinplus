package com.demo.service.jinge;

import org.springframework.data.domain.Page;

import com.demo.model.OverseaConfigSubscribe;

public interface OverseaConfigSubscribeService {

	Page getPageSubscribe(Integer page, Integer pageSize, Integer id);

	void save(OverseaConfigSubscribe overseaConfigSubscribe);

}
