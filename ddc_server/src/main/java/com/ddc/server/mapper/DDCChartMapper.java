package com.ddc.server.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ddc.server.entity.DDCChart;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;
import java.util.List;

/**
 * Mapper 接口
 *
 * @author dingpengfei
 * @since 2019-05-09
 */
public interface DDCChartMapper extends BaseMapper<DDCChart> {
    @Select("select count(id) as value,city as name from ddc_user GROUP BY city")
    ArrayList<DDCChart> selectUserCity();

    @Select("select count(info_title) as value,info_title as name from ddc_record GROUP BY info_title")
    ArrayList<DDCChart> selectRecord();

    @Select("select count(sort) as value,sort as name from ddc_consulation GROUP BY sort")
    List<DDCChart> selectSort();

    @Select("select count(classify) as value,classify as name from ddc_picture GROUP BY classify")
    List<DDCChart> selectSort1();


}
