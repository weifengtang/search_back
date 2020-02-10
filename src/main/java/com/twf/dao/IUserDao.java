package com.twf.dao;

import com.twf.pojo.PageBean;
import com.twf.pojo.Topic;
import com.twf.pojo.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IUserDao {

	/**
	 * 登录验证
	 * 
	 * @param user
	 * @return
	 * select * from t_user where userName='admin' and passWord='admin' and `group`=0;
	 */
	@Select("select * from t_user where userName=#{userName} and passWord=#{passWord} ")
	User selectByUser(User user);

	/**
	 * 查询用户记录 数
	 * 
	 * @param pageBean
	 * @return
	 */
	Integer queryUserSize(PageBean<User> pageBean);

	/**
	 * 分页查询用户记录数据
	 * 
	 * @param pageBean
	 * @return
	 */
	List<Topic> queryUserPageBean(PageBean<User> pageBean);

	/**
	 * 根据id查询用户
	 * @param id
	 * @return
	 */
	@Select("select * from t_user where id=#{id}")
	User selectUserByid(Integer id);

	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	
	void updateUser(User user);
}
