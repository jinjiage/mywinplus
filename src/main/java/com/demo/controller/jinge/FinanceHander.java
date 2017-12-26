package com.demo.controller.jinge;

import java.util.Date;
import java.util.HashMap;
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

import com.demo.model.FinanceProductFunds;
import com.demo.model.FinanceProductSubscribe;
import com.demo.model.FinancialPlanner;
import com.demo.model.Member;
import com.demo.service.jinge.FinanceProductFundsService;
import com.demo.service.jinge.FinanceProductSubscribeService;
import com.demo.service.jinge.FinancialPlannerService;

@Controller
@RequestMapping("/finance")
public class FinanceHander {
	@Autowired
	FinanceProductFundsService financeProductFundsService;
	@Autowired
	FinanceProductSubscribeService financeProductSubscribeService;
	@Autowired
	FinancialPlannerService financialPlannerService;
	@RequestMapping(method=RequestMethod.GET)
	  public String index(@RequestParam(required=false, defaultValue="1") Integer page, @RequestParam(required=false, defaultValue="4") Integer pageSize,HttpServletRequest request)
	  {
		Integer[] types = {0, 1};
	    Page prods = financeProductFundsService.getPagingProductsByType(types, page, pageSize);  
	    Member member = (Member) request.getSession().getAttribute("memberInfo");
	    if (member != null) {
	      FinancialPlanner financialPlanner = financialPlannerService.selectMemberId(member.getId());
	      if ((financialPlanner != null) && (financialPlanner.getStatus()==1)) {
	        request.setAttribute("financialStatus",true);
	      }
	    }
	   
	    request.getSession().setAttribute("prods", prods);
	    return "/index/subject/simu";
	  }
	  @RequestMapping(value="/financeView/{id}", method=RequestMethod.GET)
	  public String financeView(@PathVariable("id") Integer id, Model model)
	  {
	    FinanceProductFunds product = financeProductFundsService.selectByProductId(id);
	    model.addAttribute("product", product);
	    if (product.getType()==0) {
	      return "index/subject/finace/financeview";
	    }
	    return "/index/subject/finace/financeviewsimu";
	  }
	  @ResponseBody
	  @RequestMapping(value={"/addfinance"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	  public Map<String,Object> addfinance(HttpServletRequest request,Integer productId,String name, String phone, String location_id)
	  {
		Map<String,Object> map = new HashMap();
		Member member = (Member) request.getSession().getAttribute("memberInfo");
		if(member==null){
			map.put("msg", "请先登陆！");
			return map;
		}
	    FinanceProductSubscribe subscribe = new FinanceProductSubscribe();
	    subscribe.setName(name);
	    subscribe.setPhone(phone);
	    subscribe.setProduct_id(productId);
	    subscribe.setAddr(location_id);
	    subscribe.setStatus(0);
	    subscribe.setMember_id(member.getId());
	    subscribe.setCreate_date(new Date());
	    subscribe.setUpdate_date(new Date());
	    financeProductSubscribeService.saveFinance(subscribe);
	    map.put("msg", "预约成功");
	    return map;
	  }  
}
