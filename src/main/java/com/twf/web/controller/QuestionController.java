package com.twf.web.controller;

import com.twf.pojo.AJAXResult;
import com.twf.pojo.Question;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/question")
@Controller
public class QuestionController {

	// 跳转到增加问题
	@RequestMapping("/goAddquestionPage")
	public String register_index() {
		return "question/add";
	}

	// 增加问题
	@ResponseBody
	@RequestMapping("/addQuestion")
	public Object addQuestion(Question question) {

		AJAXResult result = new AJAXResult();
		try {
			/*			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			String time = format.format(new Date());

			// 设置课题时间
			topic.setCreate_time(time);
			topic.setUpdated_time(time);
			// 修改课题
			topicServiceImpl.insertTopic(topic);
*/
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}

	
	
	
	
	
	
	
}
