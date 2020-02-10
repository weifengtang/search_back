package com.twf.service.impl;

import com.twf.pojo.PageBean;
import com.twf.pojo.Topic;
import com.twf.pojo.User;
import com.twf.dao.IUserDao;
import com.twf.service.IUserService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private IUserDao iUserDao;

	/**
	 * 登录验证
	 * 
	 * @param user
	 * @return
	 */
	@Override
	public User selectByUser(User user) {
		return iUserDao.selectByUser(user);
	}

	/**
	 * 查询用户记录 数
	 * 
	 * @param pageBean
	 * @return
	 */
	@Override
	public Integer queryUserSize(PageBean<User> pageBean) {
		return iUserDao.queryUserSize(pageBean);
	}

	/**
	 * 分页查询用户记录数据
	 * 
	 * @param pageBean
	 * @return
	 */
	@Override
	public List<Topic> queryUserPageBean(PageBean<User> pageBean) {
		return iUserDao.queryUserPageBean(pageBean);
	}

	@Override
	public User selectUserByid(Integer id) {
		return iUserDao.selectUserByid(id);
	}

	@Override
	public void updateUser(User user) {
		 iUserDao.updateUser(user);
	}

	
	
}
