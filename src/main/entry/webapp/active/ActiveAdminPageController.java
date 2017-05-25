package main.entry.webapp.active;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.helper.HttpWebIOHelper;

/**
 * 
 * @Description: active 后台登录
 * @author 高雄辉
 * @date 2017年1月20日 上午12:52:34
 *
 */
@Controller
public class ActiveAdminPageController {

	private Map<String,Object> data;
	
	@RequestMapping(value = "/active/login")
	public String login(HttpServletResponse response,HttpServletRequest request){
		request.getSession().setAttribute("sessionUser",null);
		request.getSession().setAttribute("userName","admin");
		return "active/login";
	}

	@RequestMapping(value = "/active/index")
	public String index(){
		return "active/index";
	}
	
	
	/*
	 * 登录
	 */
	@RequestMapping(value = "/active/doLogin")
	public void doLogin(HttpServletResponse response,HttpServletRequest request) throws IOException{
		data = new HashMap<String,Object>();
		data.put("status","fail");
		
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		//白玉兰女子讲堂 ／ 少儿培训 ／ 相亲交友 ／ 家政母婴 ／ 7点不一样 ／ 志愿者招募
		if("admin".equals(userName)&&"admin".equals(password)){
				data.put("status","success");
				request.getSession().setAttribute("sessionUser","success");
				request.getSession().setAttribute("userName","admin");
				
		}
		if("baiyulan".equals(userName)&&"baiyulan01".equals(password)){
			data.put("status","success");
			request.getSession().setAttribute("sessionUser","success");
			request.getSession().setAttribute("userName","白玉兰女子讲堂");
			
	}
		if("shaoer".equals(userName)&&"shaoer02".equals(password)){
			data.put("status","success");
			request.getSession().setAttribute("sessionUser","success");
			request.getSession().setAttribute("userName","少儿培训");
			
	}
		if("xiangqin".equals(userName)&&"xiangqin03".equals(password)){
			data.put("status","success");
			request.getSession().setAttribute("sessionUser","success");
			request.getSession().setAttribute("userName","相亲交友");
			
	}
		if("jiazheng".equals(userName)&&"jiazheng04".equals(password)){
			data.put("status","success");
			request.getSession().setAttribute("sessionUser","success");
			request.getSession().setAttribute("userName","家政母婴");
			
	}
		if("qidian".equals(userName)&&"qidian05".equals(password)){
			data.put("status","success");
			request.getSession().setAttribute("sessionUser","success");
			request.getSession().setAttribute("userName","七点不一样");
			
	}
		if("zhiyuanzhe".equals(userName)&&"zhiyuanzhe06".equals(password)){
			data.put("status","success");
			request.getSession().setAttribute("sessionUser","success");
			request.getSession().setAttribute("userName","志愿者招募");
			
	}
		
		HttpWebIOHelper._printWebJson(data, response);
	}
	
	
	
	
	
	
	
	public Map<String, Object> getData() {
		return data;
	}
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
}
