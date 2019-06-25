package com.ddc.server.mapper;


import com.ddc.server.entity.DDCConsultaion;
import net.bytebuddy.utility.RandomString;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.Random;


public class DDCConsulationMapperTest extends BaseTest {


    @Resource
    private DDCConsulationMapper ddcConsulationMapper;
    @Resource
    private DDCChartMapper ddcChartMapper;

    @Test
    public void hello3(){
        String SOURCES =
                "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        String[] sort = {"文化","科技","军事","读书","时尚","历史","财经","旅游","汽车","纪录片"};
        RandomString rs = new RandomString();
        Random r = new Random();
        for (int i = 0; i < 40; i++) {
            ddcConsulationMapper.insert(new DDCConsultaion(generateString(new Random(),SOURCES,14),
                    sort[r.nextInt(sort.length)],generateString(r,SOURCES,24),
                    "relaxxx",System.currentTimeMillis()));
        }


    }
    public String generateString(Random random,String characters,int length) {
        char[] text = new char[length];
        for (int i = 0; i < length; i++) {
            text[i] = characters.charAt(random.nextInt(characters.length()));
        }
        return new String(text);
    }



}
