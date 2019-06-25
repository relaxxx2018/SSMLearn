package com.ddc.server.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.*;

import java.io.Serializable;

/**
 * <p>
 * 管理员
 * </p>
 *
 * @author dingpengfei
 * @since 2019-05-09
 */
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@TableName("ddc_picture")
public class DDCPicture extends Model<DDCPicture> {

    private static final long serialVersionUID = 1L;

    /**
     * 图片id
     */
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;

    /**
     * 图片名称
     */
    @TableField(value = "picture_name")
    private String pictureName;

    /**
     * 分类
     */
    private String classify;

    /**
     * 图片作者
     */
    private String author;
    private String tag;

    /**
     * 具体图片--存储url
     */
    private String picture;

    /**
     * 更新时间
     */
    @TableField(value = "update_time")
    private Long updateTime;



    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    public DDCPicture(String pictureName, String classify, String author, String picture,String tag) {
        this.pictureName = pictureName;
        this.classify = classify;
        this.author = author;
        this.picture = picture;
        this.updateTime=System.currentTimeMillis();
        this.tag=tag;
    }
}
