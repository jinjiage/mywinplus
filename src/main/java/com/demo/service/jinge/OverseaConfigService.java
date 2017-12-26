package com.demo.service.jinge;

import java.util.List;

import org.springframework.data.domain.Page;

import com.demo.model.OverseaConfig;

public interface OverseaConfigService {
	public List<OverseaConfig> findOverseaConfigList();

	public Page getOverseaConfigList(Integer page, Integer pageSize);

	public void saveOver(OverseaConfig overseaConfig);

	public OverseaConfig getOne(Integer id);

	public Page getOverseaConfigListAPI(int i, Integer page, Integer pageSize);




}
