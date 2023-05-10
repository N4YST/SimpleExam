package com.nayst.system;

import com.nayst.common.utils.JwtHelper;
import com.nayst.model.system.Menu;
import com.nayst.model.system.Paper;
import com.nayst.model.system.User;
import com.nayst.model.vo.CourseVo;
import com.nayst.model.vo.ExpVo;
import com.nayst.model.vo.PaperVo;
import com.nayst.model.vo.StuVo;
import com.nayst.system.exception.MyException;
import com.nayst.system.mapper.MenuMapper;
import com.nayst.system.mapper.StudentMapper;
import com.nayst.system.mapper.TeacherMapper;
import com.nayst.system.service.StudentService;
import com.nayst.system.service.TeacherService;
import com.nayst.system.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.*;

/**
 * Date: 2023/5/3
 * Author: Administrator
 * Description:
 */
@SpringBootTest
public class TestFunction {
    @Autowired
    private UserService userService;

    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private TeacherMapper teacherMapper;

    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;

    @Test
    public void testStudent() {
        Map<String, Object> exam = new HashMap<String, Object>();
        exam.put("name", "期末考试");
        exam.put("paper_id", "1");
        System.out.println(teacherService.getFinalStu("2",exam));
    }

    @Test
    public void testTeacher() {
        List<String> typeList = new ArrayList<>();
        typeList.add("xzt");
        typeList.add("pdt");
        typeList.add("tkt");
        typeList.add("zgt");
        System.out.println(Arrays.asList(typeList).contains("xzt"));
    }

    @Test
    public void insertTable() {
        for (int j = 1; j < 9; j++) {
            for (int i = 5 * (j-1) + 1; i <= 5 * j; i++) {
                Map<String, Object> map = new HashMap<>();
                map.put("q", j);
                map.put("w", "z"+i);
                map.put("e", i);
                //map.put("r", i);
                //map.put("a", i);
                //map.put("s", i);
                //map.put("d", "a");
                studentMapper.insertTable(map);
            }
        }
    }

}
