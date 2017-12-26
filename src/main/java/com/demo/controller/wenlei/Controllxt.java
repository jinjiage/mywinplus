package com.demo.controller.wenlei;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.model.FinanceProductSubscribe;
import com.demo.model.MemberBankcards;
import com.demo.model.UserRole;
import com.demo.model.UserRoleRelation;
import com.demo.model.Users;
import com.demo.service.wenlei.UserRoleRServices;
import com.demo.service.wenlei.UsersServices;

@Controller
@RequestMapping("/sys")
public class Controllxt {

	@Autowired
	 UsersServices   usersServices;
	@Autowired
	UserRoleRServices userRoleRServices;
	@RequestMapping("/userlist")
	public String  userlist(Map<String,Object> map) {
		List<Object[]> list=usersServices.xt();		
		map.put("list", list);
		return "/main/xt/userlist";
		
	}

	@RequestMapping("/addAccount")
	public String  userlist1(Map<String,Object> map) {
		List<UserRole>   list= userRoleRServices.selectlist();
		map.put("list", list);
		return "/main/xt/add";	
	}

	
	@RequestMapping("/createAccount")
	public String  userlist11(Users  users  ,Integer  role_id,Map<String,Object> map) {
		users.setCreate_date(new Date());
		usersServices.addUsers(users);	
		Integer  id=users.getId();
	    UserRoleRelation  userRoleRelation=new UserRoleRelation();
		userRoleRelation.setId(id);
		userRoleRelation.setRole_id(role_id);
		userRoleRelation.setCreate_date(new Date());
		usersServices.addUserRoleRelation(userRoleRelation);
		return "redirect:/sys/userlist";	
	}

	
	@RequestMapping("/eidtUserView/{id}")
	public String  userlist2 (@PathVariable(value="id")  Integer id , Map<String,Object> map) {
		
		   List<UserRole>   list= userRoleRServices.selectlist();
		  map.put("list", list);
		  
		  Users  users= usersServices.toupdateUsers(id);
		  UserRoleRelation  userRoleRelation=usersServices.toupdateUserRoleRelation(id);
			map.put("users", users);
			map.put("userRoleRelation", userRoleRelation);
		
		return "/main/xt/eidtUserView";
		
	}

	@RequestMapping("/delUser/{id}")
	public String  userlist3(@PathVariable(value="id")  Integer id ,   Map<String,Object> map) {	
		System.out.println(id);
		usersServices.deleteUsers(id);
		usersServices.deleteUserRoleRelation(id);
		
		return "redirect:/sys/userlist";
		
	}
	@RequestMapping("/docreateAccount")
	
	public String  userlist4(@ModelAttribute("users")  Users  users , String   passwordqqq,   Integer  role_id  , Map<String,Object> map) {
	
	    users.setPassword(passwordqqq);
		usersServices.updateUsers(users);
		Integer  id=users.getId();
	    UserRoleRelation  userRoleRelation=new UserRoleRelation();
		userRoleRelation.setId(id);
		userRoleRelation.setRole_id(role_id);
		usersServices.updateUserRoleRelation(userRoleRelation);
		return "redirect:/sys/userlist";
		
	}
	@RequestMapping("/updatePasswdPage")
	public String  userlist5(Map<String,Object> map) {
		return "/main/xt/pwd";	
	}
	@RequestMapping("/rolelist")
	public String  userlist6(UserRole userRole, Integer  page, Map<String,Object> map) {
		
	if(page==null){
			page=1;	
		} 
	   Integer size=2;	
	  Page<UserRole> pageemp=userRoleRServices.fenPage(page, size, userRole);
	  map.put("pageemp",pageemp);
		return "/main/xt/jiaose";	
	}

	
	@RequestMapping("/addRolePage")
	public String  userlist8(UserRole userRole ,Map<String,Object> map) {

  /*  userRole.setCreate_date(new Date());
    userRoleRServices.addname(userRole);*/
		
		return "/main/xt/addrole";	
	}
	
	
	@RequestMapping("/addRole")
	public String  userlist7(UserRole userRole ,Map<String,Object> map) {
		 userRole.setCreate_date(new  Date() );
		userRoleRServices.addname(userRole);
		return "redirect:/sys/rolelist";	
		
	}
	@RequestMapping("/savePasswd")
	public String  userlist8(String password ,Map<String,Object> map,HttpServletRequest  request) {
		Users  users = (Users) request.getSession().getAttribute("loginUsers");
		String  name=users.getUser_name();
		usersServices.queryup(password, name);
		return "/main/login";	
	}


	@RequestMapping("/check")
	@ResponseBody
	public Map<String,Object>  userlist9(String  oldpassword,HttpServletRequest  request) {
		
		Users  users = (Users) request.getSession().getAttribute("loginUsers");	

		Map<String,Object> map = new HashMap<String,Object>();

		if (users.getPassword().equals(oldpassword)) {
			map.put("message","用户密码错误");	
		}
	   else {
		map.put("iscode","0");	
	   }
		return map;
		
	}

	@RequestMapping("/checkUserExsit")
	@ResponseBody
	public Map<String,Object>  userlist8(String  name) {
		
		System.out.println(name+"===========");
		Map<String,Object> map = new HashMap<String,Object>();
		
		 Integer users = usersServices.findUser(name);
		 System.out.println(users);
		
		if (users>=1) {
		
			map.put("message","用户名或密码错误");
			
		}
	   else {
		map.put("iscode","0");	
	   }
		return map;
		
	}

	/*@ModelAttribute
	public void getUser(@RequestParam(value="id",required=false) Integer id,Map<String, Object> map,HttpServletRequest  request){
		if(id != null){
			//模拟从数据库中获取对象
			Users  users = (Users) request.getSession().getAttribute("loginUsers");	
		}*/

	/*}*/
	
	@ModelAttribute
	public void getUser(@RequestParam(value="id",required=false) Integer id, Map<String, Object> map){
		if(id != null){
			//模拟从数据库中获取对象
		       Users  users= usersServices.toupdateUsers(id);
		      UserRoleRelation  userRoleRelation=usersServices.toupdateUserRoleRelation(id);
			   map.put("users", users);
			
			map.put("userRoleRelation", userRoleRelation);
		}
	}
	
	
	
	
}
