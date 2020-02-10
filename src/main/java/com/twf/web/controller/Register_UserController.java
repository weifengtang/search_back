package com.twf.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.twf.pojo.AJAXResult;
import com.twf.pojo.PageBean;
import com.twf.pojo.Topic;
import com.twf.pojo.User;
import com.twf.service.IUserService;

/**
 * 注册用户信息管理 controller
 */
@Controller
@RequestMapping("/register_user")
public class Register_UserController {

	@Autowired
	private IUserService userServiceImpl;

	// 分页查询注册用户信息
	@ResponseBody
	@RequestMapping("/pageRegisterUserQuery")
	public Object pageRegisterUserQuery(PageBean<User> pageBean) {
		AJAXResult result = new AJAXResult();
		try {
			// 查询总记录数
			Integer size = userServiceImpl.queryUserSize(pageBean);
			// 查询每页记录数据
			List<Topic> datas = userServiceImpl.queryUserPageBean(pageBean);

			pageBean.setSize(size);
			pageBean.setDatas(datas);

			result.setSuccess(true);
			result.setData(pageBean);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}

	// 跳转到注册用户管理 主页
	@RequestMapping("/index")
	public String register_index() {
		return "register_user/index";
	}
	// 修改用户信息
		@ResponseBody
		@RequestMapping("/updateUser")
	public Object updateUser(User user) {
			AJAXResult result = new AJAXResult();
			try {
				// 修改用户
				userServiceImpl.updateUser(user);
				result.setSuccess(true);
			} catch (Exception e) {
				e.printStackTrace();
				result.setSuccess(false);
			}
			return result;
		}
	// 调转到个人信息编辑页面
	@RequestMapping("/goEdit")
	public String goEdit(int id,Model model,HttpSession session) {
		User LoginUser = (User) session.getAttribute("LoginUser");
		User user2=null;
		if(id==LoginUser.getId()){
			user2=LoginUser;
		}
		else{
			user2 = userServiceImpl.selectUserByid(id);
		}		
			
		model.addAttribute("user",user2);
		return "register_user/edit";
	}

}
