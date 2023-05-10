package com.nayst.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.nayst.model.system.UserTeacher;
import com.nayst.model.vo.ExamVo;
import com.nayst.model.vo.PaperVo;
import com.nayst.model.vo.QuestionVo;

import java.util.List;
import java.util.Map;

/**
 * Date: 2023/5/8
 * Author: Administrator
 * Description:
 */
public interface TeacherService extends IService<UserTeacher> {
    String getCourseIdByTeacherId(String id);

    List<Map<String, Object>> getQuestionList(String courseId, String questionType, String questionName);

    void addQuestion(QuestionVo questionVo);

    void deleteQuestion(QuestionVo questionVo);

    List<Map<String, Object>> getExamList(String id);

    void addExam(ExamVo examVo);

    void updateExam(ExamVo examVo);

    void deleteExam(ExamVo examVo);

    List<Map<String, Object>> getPaperList(String courseId);

    List<Map<String, Object>> getPaperQuestion(PaperVo paperVo);

    void addPaper(PaperVo paperVo);

    void deletePaper(String id);

    List<Map<String, Object>> getStuListByCourseId(String courseId);

    List<Map<String, Object>> getAnswerList(String paperId, String userId);

    void updateGrade(Map<String, Object> question);

    Object getQuestionById(Object questionId, Object questionType);

    Map<String, Object> getFinalStu(String stuId, Map<String, Object> exam);

}
