package com.ddc.server.controller;



import com.ddc.server.config.web.http.ResponseHelper;

import com.ddc.server.config.web.http.ResponseModel;
import com.ddc.server.entity.DDCChart;

import com.ddc.server.service.IDDCChartService;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/chart")
public class ChartController {
    @Resource
    private IDDCChartService chartService;



    @ResponseBody
    @RequestMapping("/userCity")
    public ResponseModel<ArrayList<DDCChart>> userCity() throws Exception {
        ArrayList<DDCChart> list = chartService.selectUserCity();

        return ResponseHelper.buildResponseModel(list);
    }
    @ResponseBody
    @RequestMapping("/record")
    public ResponseModel<ArrayList<DDCChart>> record() throws Exception {
        ArrayList<DDCChart> list = chartService.selectRecord();

        System.out.println(ResponseHelper.buildResponseModel(list).getData());
        return ResponseHelper.buildResponseModel(list);
    }
    @ResponseBody
    @RequestMapping("/sort")
    public ResponseModel<List<DDCChart>> sort() throws Exception {
        List<DDCChart> list =  chartService.selectSort();

        System.out.println(ResponseHelper.buildResponseModel(list));
        return ResponseHelper.buildResponseModel(list);
    }
    @ResponseBody
    @RequestMapping("/sort1")
    public ResponseModel<List<DDCChart>> sort1() throws Exception {
        List<DDCChart> list =  chartService.selectSort1();

        System.out.println(ResponseHelper.buildResponseModel(list).getData());
        return ResponseHelper.buildResponseModel(list);
    }


}
