package com.nayst.model.base;

import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * Date: 2023/4/26
 * Author: Administrator
 * Description:
 */
@Data
public class BaseUser extends BaseEntity{

    @TableField("username")
    private String username;

    @TableField("password")
    private String password;

    @TableField("name")
    private String name;

    @TableField("role")
    private String role;

    @TableField("gender")
    private String gender;

    @TableField("head_path")
    private String headPath;

    @TableField("phone")
    private String phone;

    @TableField("email")
    private String email;

    @TableField("status")
    private Integer status;

}
