package com.nayst.system.controller;

import com.nayst.common.result.Result;
import com.nayst.common.utils.JwtHelper;
import com.nayst.common.utils.MD5;
import com.nayst.model.system.User;
import com.nayst.model.vo.LoginVo;
import com.nayst.system.exception.MyException;
import com.nayst.system.service.UserService;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Date: 2023/4/25
 * Author: Administrator
 * Description:
 */
@Api(tags = "用户登录")
@RestController
@RequestMapping("/admin/index")
public class IndexController {

    private final UserService userService;

    public IndexController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/login")
    public Result login(@RequestBody LoginVo loginVo) {
        //根据username查询数据
        User user = userService.getUserInfoByUserName(loginVo.getUsername());

        //判断是否存在
        if(user == null) {
            System.out.println("User does not exist");
            throw new MyException(20001, "User does not exist");
        }

        //判断是否禁用
        if(user.getStatus() == 0) {
            System.out.println("User is banned");
            throw new MyException(20001, "User is banned");
        }

        //判断密码
        String password = loginVo.getPassword();
        String md5Password = MD5.encrypt(password);
        if(!user.getPassword().equals(md5Password)) {
            System.out.println(password);
            System.out.println(md5Password);
            System.out.println("Password does not match");
            throw new MyException(20001, "Password does not match");
        }

        //根据userId和username返回token字符串
        String token = JwtHelper.createToken(user.getId(), user.getUsername());

        Map<String, Object> map = new HashMap<>();
        map.put("token", token);
        return Result.ok(map);
    }

    @GetMapping("/info")
    public Result info(HttpServletRequest req) {
        //从请求头中获取token
        String token = req.getHeader("token");

        //从token中获取用户id
        String username = JwtHelper.getUsername(token);

        //根据用户id获取用户信息并返回
        Map<String, Object> map = userService.getUserInfo(username);
        return Result.ok(map);
    }

    @PostMapping("/logout")
    public Result logout(){
        return Result.ok();
    }

}
