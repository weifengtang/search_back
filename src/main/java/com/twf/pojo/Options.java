package com.twf.pojo;

import java.io.Serializable;

/**
 * 选项po
 * @author TWF
 *@Date2019年5月11日
 */
public class Options implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private int question_id; //对应的问题id
	private String number; //选项号
	private String title;//选项内容
	private int select_count;//选择次数
	private String created_time;//创建时间
	
	
	
	
	public Options() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getSelect_count() {
		return select_count;
	}
	public void setSelect_count(int select_count) {
		this.select_count = select_count;
	}
	public String getCreated_time() {
		return created_time;
	}
	public void setCreated_time(String created_time) {
		this.created_time = created_time;
	}
	@Override
	public String toString() {
		return "Options [id=" + id + ", question_id=" + question_id + ", number=" + number + ", title=" + title
				+ ", select_count=" + select_count + ", created_time=" + created_time + "]";
	}
	
	
	
	
}
