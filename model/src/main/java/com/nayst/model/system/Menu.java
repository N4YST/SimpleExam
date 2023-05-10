package com.nayst.model.system;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.nayst.model.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * Date: 2023/5/4
 * Author: Administrator
 * Description:
 */
@Data
@ApiModel(description = "菜单")
@TableName("menu")
public class Menu extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "所属上级")
    @TableField("parent_id")
    private String parentId;

    @ApiModelProperty(value = "名称")
    @TableField("name")
    private String name;

    @ApiModelProperty(value = "类型(1:菜单,2:按钮)")
    @TableField("type")
    private Integer type;

    @ApiModelProperty(value = "路由地址")
    @TableField("path")
    private String path;

    @ApiModelProperty(value = "组件路径")
    @TableField("component")
    private String component;

    @ApiModelProperty(value = "图标")
    @TableField("icon")
    private String icon;

    @ApiModelProperty(value = "排序")
    @TableField("sort_value")
    private Integer sortValue;

    @ApiModelProperty(value = "角色")
    @TableField("role")
    private String role;

    @ApiModelProperty(value = "状态(0:禁止,1:正常)")
    @TableField("status")
    private Integer status;

    // 下级列表
    @TableField(exist = false)
    private List<Menu> children;
    //是否选中
    @TableField(exist = false)
    private boolean isSelect;

}
