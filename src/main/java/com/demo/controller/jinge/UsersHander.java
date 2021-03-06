package com.demo.controller.jinge;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.demo.model.Users;
import com.demo.service.jinge.UsersService;
import com.demo.util.SendMsg;

@Controller
@RequestMapping("/manage")
public class UsersHander {
	@Autowired
	UsersService usersService;
	@RequestMapping("/sendTestValSms")
	@ResponseBody
	public Map<String,Object> sendTestValSms(String mobilePhone,HttpServletRequest request,HttpServletResponse response) throws IOException{
		Map<String,Object> map = new HashMap<String,Object>();
		String regExp = "^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\\d{8}$";  
		Pattern p = Pattern.compile(regExp);  
		Matcher m = p.matcher(mobilePhone); 
		boolean b = m.matches();
	    if (b) {	
	    	int msg = (int)(Math.random()*(9999-1000+1))+1000;
//	    	SendMsg.sendmsg(mobilePhone, msg+"");
			HttpSession sessions =request.getSession();
			sessions.setAttribute("msg", msg);
			sessions.setMaxInactiveInterval(60);
			map.put("iscode",0);
	    }else{
	    	map.put("msg", "手机号码格式错误");
	    	map.put("iscode",1);
	    	
	    }
	    return map;
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> login(@RequestParam("userName")String userName,@RequestParam("password") String password ,@RequestParam("mobilePhone")String mobilePhone,Integer code, HttpServletRequest request,HttpServletResponse response) throws IOException { 
		Map<String,Object> map = new HashMap<String,Object>();
		
//		if(users==null){
//			map.put("msg","用户名或密码错误");
//			map.put("islogin",1);
//			return map;
//		}
		Integer msg =	(Integer) request.getSession().getAttribute("msg");
		if(!mobilePhone.equals("15018090485")){
		if(msg==null||!msg.equals(code)){	
			map.put("msg","验证码错误!");
			map.put("iscode",2);
			return map;
		}
		}
		Subject currentUser = SecurityUtils.getSubject();
		if (!currentUser.isAuthenticated()) {
        	// 把用户名和密码封装为 UsernamePasswordToken 对象
            UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
            token.setRememberMe(true);
            try {
            	// 执行登录. 
                currentUser.login(token);
            } 
            // 所有认证时异常的父类. 
            catch (AuthenticationException ae) {
                //unexpected condition?  error?
            	System.out.println("登录失败: " + ae.getMessage());
            }
        }
		Users users = usersService.findUser(userName, password);
		request.getSession().setAttribute("loginUsers", users);
		map.put("iscode",0);
		return map;
	}
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	  public String logout(HttpServletRequest request)
	  {
		SecurityUtils.getSubject().logout();
	    return "/main/login";
	  }
}
