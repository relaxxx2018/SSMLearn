package com.ddc.server.controller;


import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.toolkit.CollectionUtils;
import com.ddc.server.annotation.CurrentUser;
import com.ddc.server.config.web.http.ResponseHelper;
import com.ddc.server.config.web.http.ResponseModel;
import com.ddc.server.config.web.http.ResponsePageHelper;
import com.ddc.server.config.web.http.ResponsePageModel;
import com.ddc.server.entity.DDCAdmin;
import com.ddc.server.entity.DDCPicture;
import com.ddc.server.entity.DDCRecord;
import com.ddc.server.service.IDDCPictureService;
import com.ddc.server.service.IDDCRecordService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/record")
public class RecordController {
    @Resource
    private IDDCRecordService recordService;



    @ResponseBody
    @RequestMapping("/all")
    public ResponsePageModel<DDCRecord> getAll(@RequestParam(name = "page", required = false, defaultValue = "1") Integer pageNumber,
                                                @RequestParam(name = "limit", required = false, defaultValue = "10") Integer pageSize,
                                                String start, String end, String keywords) throws Exception{

        Wrapper<DDCRecord> wrapper = new EntityWrapper<>();
//        if (!StringUtils.isEmpty(start)) {
//            wrapper = wrapper.ge("create_time", start);
//        }
//        if (!StringUtils.isEmpty(end)) {
//            wrapper = wrapper.le("create_time", end);
//        }
//        if (!StringUtils.isEmpty(keywords)) {
//            wrapper = wrapper.like("username", keywords);
//        }
        ResponsePageModel<DDCRecord> page = ResponsePageHelper.buildResponseModel(
                recordService.selectPage(new Page<>(pageNumber, pageSize), wrapper));

        System.out.println(page);
        return page;

    }
    @RequestMapping("/delete")
    @ResponseBody
    public ResponseModel<String> delete(@RequestParam String ids) throws Exception {
        String[] arr = ids.split(",");
        List<Long> idArray = new ArrayList<>(5);
        for (int i = 0; i < arr.length; i++) {
            if (!StringUtils.isEmpty(arr[i]) && org.apache.commons.lang3.StringUtils.isNumeric(arr[i])) {
                idArray.add(Long.valueOf(arr[i]));
            }
        }
        if (!CollectionUtils.isEmpty(idArray)) {
            recordService.deleteBatchIds(idArray);
            return ResponseHelper.buildResponseModel("删除成功");
        } else {
            return new ResponseModel<String>("删除失败", ResponseModel.FAIL.getCode());
        }

    }




}
