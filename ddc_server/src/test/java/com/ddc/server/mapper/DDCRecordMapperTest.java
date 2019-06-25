package com.ddc.server.mapper;


import com.ddc.server.entity.*;
import net.bytebuddy.utility.RandomString;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.Random;


public class DDCRecordMapperTest extends BaseTest {


    @Resource
    private DDCRecordMapper ddcRecordMapper;
    @Resource
    private DDCChartMapper ddcChartMapper;

    @Resource
    private DDCPictureMapper ddcPictureMapper;


    @Test
    public void hello3(){
        String SOURCES =
                "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        RandomString rs = new RandomString();

        for (int i = 0; i < 80; i++) {
            DDCPicture p = new DDCPicture(generateString(new Random(),SOURCES,14),
                    "风景","relaxxx","/","头像");
            ddcPictureMapper.insert(p);
        }
    }


    @Test
    public void func() {
        Random r = new Random();
        String[] title= {"应急管理部：四川长宁6.0级地震","拉美国家接连遭遇大规模停电","勇敢逆行！地震发生时，13岁女孩临危不惧",
            "谈，要有谈的样子、谈的诚意","南京10岁女童被高空坠物砸重伤",
            "王毅：收回你们的黑手，香港不是你们横行的","小米手机缺货、Redmi独立、公司战略升级"
            ,"应急管理部：四川长宁6.0级地震"};
        Long[] titltid={1L,2L,3L,4L,
            5L,6L,7L,8L,9L,
                10L,11L};


        RandomString rs = new RandomString();
        for (int i = 0; i < 40; i++) {
            DDCRecord record = new DDCRecord(r.nextInt(30),"127.0.0.1",r.nextInt(2),
                    titltid[r.nextInt(title.length-1)],title[r.nextInt(title.length-1)]);
            ddcRecordMapper.insert(record);

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
