package com.nayst.model.system;

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
@ApiModel(description = "Paper")
@TableName("paper")
public class Paper extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "选择题1")
    @TableField("xzt_id_1")
    private String xzt_id_1;

    @ApiModelProperty(value = "选择题2")
    @TableField("xzt_id_2")
    private String xzt_id_2;

    @ApiModelProperty(value = "选择题3")
    @TableField("xzt_id_3")
    private String xzt_id_3;

    @ApiModelProperty(value = "选择题4")
    @TableField("xzt_id_4")
    private String xzt_id_4;

    @ApiModelProperty(value = "选择题5")
    @TableField("xzt_id_5")
    private String xzt_id_5;

    @ApiModelProperty(value = "填空题1")
    @TableField("tkt_list_1")
    private String tkt_list_1;

    @ApiModelProperty(value = "填空题2")
    @TableField("tkt_list_2")
    private String tkt_list_2;

    @ApiModelProperty(value = "填空题3")
    @TableField("tkt_list_3")
    private String tkt_list_3;

    @ApiModelProperty(value = "填空题4")
    @TableField("tkt_list_4")
    private String tkt_list_4;

    @ApiModelProperty(value = "填空题5")
    @TableField("tkt_list_5")
    private String tkt_list_5;

    @ApiModelProperty(value = "判断题1")
    @TableField("pdt_list_1")
    private String pdt_list_1;

    @ApiModelProperty(value = "判断题2")
    @TableField("pdt_list_2")
    private String pdt_list_2;

    @ApiModelProperty(value = "判断题3")
    @TableField("pdt_list_3")
    private String pdt_list_3;

    @ApiModelProperty(value = "判断题4")
    @TableField("pdt_list_4")
    private String pdt_list_4;

    @ApiModelProperty(value = "判断题5")
    @TableField("pdt_list_5")
    private String pdt_list_5;

    @ApiModelProperty(value = "主观题1")
    @TableField("zgt_list_1")
    private String zgt_list_1;

    @ApiModelProperty(value = "主观题2")
    @TableField("zgt_list_2")
    private String zgt_list_2;

    @ApiModelProperty(value = "状态")
    @TableField("status")
    private String status;

}
