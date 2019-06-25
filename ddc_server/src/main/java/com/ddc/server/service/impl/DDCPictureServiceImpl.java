package com.ddc.server.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ddc.server.entity.DDCPicture;
import com.ddc.server.entity.DDCRecord;
import com.ddc.server.mapper.DDCPictureMapper;
import com.ddc.server.mapper.DDCRecordMapper;
import com.ddc.server.service.IDDCPictureService;
import com.ddc.server.service.IDDCRecordService;
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
public class DDCPictureServiceImpl extends ServiceImpl<DDCPictureMapper, DDCPicture> implements IDDCPictureService {

}
