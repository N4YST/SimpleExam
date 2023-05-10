package com.nayst.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.nayst.model.system.UserStudent;
import com.nayst.model.vo.ExpVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Date: 2023/5/4
 * Author: Administrator
 * Description:
 */
@Repository
public interface StudentMapper extends BaseMapper<UserStudent> {
    List<String> getCourseIdByUserId(@Param("userId") String userId);

    String getCourseNameByCourseId(@Param("courseId") String courseId, @Param("courseName") String courseName);

    String getTeacherNameByCourseId(@Param("courseId") String courseId);


    List<Map<String, Object>> getExamByCourseId(@Param("courseId") String courseId);

    String getCourseIdByCourseName(@Param("courseName") String courseName);

    String getPaperIdByCourseId(@Param("courseId") String courseId, @Param("name") String name);

    Map<String, Object> getQuestionIdListByPaperId(@Param("paperId") String paperId);

    Map<String, Object> getQuestionById(@Param("id") String id,@Param("table") String table);

    void insertQuestion(Map<String, Object> question);

    List<Map<String, Object>> getQuestionListByCourseId(String courseId, String type);

    void insertTable(Map<String, Object> question);

    Integer checkExp(ExpVo expVo);

    void insertExp(ExpVo expVo);

    List<Map<String, Object>> getExpList(@Param("id") String id,
                                         @Param("courseId")  String courseId,
                                         @Param("type")  String type);

    void deleteExp(ExpVo expVo);
}
