package com.nayst.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.nayst.model.system.UserTeacher;
import com.nayst.model.vo.ExamVo;
import com.nayst.model.vo.PaperVo;
import com.nayst.model.vo.QuestionVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Date: 2023/5/8
 * Author: Administrator
 * Description:
 */
@Repository
public interface TeacherMapper extends BaseMapper<UserTeacher>  {
    String getCourseIdByTeacherId(@Param("id") String id);

    List<Map<String, Object>> getQuestionList(@Param("courseId") String courseId,
                                              @Param("questionType") String questionType,
                                              @Param("questionName") String questionName);

    void addXZT(QuestionVo questionVo);

    void addTKT(QuestionVo questionVo);

    void addPDT(QuestionVo questionVo);

    void addZGT(QuestionVo questionVo);

    void deleteQuestion(QuestionVo questionVo);

    List<Map<String, Object>> getExamListByCourseId(@Param("courseId") String courseId);

    void addExam(ExamVo examVo);

    void deleteExam(ExamVo examVo);

    List<Map<String, Object>> getPaperIdListByCourseId(String courseId);

    Map<String, Object> getQuestionById(String type, String questionId);

    void addPaper(PaperVo paperVo);

    void deletePaper(String id);

    List<String> getUserListByCourseId(@Param("courseId") String courseId);

    Map<String, Object> getUserInfoById(@Param("userId") String userId);

    List<Map<String, Object>> getAnswerList(String paperId, String userId);

    void updateGrade(Map<String, Object> question);

    Map<String, Object> getStuInfoById(String stuId);

    String getSumGrade(Object paperId, String id);

}
