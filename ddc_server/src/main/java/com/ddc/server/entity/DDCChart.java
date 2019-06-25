package com.ddc.server.entity;

import lombok.*;




@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class DDCChart {

    private static final long serialVersionUID = 1L;

    private int value;
    private String name;

}
