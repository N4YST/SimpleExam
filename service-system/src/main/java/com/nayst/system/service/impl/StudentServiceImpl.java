package com.nayst.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.nayst.model.system.UserStudent;
import com.nayst.model.vo.CourseVo;
import com.nayst.model.vo.ExpVo;
import com.nayst.system.exception.MyException;
import com.nayst.system.mapper.StudentMapper;
import com.nayst.system.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;


/**
 * Date: 2023/5/4
 * Author: Administrator
 * Description:
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, UserStudent> implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public List<Map<String,Object>> getCourseByUserId(String id, String courseName) {
        //创建装课程的list
        List<Map<String,Object>> courseList = new ArrayList();
        //创建装学生选择的课程的idList
        List<String> courseIdList = studentMapper.getCourseIdByUserId(id);
        //遍历idList，找到每一个课程的信息，装在courseList中
        for (String courseId : courseIdList) {
            Map<String,Object> courseMap = new HashMap<>();

            String cName = studentMapper.getCourseNameByCourseId(courseId, courseName);
            String teacherName = studentMapper.getTeacherNameByCourseId(courseId);
            List<Map<String, Object>> examTimeNameList = studentMapper.getExamByCourseId(courseId);

            if (cName == null) continue;
            for (Map<String, Object> examTimeName : examTimeNameList) {
                courseMap.put("courseName",cName);
                courseMap.put("teacherName",teacherName);
                courseMap.put("name",examTimeName.get("name"));
                if (examTimeName.get("start_time") == null) {
                    courseMap.put("examTime","暂未安排考试");
                } else {
                    courseMap.put("examTime",examTimeName.get("start_time"));
                }
                courseList.add(courseMap);
            }
        }

        return courseList;
    }

    @Override
    public List<Map<String,Object>> getExamByUserId(String id, String courseName) {
        //创建装考试信息的List
        List<Map<String,Object>> examList = new ArrayList();
        //创建装课程id的List
        List<String> courseIdList = studentMapper.getCourseIdByUserId(id);
        //遍历每一个课程，拿到考试信息
        for (String courseId : courseIdList) {
            List<Map<String, Object>> examMapList = studentMapper.getExamByCourseId(courseId);
            for (Map<String, Object> examMap : examMapList) {
                if (examMap == null) continue;
                examMap.put("time",examMap.get("time")+"分钟");
                String cName = studentMapper.getCourseNameByCourseId(courseId, courseName);
                if (cName == null) continue;
                examMap.put("courseName",cName);
                examList.add(examMap);
            };
        }
        return examList;
    }

    @Override
    public Map<String, Object> getMap(Integer page, Integer limit, List<Map<String,Object>> classList) {

        Integer total = classList.size();
        Integer start = (page-1)*limit;
        Integer end = page*limit;
        if (start > total) {
            throw new MyException(20001, "Wrong number!!!");
        }
        if (end > total) {
            end = total;
        }
        classList = classList.subList(start, end);

        //创建返回对象
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("total", total);
        resultMap.put("classList", classList);
        return resultMap;
    }

    @Override
    public List<Map<String, Object>> getPaperQuestionListByCourseName(CourseVo courseVo) {
        //拿到课程id
        String courseId = studentMapper.getCourseIdByCourseName(courseVo.getCourseName());
        //拿到试卷id
        String paperId = studentMapper.getPaperIdByCourseId(courseId,courseVo.getName());
        //拿到试卷的所有题目
        Map<String, Object> questionIdMap = studentMapper.getQuestionIdListByPaperId(paperId);

        List<String> typeList = new ArrayList<>();
        typeList.add("xzt");
        typeList.add("tkt");
        typeList.add("pdt");
        typeList.add("zgt");
        String table = "error";

        List<Map<String, Object>> questionList = new ArrayList<>();
        Map<String, Object> question = new HashMap<>();

        //遍历每一道题目
        if(questionIdMap != null) {
            for (String key : questionIdMap.keySet()) {
                //找到表
                for (String type : typeList) {
                    if (key.indexOf(type) != -1) {
                        table = type;
                        break;
                    }
                }
                question = studentMapper.getQuestionById((String) questionIdMap.get(key),table);
                question.put("type", table);
                questionList.add(question);
            }
        }
        return questionList;
    }

    @Override
    public void insertQuestion(Map<String, Object> question) {
        studentMapper.insertQuestion(question);
    }

    @Override
    public List<Map<String, Object>> getQuestion(String courseName, String type) {
        //拿到课程id
        String courseId = studentMapper.getCourseIdByCourseName(courseName);
        //根据课程id和type去对应的表查询题库
        List<Map<String, Object>> questionList = studentMapper.getQuestionListByCourseId(courseId,type);
        questionList.forEach(question -> question.put("type", type));
        return questionList;
    }

    @Override
    public Boolean checkExp(ExpVo expVo) {
        Integer result = studentMapper.checkExp(expVo);
        return result != 0;
    }

    @Override
    public void insertExp(ExpVo expVo) {
        studentMapper.insertExp(expVo);
    }

    @Override
    public List<Map<String, Object>> getExpList(String id, CourseVo courseVo) {
        String courseId = studentMapper.getCourseIdByCourseName(courseVo.getCourseName());
        List<Map<String, Object>> expList = studentMapper.getExpList(id, courseId, courseVo.getType());
        List<Map<String, Object>> questionList = new ArrayList<>();
        if (expList.size() != 0) {
            expList.forEach(exp -> {
                Map<String, Object> question = studentMapper.getQuestionById(exp.get("question_id").toString(),courseVo.getType());
                question.put("type",courseVo.getType());
                questionList.add(question);
            });
        }
        return questionList;
    }

    @Override
    public void deleteExp(ExpVo expVo) {
        studentMapper.deleteExp(expVo);
    }


}
