package com.twf.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 问题 pojo
 */
public class Question implements Serializable {


    public List<Options> getOptions() {
		return options;
	}

	public void setOptions(List<Options> options) {
		this.options = options;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTopic_id() {
		return topic_id;
	}

	public void setTopic_id(int topic_id) {
		this.topic_id = topic_id;
	}

	public String getCreate_name() {
		return create_name;
	}

	public void setCreate_name(String create_name) {
		this.create_name = create_name;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getOption_count() {
		return option_count;
	}

	public void setOption_count(int option_count) {
		this.option_count = option_count;
	}

	public int getDelete_token() {
		return delete_token;
	}

	public void setDelete_token(int delete_token) {
		this.delete_token = delete_token;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getUpdated_time() {
		return updated_time;
	}

	public void setUpdated_time(String updated_time) {
		this.updated_time = updated_time;
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", topic_id=" + topic_id + ", create_name=" + create_name + ", number=" + number
				+ ", title=" + title + ", type=" + type + ", option_count=" + option_count + ", delete_token="
				+ delete_token + ", create_time=" + create_time + ", updated_time=" + updated_time + "]";
	}

	private int id;
    private int topic_id; //所属问卷id
    private String  create_name; //问题创建者
    private int   number;//第几道题
    private String  title;//问题标题
    private String type; //问题 类型：单选/多选
    private  int option_count;//问题：选项
    private  int delete_token;//删除标识（0:未删除；使用，1:已删除）
    private String create_time;//创建时间
    private   String  updated_time;//更新时间
    private List<Options> options = new ArrayList<Options>(); //一个问题对应多个选项
    public Question() {
    }

   
}
