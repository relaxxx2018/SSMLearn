package com.ddc.server.service;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.service.IService;
import com.ddc.server.entity.DDCAdmin;
import com.ddc.server.entity.DDCRecord;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author dingpengfei
 * @since 2019-05-09
 */
public interface IDDCRecordService extends IService<DDCRecord> {

    DDCRecord selectById(Long no);
}

