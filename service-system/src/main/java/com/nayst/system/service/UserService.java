package com.nayst.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.nayst.model.system.User;

import java.util.Map;

/**
 * Date: 2023/5/3
 * Author: Administrator
 * Description:
 */
public interface UserService extends IService<User> {
    User getUserInfoByUserName(String username);

    Map<String, Object> getUserInfo(String username);
}
