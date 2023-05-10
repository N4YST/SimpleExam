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
@ApiModel(description = "Teacher")
@TableName("teacher")
public class UserTeacher extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "科目")
    @TableField("course_id")
    private String course_id;

}
