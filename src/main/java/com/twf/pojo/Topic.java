package com.twf.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 课题问卷 pojo
 */

public class Topic implements Serializable {


    private int id;
    private String  create_name; //问卷创建者
    private String  title;//问卷标题
    private String  text;//问卷简介
    private int   counts;//问卷提交量
    private int active_time;//问卷有效时间
    private  int delete_token;//删除标识（0:未删除，1:已删除）
    private String create_time;//创建时间
    private   String  updated_time;//更新时间
    private List<Question> questions = new ArrayList<Question>(); //一个问卷对应多个问题
    
    public Topic() {
    }

    public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}




	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getActive_time() {
        return active_time;
    }

    public void setActive_time(int active_time) {
        this.active_time = active_time;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCounts() {
        return counts;
    }

    public void setCounts(int counts) {
        this.counts = counts;
    }

    public String getCreate_name() {
        return create_name;
    }

    public void setCreate_name(String create_name) {
        this.create_name = create_name;
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
		return "Topic [id=" + id + ", create_name=" + create_name + ", title=" + title + ", text=" + text + ", counts="
				+ counts + ", active_time=" + active_time + ", delete_token=" + delete_token + ", create_time="
				+ create_time + ", updated_time=" + updated_time + "]";
	}
}
