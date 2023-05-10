package com.nayst.system.utils;

import com.nayst.model.system.Menu;

import java.util.ArrayList;
import java.util.List;

/**
 * Date: 2023/4/22
 * Author: Administrator
 * Description:
 */
public class MenuHelper {
    //构建树形结构
    public static List<Menu> buildTree(List<Menu> menuList) {
        //创建集合封装最终数据
        List<Menu> trees = new ArrayList<>();

        //遍历所有菜单集合，找到根节点开始递归
        for (Menu menu : menuList) {
            if (menu.getParentId().equals("0")) {
                trees.add(findChildren(menu,menuList));
            }
        }

        return trees;
    }

    private static Menu findChildren(Menu menu, List<Menu> treeNodes) {
        //数据初始化
        menu.setChildren(new ArrayList<Menu>());

        //遍历递归查找
        for (Menu it : treeNodes) {
            if(menu.getId().equals(it.getParentId())) {
                if(menu.getChildren() == null) {
                    menu.setChildren(new ArrayList<>());
                }
                menu.getChildren().add(findChildren(it,treeNodes));
            }
        }
        return menu;
    }
}
