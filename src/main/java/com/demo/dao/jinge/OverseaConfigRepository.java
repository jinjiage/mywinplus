package com.demo.dao.jinge;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.demo.model.OverseaConfig;

public interface OverseaConfigRepository extends JpaRepository<OverseaConfig, Integer> ,JpaSpecificationExecutor<OverseaConfig>{

}
