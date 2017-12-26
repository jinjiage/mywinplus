package com.demo.scheduled;

import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;

import org.springframework.stereotype.Component;

import com.demo.model.BbinPurchaseRecord;

@Component
public class TaskServiceImpl{
	

	@Scheduled(cron="0 0/1 5,* * * ?")
	public  void doSomething() {
		
	}
	public void doAdd(){
//		List<BbinPurchaseRecord> list = 
	}
	 
}
