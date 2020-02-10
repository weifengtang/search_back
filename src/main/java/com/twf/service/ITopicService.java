package com.twf.service;

import com.twf.pojo.Options;
import com.twf.pojo.PageBean;
import com.twf.pojo.Question;
import com.twf.pojo.Topic;

import java.util.List;

public interface ITopicService {

    /**
     *     查询总记录数
     */
    Integer queryTopicSize(PageBean<Topic> pageBean);

    /**
     *     查询每页记录数据
     */
    List<Topic> queryTopicPageBean(PageBean<Topic> pageBean);

    /**
     * 查询课题对应的所有问题
     * @param topic_id
     * @return
     */
    List<Question> queryTopic_QuestionPageBean(Integer topic_id);

    
    //查询课题
	Topic queryTopicByid(Integer topic_id);

	//修改课题
	void updateTopic(Topic topic);
	
	//删除课题
	void deleteTopicById(Integer topic_id);
	
	//增加课题
	void insertTopic(Topic topic);

	//查询课题下问题的所有选项
	List<Options> queryQuestion_Options(Integer topic_id);
}
