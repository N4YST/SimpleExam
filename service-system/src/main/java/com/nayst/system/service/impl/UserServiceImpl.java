package com.nayst.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.nayst.model.system.User;
import com.nayst.model.vo.RouterVo;
import com.nayst.system.mapper.UserMapper;
import com.nayst.system.service.MenuService;
import com.nayst.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Date: 2023/5/3
 * Author: Administrator
 * Description:
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    private MenuService menuService;

    @Override
    public User getUserInfoByUserName(String username) {
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq("username",username);
        return baseMapper.selectOne(wrapper);
    }

    @Override
    public Map<String, Object> getUserInfo(String username) {
        //根据用户名称查询信息
        User user = getUserInfoByUserName(username);

        //根据userId查询菜单权限
        List<RouterVo> routerVoList = menuService.getUserMenuListByRole(user.getRole());

        Map<String, Object> map = new HashMap<>();
        map.put("name", user.getName());
        map.put("avatar", user.getHeadPath());
        map.put("role",user.getRole());
        map.put("routers", routerVoList);
        return map;
    }
}
