package com.demo.dao.jinge;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.demo.model.OverseaConfigSubscribe;

public interface OverseaConfigSubscribeRepository extends JpaRepository<OverseaConfigSubscribe, Integer>,JpaSpecificationExecutor<OverseaConfigSubscribe> {

}
