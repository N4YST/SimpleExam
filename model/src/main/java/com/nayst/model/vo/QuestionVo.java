package com.nayst.model.vo;

import lombok.Data;

/**
 * Date: 2023/5/8
 * Author: Administrator
 * Description:
 */
@Data
public class QuestionVo {
    private String id;
    private String course_id;
    private String title;
    private String a;
    private String b;
    private String c;
    private String d;
    private String answer;
    private String score;
    private String type;
}
