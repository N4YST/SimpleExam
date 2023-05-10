package com.nayst.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.nayst.model.system.Menu;
import com.nayst.model.vo.RouterVo;

import java.util.List;

/**
 * Date: 2023/5/4
 * Author: Administrator
 * Description:
 */
public interface MenuService extends IService<Menu> {
    List<RouterVo> getUserMenuListByRole(String role);
}
