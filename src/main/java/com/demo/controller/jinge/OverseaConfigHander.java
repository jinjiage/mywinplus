package com.demo.controller.jinge;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.model.Member;
import com.demo.model.OverseaConfig;
import com.demo.model.OverseaConfigSubscribe;
import com.demo.model.SysType;
import com.demo.service.jinge.OverseaConfigService;
import com.demo.service.jinge.OverseaConfigSubscribeService;
import com.demo.service.jinge.SysTypeService;

@Controller
@RequestMapping("/oversea")
public class OverseaConfigHander {
	@Autowired
	OverseaConfigService overseaConfigService;
	@Autowired
	OverseaConfigSubscribeService overseaConfigSubscribeService;
	@RequestMapping("/oversealist")
	public String indexlist(Map<String,Object> map){
		List<OverseaConfig> overseaConfigList = overseaConfigService.findOverseaConfigList();
		
		map.put("overseaConfigList", overseaConfigList);
		return "index/oversea";
	}
	@RequestMapping(method=RequestMethod.GET)
	  public String index(@RequestParam(required=false, defaultValue="1") Integer page, @RequestParam(required=false, defaultValue="10") Integer pageSize, Model model)
	  {
	    Page overseaConfigAPIs = overseaConfigService.getOverseaConfigListAPI(0, page, pageSize);
	  
	    model.addAttribute("overseaConfigAPIs", overseaConfigAPIs);
	    return "index/oversea";
	  }
	@RequestMapping(value="/overseaView/{id}", method=RequestMethod.GET)
	  public String overseaView(@PathVariable("id") Integer id, Model model)
	  {
	    OverseaConfig overseaConfig = overseaConfigService.getOne(id);
	    model.addAttribute("overseaConfig", overseaConfig);
	    return "/index/subject/finace/oversea";
	  }
	  @ResponseBody
	  @RequestMapping(value={"/addOversea"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	  public Map<String,Object> addOversea(OverseaConfigSubscribe overseaConfigSubscribe,HttpServletRequest request)
	  {
		  Map<String,Object> map = new HashMap();
		  Member member = (Member) request.getSession().getAttribute("memberInfo");
	    overseaConfigSubscribe.setStatus(0);
	    overseaConfigSubscribe.setMember_id(member.getId());
	    overseaConfigSubscribe.setCreate_date(new Date());
	    overseaConfigSubscribe.setUpdate_date(new Date());
	    overseaConfigSubscribeService.save(overseaConfigSubscribe);
	    map.put("msg", "预约成功");
	    return map;
	  }
	  
}
