package com.twf.dao;

import com.twf.pojo.Options;
import com.twf.pojo.PageBean;
import com.twf.pojo.Question;
import com.twf.pojo.Topic;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ITopicDao {


    /**
     * 查询总记录数
     */
    Integer queryTopicSize(PageBean<Topic> pageBean);


    /**
     *     查询每页记录数据
     */
    List<Topic> queryTopicPageBean(PageBean<Topic> pageBean);

    /**
     * 根据topic_id查询 此问卷所有问题
     * @param topic_id
     * @return
     */
    @Select("select * from t_questions where topic_id=#{topic_id}")
    List<Question> queryTopic_QuestionPageBean(Integer topic_id);

    /**
     * 根据topic_id查询 问卷
     * @param topic_id
     * @return
     */
    @Select("select * from t_topic where id=#{topic_id}")
	Topic queryTopicByid(Integer topic_id);

    
    
   /**
    * 
    * 修改课题
    * @param topic
    */
	void updateTopic(Topic topic);

	
	
	/**
	 * 根据id删除课题 及课题关联的问题
	 * @param topic_id
	 */
	
    void deleteTopicById(Integer topic_id);


    /**
     * 增加课题
     * @param topic
     */
    
	void insertTopic(Topic topic);

	/**
	 * 查询课题下问题的所有选项
	 * SELECT * FROM t_options
	 *  WHERE question_id in(select question_id from t_questions WHERE topic_id=1 )
	 * @param topic_id
	 * @return
	 */
	@Select("SELECT * FROM t_options WHERE question_id in(select question_id from t_questions WHERE topic_id=#{topic_id})")
	List<Options> queryQuestion_Options(Integer topic_id);
}
