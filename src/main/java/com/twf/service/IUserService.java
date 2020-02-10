package com.twf.service;

import java.util.List;

import com.twf.pojo.PageBean;
import com.twf.pojo.Topic;
import com.twf.pojo.User;

public interface IUserService {

	// 登录验证
	User selectByUser(User user);

	// 查询用户记录 数
	Integer queryUserSize(PageBean<User> pageBean);

	// 分页查询用户记录数据
	List<Topic> queryUserPageBean(PageBean<User> pageBean);

	//通过id查询用户
	User selectUserByid(Integer id);

	//修改用户信息
	void  updateUser(User user);
}
