package com.nayst.model.system;

import com.baomidou.mybatisplus.annotation.TableName;
import com.nayst.model.base.BaseUser;
import io.swagger.annotations.ApiModel;
import lombok.Data;

/**
 * Date: 2023/5/3
 * Author: Administrator
 * Description:
 */
@Data
@ApiModel(description = "User")
@TableName("user")
public class User extends BaseUser {
}
