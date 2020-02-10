package com.twf.service.impl;

import com.twf.dao.ITopicDao;
import com.twf.pojo.Options;
import com.twf.pojo.PageBean;
import com.twf.pojo.Question;
import com.twf.pojo.Topic;
import com.twf.service.ITopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 调查课题 实现类 业务层
 */

@Service
public class TopicServiceImpl implements ITopicService {

	
	@Autowired
	private ITopicDao iTopicDao;

	/**
	 * 查询总记录数
	 */
	@Override
	public Integer queryTopicSize(PageBean<Topic> pageBean) {
		return iTopicDao.queryTopicSize(pageBean);
	}

	/**
	 * 查询每页记录数据
	 */
	@Override
	public List<Topic> queryTopicPageBean(PageBean<Topic> pageBean) {
		return iTopicDao.queryTopicPageBean(pageBean);
	}

	/**
	 * 查询课题对应的所有问题
	 * 
	 * @param topic_id
	 * @return
	 */
	@Override
	public List<Question> queryTopic_QuestionPageBean(Integer topic_id) {
		return iTopicDao.queryTopic_QuestionPageBean(topic_id);
	}

	/**
	 * 查询课题
	 * 
	 * @param topic_id
	 * @return
	 */
	@Override
	public Topic queryTopicByid(Integer topic_id) {
		return iTopicDao.queryTopicByid(topic_id);
	}

	/**
	 * 修改课题
	 * 
	 * @param
	 * @return
	 */
	@Override
	public void updateTopic(Topic topic) {
		iTopicDao.updateTopic(topic);
	}
	
	/**
	 * 删除课题
	 */
	@Override
	public void deleteTopicById(Integer topic_id) {
		iTopicDao.deleteTopicById(topic_id);
	}

	/**
	 * 增加课题
	 */
	@Override
	public void insertTopic(Topic topic) {
		iTopicDao.insertTopic(topic);
	}

	@Override
	public List<Options> queryQuestion_Options(Integer topic_id) {
		return iTopicDao.queryQuestion_Options(topic_id);
	}

}
