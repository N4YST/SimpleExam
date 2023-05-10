package com.nayst.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.nayst.model.system.Menu;
import com.nayst.model.vo.RouterVo;
import com.nayst.system.mapper.MenuMapper;
import com.nayst.system.service.MenuService;
import com.nayst.system.utils.MenuHelper;
import com.nayst.system.utils.RouterHelper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Date: 2023/5/4
 * Author: Administrator
 * Description:
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {
    @Override
    public List<RouterVo> getUserMenuListByRole(String role) {
        List<Menu> menuList = baseMapper.findMenuListByUserRole(role);
        List<Menu> menuTreeList = MenuHelper.buildTree(menuList);
        List<RouterVo> routerVoList = RouterHelper.buildRouters(menuTreeList);
        return routerVoList;
    }
}
