package com.nayst.system.controller;

import com.nayst.common.result.Result;
import com.nayst.common.utils.JwtHelper;
import com.nayst.model.vo.AnswerVo;
import com.nayst.model.vo.CourseVo;
import com.nayst.model.vo.ExpVo;
import com.nayst.system.exception.MyException;
import com.nayst.system.mapper.StudentMapper;
import com.nayst.system.service.StudentService;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Date: 2023/5/4
 * Author: Administrator
 * Description:
 */
@Api(tags = "学生接口")
@RestController
@RequestMapping("/admin/student")
public class StudentController {
    private final StudentService studentService;

    private final StudentMapper studentMapper;

    public StudentController(StudentService studentService, StudentMapper studentMapper) {
        this.studentService = studentService;
        this.studentMapper = studentMapper;
    }

    @GetMapping("/getCourseList/{page}/{limit}")
    public Result getCourseList(HttpServletRequest req,
                                @PathVariable Integer page,
                                @PathVariable Integer limit,
                                CourseVo courseVo) {
        //从请求头中获取token
        String token = req.getHeader("token");

        //从token中获取用户id
        String id = JwtHelper.getUserId(token);

        //根据用户id获取用户信息并返回
        List<Map<String,Object>> classList = studentService.getCourseByUserId(id, courseVo.getCourseName());

        if (classList.size() != 0) {
            //创建返回对象
            Map<String,Object> resultMap = studentService.getMap(page,limit,classList);
            return Result.ok(resultMap);
        } else {
            return Result.ok();
        }

    }

    @GetMapping("/getExamList/{page}/{limit}")
    public Result getExamList(HttpServletRequest req,
                              @PathVariable Integer page,
                              @PathVariable Integer limit,
                              CourseVo courseVo) {
        //从请求头中获取token
        String token = req.getHeader("token");

        //从token中获取用户id
        String id = JwtHelper.getUserId(token);

        //根据用户id获取用户信息并返回
        List<Map<String,Object>> classList = studentService.getExamByUserId(id, courseVo.getCourseName());

        if (classList.size() != 0) {
            //创建返回对象
            Map<String,Object> resultMap = studentService.getMap(page,limit,classList);
            return Result.ok(resultMap);
        }else{
            return Result.ok();
        }

    }

    @PostMapping("/startExam")
    public Result startExam(@RequestBody CourseVo courseVo) {
        //遍历题目列表，放到questionList
        List<Map<String, Object>> questionList = studentService.
                getPaperQuestionListByCourseName(courseVo);
        return Result.ok(questionList);
    }

    @PostMapping("/sendPaper")
    public Result sendPaper(HttpServletRequest req,
                            @RequestBody AnswerVo answerVo) {
        //从请求头中获取token
        String token = req.getHeader("token");

        //从token中获取用户id
        String id = JwtHelper.getUserId(token);

        answerVo.getQuestionList().forEach(question -> {
            question.put("paperId", studentMapper.getPaperIdByCourseId(question.get("course_id").toString(),answerVo.getName()));
            question.put("userId", id);
            studentService.insertQuestion(question);
        });
        return Result.ok();
    }

    @GetMapping("/practice")
    public Result practice(CourseVo courseVo) {

        List<Map<String, Object>> question = studentService.
                getQuestion(courseVo.getCourseName(),courseVo.getType());

        return Result.ok(question);
    }

    @PostMapping("/addExp")
    public Result addExp(HttpServletRequest req,
                         @RequestBody ExpVo expVo) {
        //从请求头中获取token
        String token = req.getHeader("token");
        //从token中获取用户id
        String id = JwtHelper.getUserId(token);
        expVo.setUser_id(id);

        Boolean isExist = studentService.checkExp(expVo);
        if (isExist) throw new MyException(20001,"你已添加为错题！");

        studentService.insertExp(expVo);
        return Result.ok();
    }

    @GetMapping("/getExpList")
    public Result getExpList(HttpServletRequest req,
                             CourseVo courseVo) {
        //从请求头中获取token
        String token = req.getHeader("token");
        //从token中获取用户id
        String id = JwtHelper.getUserId(token);
        List<Map<String, Object>> expList = studentService.getExpList(id,courseVo);
        System.out.println(courseVo);
        return Result.ok(expList);
    }

    @PostMapping("/deleteExp")
    public Result deleteExp(HttpServletRequest req,
                         @RequestBody ExpVo expVo) {
        //从请求头中获取token
        String token = req.getHeader("token");
        //从token中获取用户id
        String id = JwtHelper.getUserId(token);
        expVo.setUser_id(id);

        studentService.deleteExp(expVo);
        return Result.ok();
    }
}
