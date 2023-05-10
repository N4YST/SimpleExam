package com.nayst.model.system;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.nayst.model.base.BaseEntity;
import com.nayst.model.base.BaseUser;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


/**
 * Date: 2023/4/26
 * Author: Administrator
 * Description:
 */
@Data
@ApiModel(description = "Student")
@TableName("student")
public class UserStudent extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "学号")
    @TableField("stu_id")
    private String stu_id;

    @ApiModelProperty(value = "班级")
    @TableField("class_id")
    private String class_id;

}
