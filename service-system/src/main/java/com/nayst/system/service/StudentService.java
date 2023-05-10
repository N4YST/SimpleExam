package com.nayst.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.nayst.model.system.UserStudent;
import com.nayst.model.vo.CourseVo;
import com.nayst.model.vo.ExpVo;

import java.util.List;
import java.util.Map;

/**
 * Date: 2023/5/4
 * Author: Administrator
 * Description:
 */
public interface StudentService extends IService<UserStudent> {
    List<Map<String,Object>> getCourseByUserId(String id, String courseName);

    List<Map<String,Object>> getExamByUserId(String id, String courseName);

    Map<String,Object> getMap(Integer page,Integer limit,List<Map<String,Object>> classList);

    List<Map<String, Object>> getPaperQuestionListByCourseName(CourseVo courseVo);

    void insertQuestion(Map<String, Object> question);

    List<Map<String, Object>> getQuestion(String courseName, String type);

    Boolean checkExp(ExpVo expVo);

    void insertExp(ExpVo expVo);

    List<Map<String, Object>> getExpList(String id, CourseVo courseVo);

    void deleteExp(ExpVo expVo);
}
