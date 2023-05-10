package com.nayst.model.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.nayst.model.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * Date: 2023/4/26
 * Author: Administrator
 * Description:
 */
@Data
public class ExamVo {
    private String id;
    private String name;

    private String course_id;

    private String paper_id;

    private String start_time;

    private String end_time;

    private String description;

    private String status;

}
