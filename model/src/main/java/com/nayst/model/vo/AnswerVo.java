package com.nayst.model.vo;

import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * Date: 2023/5/7
 * Author: Administrator
 * Description:
 */
@Data
public class AnswerVo {
    private List<Map<String, Object>> questionList;
    private String name;
}
