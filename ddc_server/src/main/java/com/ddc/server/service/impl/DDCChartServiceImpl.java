package com.ddc.server.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ddc.server.entity.DDCChart;
import com.ddc.server.mapper.DDCChartMapper;
import com.ddc.server.service.IDDCChartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author dingpengfei
 * @since 2019-05-09
 */
@Service
public class DDCChartServiceImpl extends ServiceImpl<DDCChartMapper, DDCChart> implements IDDCChartService {
    @Resource private DDCChartMapper userMapper;

    @Override
    public ArrayList<DDCChart> selectUserCity(){

        ArrayList<DDCChart> list = userMapper.selectUserCity();
        return list;
    }
    @Override
    public ArrayList<DDCChart> selectRecord(){

        ArrayList<DDCChart> list = userMapper.selectRecord();
        return list;
    }
    @Override
    public List<DDCChart> selectSort(){

        List<DDCChart> list = userMapper.selectSort();
        return list;
    }
    @Override
    public List<DDCChart> selectSort1(){

        List<DDCChart> list = userMapper.selectSort1();
        return list;
    }



}
