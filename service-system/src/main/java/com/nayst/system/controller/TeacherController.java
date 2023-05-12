package com.nayst.system.controller;

import com.nayst.common.result.Result;
import com.nayst.common.utils.JwtHelper;
import com.nayst.model.vo.*;
import com.nayst.system.exception.MyException;
import com.nayst.system.service.TeacherService;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Date: 2023/5/8
 * Author: Administrator
 * Description:
 */
@Api(tags = "教师接口")
@RestController
@RequestMapping("/admin/teacher")
public class TeacherController {
    private final TeacherService teacherService;

    public TeacherController(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @GetMapping("/getQuestionList/{page}/{limit}")
    public Result getQuestionList(HttpServletRequest req,
                                  @PathVariable Integer page,
                                  @PathVariable Integer limit,
                                  @RequestParam("questionName") String questionName,
                                  @RequestParam("questionType") String questionType) {
        //从请求头中获取token
        String token = req.getHeader("token");
        //从token中获取用户id
        String id = JwtHelper.getUserId(token);
        String courseId = teacherService.getCourseIdByTeacherId(id);
        List<Map<String, Object>> questionList = teacherService.
                getQuestionList(courseId,questionType,questionName);
        int total = questionList.size();
        int start = (page-1)*limit;
        int end = page*limit;
        if (start > total) {
            throw new MyException(20001, "Wrong number!!!");
        }
        if (end > total) {
            end = total;
        }
        questionList = questionList.subList(start, end);

        //创建返回对象
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("total", total);
        resultMap.put("questionList", questionList);
        return Result.ok(resultMap);
    }

    @PostMapping("/addQuestion")
    public Result addQuestion(HttpServletRequest req,@RequestBody QuestionVo questionVo){
        //从请求头中获取token
        String token = req.getHeader("token");
        //从token中获取用户id
        String id = JwtHelper.getUserId(token);
        String courseId = teacherService.getCourseIdByTeacherId(id);
        questionVo.setCourse_id(courseId);
        teacherService.addQuestion(questionVo);
        return Result.ok();
    }

    @PostMapping("/updateQuestion")
    public Result updateQuestion(HttpServletRequest req,@RequestBody QuestionVo questionVo){
        //从请求头中获取token
        String token = req.getHeader("token");
        //从token中获取用户id
        String id = JwtHelper.getUserId(token);
        String courseId = teacherService.getCourseIdByTeacherId(id);
        questionVo.setCourse_id(courseId);
        teacherService.deleteQuestion(questionVo);
        teacherService.addQuestion(questionVo);
        return Result.ok();
    }

    @PostMapping("/deleteQuestion")
    public Result deleteQuestion(@RequestBody QuestionVo questionVo){
        //String[] typeList = {"xzt", "pdt", "tkt", "zgt"};
        //if ( !Arrays.asList(typeList).contains(questionVo.getType()) )
        //    throw new MyException(20001, "Invalid type");
        teacherService.deleteQuestion(questionVo);
        return Result.ok();
    }

    @GetMapping("/getExamList")
    public Result getExamList(HttpServletRequest req) {
        //从请求头中获取token
        String token = req.getHeader("token");
        //从token中获取用户id
        String id = JwtHelper.getUserId(token);
        List<Map<String, Object>> list = teacherService.getExamList(id);
        return Result.ok(list);
    }

    @PostMapping("/addExam")
    public Result addExam(HttpServletRequest req,
                          @RequestBody ExamVo examVo) {
        //从请求头中获取token
        String token = req.getHeader("token");
        //从token中获取用户id
        String id = JwtHelper.getUserId(token);
        String courseId = teacherService.getCourseIdByTeacherId(id);
        examVo.setCourse_id(courseId);
        teacherService.addExam(examVo);
        return Result.ok();
    }

    @PostMapping("/deleteExam")
    public Result deleteExam(@RequestBody ExamVo examVo) {
        teacherService.deleteExam(examVo);
        return Result.ok();
    }

    @PostMapping("/updateExam")
    public Result updateExam(@RequestBody ExamVo examVo) {
        teacherService.updateExam(examVo);
        return Result.ok();
    }

    @GetMapping("/getPaperList")
    public Result getPaperList(HttpServletRequest req) {
        //从请求头中获取token
        String token = req.getHeader("token");
        //从token中获取用户id
        String id = JwtHelper.getUserId(token);
        String courseId = teacherService.getCourseIdByTeacherId(id);
        List<Map<String, Object>> list = teacherService.getPaperList(courseId);
        return Result.ok(list);
    }

    @PostMapping("/getPaperQuestion")
    public Result getPaperQuestion(@RequestBody PaperVo paperVo){
        System.out.println(paperVo);
        List<Map<String, Object>> list = teacherService.getPaperQuestion(paperVo);
        return Result.ok(list);
    }

    @PostMapping("/addPaper")
    public Result addPaper(HttpServletRequest req,
                           @RequestBody PaperVo paperVo) {
        //从请求头中获取token
        String token = req.getHeader("token");
        //从token中获取用户id
        String id = JwtHelper.getUserId(token);
        String courseId = teacherService.getCourseIdByTeacherId(id);
        paperVo.setCourse_id(courseId);
        teacherService.addPaper(paperVo);
        return Result.ok();
    }

    @PostMapping("/deletePaper")
    public Result deletePaper(@RequestBody PaperVo paperVo) {
        teacherService.deletePaper(paperVo.getId());
        return Result.ok();
    }

    @PostMapping("/updatePaper")
    public Result updatePaper(@RequestBody PaperVo paperVo) {
        teacherService.deletePaper(paperVo.getId());
        teacherService.addPaper(paperVo);
        return Result.ok();
    }

    @GetMapping("/getStuList")
    public Result getStuList(HttpServletRequest req) {
        //从请求头中获取token
        String token = req.getHeader("token");
        //从token中获取用户id
        String id = JwtHelper.getUserId(token);
        String courseId = teacherService.getCourseIdByTeacherId(id);
        List<Map<String, Object>> list = teacherService.getStuListByCourseId(courseId);
        return Result.ok(list);
    }

    @GetMapping("/getAnswerList")
    public Result getAnswerList(@RequestParam("paper_id") String paperId,
                                @RequestParam("id") String userId) {
        List<Map<String, Object>> list = teacherService.getAnswerList(paperId,userId);
        for (Map<String, Object> answer : list) {
            answer.put("question", teacherService.
                    getQuestionById(answer.get("question_type"),answer.get("question_id")));
        }
        return Result.ok(list);
    }

    @PostMapping("/checkAnswer")
    public Result checkAnswer(@RequestBody AnswerVo answerVo) {
        answerVo.getQuestionList().forEach(teacherService::updateGrade);
        return Result.ok();
    }

    @PostMapping("/getFinalStuList")
    public Result getFinalStuList(HttpServletRequest req,
                                  @RequestBody StuVo stuVo) {
        //从请求头中获取token
        String token = req.getHeader("token");
        //从token中获取用户id
        String id = JwtHelper.getUserId(token);
        List<Map<String, Object>> examList = teacherService.getExamList(id);
        List<Map<String, Object>> list = new ArrayList<>();
        for (Map<String, Object> stu : stuVo.getStuList()) {
            for (Map<String, Object> exam : examList) {
                System.out.println(stu.get("id").toString());
                System.out.println(exam);
                list.add(teacherService.getFinalStu(stu.get("id").toString(), exam));
            }
        }
        System.out.println(list);
        return Result.ok(list);
    }
}