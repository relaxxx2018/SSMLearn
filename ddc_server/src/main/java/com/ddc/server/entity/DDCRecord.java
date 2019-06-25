package com.ddc.server.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.*;

import java.io.Serializable;
import java.util.Date;

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
@TableName("ddc_record")
public class DDCRecord extends Model<DDCRecord> {

    private static final long serialVersionUID = 1L;

    /**
     * 浏览记录id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 用户id
     */
    @TableField(value = "user_id")
    private int userId;

    /**
     * ip
     */
    private String ip;

    /**
     * 访问时间
     */
    @TableField(value = "visit_time")
    private Long visitTime;

    /**
     * 是否为会员
     */
    @TableField(value = "is_member")
    private int isMember;

    /**
     * 访问咨询id
     */
    @TableField(value = "info_id")
    private Long infoId;

    /**
     * 访问咨询标题
     */
    @TableField(value = "info_title")
    private String infoTitle;


    public  DDCRecord(Long no){this.id = no;}

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    public DDCRecord(int userId, String ip, int isMember, Long infoId, String infoTitle) {
        this.userId = userId;
        this.ip = ip;
        this.visitTime = System.currentTimeMillis();
        this.isMember = isMember;
        this.infoId = infoId;
        this.infoTitle = infoTitle;
    }
}
