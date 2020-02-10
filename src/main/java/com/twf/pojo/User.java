package com.twf.pojo;

import java.io.Serializable;

/**
 * 用户bean
 */

public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String userName;
	private String passWord;

	private int group ;// 默认值为0；普通用户   管理员 1：
	private String email;
	private String createTime;

	public User() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getGroup() {
		return group;
	}

	public void setGroup(int group) {
		this.group = group;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", userName=" + userName + ", passWord=" + passWord + ", group="
				+ group + ", email=" + email + ", createTime=" + createTime + "]";
	}

}
