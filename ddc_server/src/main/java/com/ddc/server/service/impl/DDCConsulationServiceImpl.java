package com.ddc.server.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ddc.server.entity.DDCConsultaion;
import com.ddc.server.mapper.DDCConsulationMapper;
import com.ddc.server.service.IDDCConsulationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author dingpengfei
 * @since 2019-05-09
 */
@Service
public class DDCConsulationServiceImpl extends ServiceImpl<DDCConsulationMapper, DDCConsultaion> implements IDDCConsulationService {
    @Resource private DDCConsulationMapper consulationMapper;


}
