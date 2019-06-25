package com.ddc.server.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ddc.server.config.web.http.ResponseHelper;
import com.ddc.server.config.web.http.ResponseModel;
import com.ddc.server.entity.DDCConsultaion;
import com.ddc.server.service.IDDCConsulationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/consulation")
public class ConsulationController {

    @Resource
    private IDDCConsulationService consulationService;

    @RequestMapping("/all")
    @ResponseBody

    public ResponseModel<Page<DDCConsultaion>> SelectALL(@RequestParam(name = "pageIndex", defaultValue = "1", required = false) Integer pageIndex,
                                                 @RequestParam(name = "pageSize", defaultValue = "10", required = false) Integer pageSize){
        List<DDCConsultaion> list = consulationService.selectList(new EntityWrapper<DDCConsultaion>());
        System.out.println(ResponseHelper.buildResponseModel(consulationService.selectPage(new Page<>(pageIndex,pageSize))));
        return ResponseHelper.buildResponseModel(consulationService.selectPage(new Page<>(pageIndex,pageSize)));
//        return ResponseHelper.buildResponseModel(list);
    }

}
