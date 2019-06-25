package com.ddc.server.service;

import com.baomidou.mybatisplus.service.IService;
import com.ddc.server.entity.DDCUser;
import com.ddc.server.entity.DDCChart;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author dingpengfei
 * @since 2019-05-09
 */
public interface IDDCChartService extends IService<DDCChart> {

    ArrayList<DDCChart> selectUserCity();
    ArrayList<DDCChart> selectRecord();
    List<DDCChart> selectSort();
    List<DDCChart> selectSort1();

}

