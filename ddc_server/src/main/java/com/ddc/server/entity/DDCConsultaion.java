package com.ddc.server.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
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
@TableName("ddc_consulation")
public class DDCConsultaion extends Model<DDCConsultaion> {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId("id")
    private Long id;

    /**
     * title
     */
    private String title;

    /**
     * subtitle
     */
    private String subtitle;

    /**
     * column
     */
    private String column;

    /**
     * title_type
     */
    @TableField(value = "title_type")
    private String titleType;

    /**
     * sort
     */
    private String sort;

    /**
     * key_word
     */
    @TableField(value = "key_word")
    private String keyWord;

    /**
     * abstract
     */
    private String abstracts;

    /**
     * content
     */
    private String content;

    /**
     * author
     */
    private String author;

    /**
     * source
     */
    private String source;

    /**
     * return_time
     */
    @TableField(value = "create_time")
    private Long createTime;

    /**
     * update_time
     */
    @TableField(value = "update_time")
    private Long updateTime;

    /**
     * end_time
     */
    @TableField(value = "end_time")
    private Long endTime;

    /**
     * views
     */
    private Integer views;

    /**
     * post_status
     */
    @TableField(value = "post_status")
    private Integer postStatus;

    /**
     * delete_flag
     */
    @TableField(value = "delete_flag")
    private Integer deleteFlag;




    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    public DDCConsultaion(String title, String sort, String content, String author, Long createTime) {
        this.title = title;
        this.sort = sort;
        this.content = content;
        this.author = author;
        this.createTime = createTime;
    }
}
