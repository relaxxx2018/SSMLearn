package com.ddc.server.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.*;

import java.io.Serializable;
import java.util.Date;
import java.util.Random;

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
@TableName("ddc_user")
public class DDCUser extends Model<DDCUser> {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId("id")
    private int id;

    /**
     * username
     */
    private String username;

    /**
     * password
     */
    private String password;

    /**
     * reg_time
     */
    @TableField(value = "reg_time")
    private long regTime;

    /**
     * is_member
     */
    @TableField(value = "is_member")
    private String isMember;

    /**
     * 状态
     */
    private String statu;

    /**
     * integral
     */
    private Integer integral;

    /**
     * name
     */
    private String name;

    /**
     * gender
     */
    private Integer gender;

    /**
     * city
     */
    private String city;

    /**
     * identity_card
     */
    @TableField(value = "identity_card")
    private String identityCard;

    /**
     * telephone
     */
    private String telephone;

    /**
     * address
     */
    private String address;

    /**
     * post_address
     */
    @TableField(value = "post_address")
    private String postAddress;

    /**
     * resume
     */
    private String resume;

    /**
     * icon
     */
    private String icon;

    /**
     * is_delete
     */
    @TableField(value = "is_delete")
    private Integer isDelete;

    /**
     * update_time
     */
    @TableField(value = "update_time")
    private long updateTime;

    /**
     * update_person
     */
    @TableField(value = "update_person")
    private String updatePerson;

    /**
     * create_person
     */
    @TableField(value = "create_person")
    private String createPerson;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    public DDCUser(String username, String password, String city) {
        this.username = username;
        this.password = password;
        this.city = city;

    }
}
