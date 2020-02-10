package com.twf.web.controller;

import com.twf.pojo.AJAXResult;
import com.twf.pojo.Options;
import com.twf.pojo.PageBean;
import com.twf.pojo.Question;
import com.twf.pojo.Topic;
import com.twf.service.ITopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 调查课题管理 controller
 */
@Controller
@RequestMapping("/topic")
public class TopicController {

	@Autowired
	private ITopicService topicServiceImpl;

	// 分页查询 课题
	@ResponseBody
	@RequestMapping("/pageTopicQuery")
	public Object pageTopicQuery(PageBean<Topic> pageBean) {
		AJAXResult result = new AJAXResult();
		try {
			// 查询总记录数
			Integer size = topicServiceImpl.queryTopicSize(pageBean);
			// 查询每页记录数据
			List<Topic> datas = topicServiceImpl.queryTopicPageBean(pageBean);

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

	// 查询 一个课题所对应的问题
	@ResponseBody
	@RequestMapping("/pageTopic_questionsQuery")
	public Object pageTopic_questionsQuery(Integer topic_id) {

		AJAXResult result = new AJAXResult();
		try {
			// 查询课题对应的问题 ; 课题id--问题topic_id
			List<Question> questions = topicServiceImpl.queryTopic_QuestionPageBean(topic_id);
			// 查询 该课题对应的所有问题的所有选项
			List<Options> options = topicServiceImpl.queryQuestion_Options(topic_id);

			// 匹配问题对应的选项
			for (int i = 0; i < questions.size(); i++) {
				for (int j = 0; j < options.size(); j++) {
					if (questions.get(i).getId() == options.get(j).getQuestion_id()) {
						questions.get(i).getOptions().add(options.get(j));
					}
				}
			}

			PageBean<Question> pageBean = new PageBean<Question>();
			pageBean.setDatas(questions);

			result.setSuccess(true);
			result.setData(pageBean);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}

	// 增加课题
	@ResponseBody
	@RequestMapping("/insertTopic")
	public Object insertTopic(Topic topic) {

		AJAXResult result = new AJAXResult();
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			String time = format.format(new Date());

			// 设置课题时间
			topic.setCreate_time(time);
			topic.setUpdated_time(time);
			// 修改课题
			topicServiceImpl.insertTopic(topic);

			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}

	// 修改 课题
	@ResponseBody
	@RequestMapping("/updateTopic")
	public Object updateTopic(Topic topic) {

		AJAXResult result = new AJAXResult();
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			// 设置 更新课题时间
			topic.setUpdated_time(format.format(new Date()));

			// 修改课题
			topicServiceImpl.updateTopic(topic);

			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}

	// 删除 课题
	@ResponseBody
	@RequestMapping("/deleteTopic")
	public Object deleteTopic(Integer topic_id) {

		AJAXResult result = new AJAXResult();
		try {

			// 删除课题
			topicServiceImpl.deleteTopicById(topic_id);

			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}

	// 跳转到 课题调查管理主页
	@RequestMapping("/index")
	public String register_index() {
		return "topic/index";
	}

	// 跳转到 查看课题详情页
	@RequestMapping("/goTopicPage")
	public String goTopicPage(Integer topic_id, Model model) {
		Topic topic = topicServiceImpl.queryTopicByid(topic_id);
		model.addAttribute("topic", topic);
		return "topic/topic";
	}

	// 跳转到 查看课题-调查结果详情页
	@RequestMapping("/goQueryResult")
	public String goQueryResult(Integer topic_id, Model model) {
		// 查询课题
		Topic topic = topicServiceImpl.queryTopicByid(topic_id);
		// 查询课题对应的所有问题
		List<Question> questions = topicServiceImpl.queryTopic_QuestionPageBean(topic_id);
		// 查询所有问题的所有选项
		List<Options> options = topicServiceImpl.queryQuestion_Options(topic_id);

		// 匹配课题-问题-选项
		for (int i = 0; i < questions.size(); i++) {
			Question question = questions.get(i);

			for (int j = 0; j < options.size(); j++) {
				if (questions.get(i).getId() == options.get(j).getQuestion_id()) {
					question.getOptions().add(options.get(j));
				}
			}
			topic.getQuestions().add(question);
		}
		model.addAttribute("topic", topic);
		return "topic/topicResult";
	}

	// 问题结果数据查看
	public String goResultPage(Integer topic_id, Model model) {
		Topic topic = topicServiceImpl.queryTopicByid(topic_id);
		model.addAttribute("topic", topic);
		return "topic/edit";
	}

	// 跳转到 修改课题详情页
	@RequestMapping("/goUpdatePage")
	public String goUpdatePage(Integer topic_id, Model model) {
		Topic topic = topicServiceImpl.queryTopicByid(topic_id);
		model.addAttribute("topic", topic);
		return "topic/edit";
	}

	// 跳转到 课题-》问题 详情页
	@RequestMapping("/goTopic_questionPage")
	public String goTopic_questionPage() {
		return "topic/Topic_questions";
	}

	// 跳转 增加问题详情页
	@RequestMapping("/goAddTopicPage")
	public String goAddTopicPage() {
		return "topic/add";
	}

}
