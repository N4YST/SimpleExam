package com.nayst.model.base;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.util.Date;

/**
 * Date: 2023/4/26
 * Author: Administrator
 * Description:
 */
@Data
public class BaseQuestion extends BaseEntity{

    @TableField("title")
    private String title;

    @TableField("answer")
    private String answer;

    @TableField("score")
    private String score;

}
