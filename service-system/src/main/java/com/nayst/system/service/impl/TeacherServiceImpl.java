package com.nayst.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.nayst.model.system.UserTeacher;
import com.nayst.model.vo.ExamVo;
import com.nayst.model.vo.PaperVo;
import com.nayst.model.vo.QuestionVo;
import com.nayst.system.mapper.TeacherMapper;
import com.nayst.system.service.TeacherService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Date: 2023/5/8
 * Author: Administrator
 * Description:
 */
@Service
public class TeacherServiceImpl extends ServiceImpl<TeacherMapper, UserTeacher> implements TeacherService {

    private final TeacherMapper teacherMapper;

    public TeacherServiceImpl(TeacherMapper teacherMapper) {
        this.teacherMapper = teacherMapper;
    }

    @Override
    public String getCourseIdByTeacherId(String id) {
        return teacherMapper.getCourseIdByTeacherId(id);
    }

    @Override
    public List<Map<String, Object>> getQuestionList(String courseId, String questionType, String questionName) {
        return teacherMapper.
                getQuestionList(courseId, questionType, questionName);
    }

    @Override
    public void addQuestion(QuestionVo questionVo) {
        switch (questionVo.getType()) {
            case "xzt":
                teacherMapper.addXZT(questionVo);
                break;
            case "tkt":
                teacherMapper.addTKT(questionVo);
                break;
            case "pdt":
                teacherMapper.addPDT(questionVo);
                break;
            case "agt":
                teacherMapper.addZGT(questionVo);
                break;
        }
    }

    @Override
    public void deleteQuestion(QuestionVo questionVo) {
        teacherMapper.deleteQuestion(questionVo);
    }

    @Override
    public List<Map<String, Object>> getExamList(String id) {
        String courseId = teacherMapper.getCourseIdByTeacherId(id);
        return teacherMapper.getExamListByCourseId(courseId);
    }

    @Override
    public void addExam(ExamVo examVo) {
        teacherMapper.addExam(examVo);
    }

    @Override
    public void updateExam(ExamVo examVo) {
        teacherMapper.addExam(examVo);
        teacherMapper.deleteExam(examVo);
    }

    @Override
    public void deleteExam(ExamVo examVo) {
        teacherMapper.deleteExam(examVo);
    }

    @Override
    public List<Map<String, Object>> getPaperList(String courseId) {
        return teacherMapper.
                getPaperIdListByCourseId(courseId);
    }

    //屎山
    @Override // 屎山
    public List<Map<String, Object>> getPaperQuestion(PaperVo paperVo) {
        List<Map<String, Object>> list = new ArrayList<>();
        Map<String, Object> question;
        
        String type = "xzt";
        
        question = teacherMapper.getQuestionById(type,paperVo.getXzt_id_1());
        question.put("type", type);
        list.add(question);
        
        question = teacherMapper.getQuestionById(type,paperVo.getXzt_id_2());
        question.put("type", type);
        list.add(question);
        
        question = teacherMapper.getQuestionById(type,paperVo.getXzt_id_3());
        question.put("type", type);
        list.add(question);
        
        question = teacherMapper.getQuestionById(type,paperVo.getXzt_id_4());
        question.put("type", type);
        list.add(question);
        
        question = teacherMapper.getQuestionById(type,paperVo.getXzt_id_5());
        question.put("type", type);
        list.add(question);

        type = "pdt";

        question = teacherMapper.getQuestionById(type,paperVo.getPdt_id_1());
        question.put("type", type);
        list.add(question);

        question = teacherMapper.getQuestionById(type,paperVo.getPdt_id_2());
        question.put("type", type);
        list.add(question);

        question = teacherMapper.getQuestionById(type,paperVo.getPdt_id_3());
        question.put("type", type);
        list.add(question);

        question = teacherMapper.getQuestionById(type,paperVo.getPdt_id_4());
        question.put("type", type);
        list.add(question);

        question = teacherMapper.getQuestionById(type,paperVo.getPdt_id_5());
        question.put("type", type);
        list.add(question);

        type = "tkt";

        question = teacherMapper.getQuestionById(type,paperVo.getTkt_id_1());
        question.put("type", type);
        list.add(question);

        question = teacherMapper.getQuestionById(type,paperVo.getTkt_id_2());
        question.put("type", type);
        list.add(question);

        question = teacherMapper.getQuestionById(type,paperVo.getTkt_id_3());
        question.put("type", type);
        list.add(question);

        question = teacherMapper.getQuestionById(type,paperVo.getTkt_id_4());
        question.put("type", type);
        list.add(question);

        question = teacherMapper.getQuestionById(type,paperVo.getTkt_id_5());
        question.put("type", type);
        list.add(question);

        type = "zgt";

        question = teacherMapper.getQuestionById(type,paperVo.getZgt_id_1());
        question.put("type", type);
        list.add(question);

        question = teacherMapper.getQuestionById(type,paperVo.getZgt_id_2());
        question.put("type", type);
        list.add(question);

        return list;
    }

    @Override
    public void addPaper(PaperVo paperVo) {
        teacherMapper.addPaper(paperVo);
    }

    @Override
    public void deletePaper(String id) {
        teacherMapper.deletePaper(id);
    }

    @Override
    public List<Map<String, Object>> getStuListByCourseId(String courseId) {
        List<Map<String, Object>> list = new ArrayList<>();
        List<String> userIdList = teacherMapper.getUserListByCourseId(courseId);
        userIdList.forEach(id -> list.add(teacherMapper.getUserInfoById(id)));
        return list;
    }

    @Override
    public List<Map<String, Object>> getAnswerList(String paperId, String userId) {
        return teacherMapper.getAnswerList(paperId, userId);
    }

    @Override
    public void updateGrade(Map<String, Object> question) {
        teacherMapper.updateGrade(question);
    }


    @Override
    public Object getQuestionById(Object type, Object questionId) {
        return teacherMapper.getQuestionById(type.toString(), questionId.toString());
    }

    @Override
    public Map<String, Object> getFinalStu(String id, Map<String, Object> exam) {
        Map<String, Object> result = new HashMap<>();
        result.put("name",teacherMapper.getUserInfoById(id).get("name"));
        Map<String, Object> stuObj = teacherMapper.getStuInfoById(id);
        result.put("stuId",stuObj.get("stu_id"));
        result.put("className",stuObj.get("class_name"));
        result.put("exam",exam.get("name"));
        result.put("paper",exam.get("paper_id"));
        String grade = teacherMapper.getSumGrade(exam.get("paper_id"),id);
        if (grade == null) {
            result.put("grade","未考试");
        } else {
            result.put("grade",grade);
        }
        return result;
    }


}
