package com.nayst.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.nayst.model.system.Menu;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Date: 2023/5/4
 * Author: Administrator
 * Description:
 */
@Repository
public interface MenuMapper extends BaseMapper<Menu> {
    List<Menu> findMenuListByUserRole(@Param("role") String role);
}
