package com.demo.controller.jinge;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.model.Subject;
import com.demo.model.SysType;
import com.demo.service.jinge.SubjectService;
import com.demo.service.jinge.SysTypeService;



@Controller
@RequestMapping("/subject")
public class SubjectHandler {

	@Autowired
	SubjectService subjectService;
	@Autowired
	SysTypeService  sysTypeService;
	@RequestMapping(value="/{type}/{yearRate}/{period}/{status}",method=RequestMethod.GET)
	public String index(@RequestParam(required=false, defaultValue="1") Integer page, @RequestParam(required=false, defaultValue="3") Integer pageSize,@PathVariable Integer type,
			@PathVariable Integer yearRate, @PathVariable Integer period, @PathVariable Integer status, HttpServletRequest request)
	{	
		Subject subject = new Subject();
		subject.setType(type);
		subject.setYear_rate((float)yearRate);
		subject.setPeriod(period);
		subject.setStatus(status);
		request.getSession().setAttribute("type", type);
		request.getSession().setAttribute("yearRate", yearRate);
		request.getSession().setAttribute("period", period);
		request.getSession().setAttribute("status", status);
		Page subjects = subjectService.serachByPage(page, pageSize, subject);	
		List<Object[]> list = subjectService.selectList();
		request.getSession().removeAttribute("list");
		request.getSession().setAttribute("subjects", subjects);
		request.getSession().setAttribute("list", list);

		return "/index/subject/subject";
	}
	@RequestMapping(value="/subjectContent/{id}", method=RequestMethod.GET)
	public String subjectContent(@RequestParam(required=false, defaultValue="1") Integer page, @RequestParam(required=false, defaultValue="10") Integer pageSize, @PathVariable Integer id,HttpServletRequest request)
	{
		Subject getsubject = subjectService.getSubject(id);
		request.getSession().removeAttribute("getsubject");
		request.getSession().setAttribute("getsubject", getsubject);
		List<SysType> refundway = sysTypeService.find("refundway");
		List<SysType> safeguardway = sysTypeService.find("safeguardway");
		request.getSession().setAttribute("refundway", refundway);
		request.getSession().setAttribute("safeguardway", safeguardway);
		if(getsubject.getType()==0){
			Date d = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			request.setAttribute("nowdate", format.format(d));
			String currdate = format.format(d);
			Calendar ca = Calendar.getInstance();
			ca.setTime(d);
		    ca.add(Calendar.DAY_OF_MONTH, getsubject.getPeriod());
		    Date tomorrow = ca.getTime();
			String enddate = format.format(tomorrow);
			request.setAttribute("enddate",enddate);
			ca.add(Calendar.DAY_OF_MONTH, 1);
			Date tomorrow2 = ca.getTime();
			String enddate2 = format.format(tomorrow2);
			request.setAttribute("enddate2", enddate2);
			return "/index/subject/subjectpromain";
		}

		return "/index/subject/subjecttype";

	}
	@RequestMapping(method=RequestMethod.GET)
	  public String index()
	  {
	    return "/index/subjectgu";
	  }

}
