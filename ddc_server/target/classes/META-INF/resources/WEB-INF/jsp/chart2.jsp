<%--
  Created by IntelliJ IDEA.
  User: Saint
  Date: 2019/6/17
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="stylesheet" type="text/css" href="/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="/lib/Hui-iconfont/1.0.8/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/style.css"/>

    <title>折线图</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 资讯管理 <span
        class="c-gray en">&gt;</span>分类管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                             href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>

<div class="page-container" style="padding: 10px;">
    <a class="btn btn-primary radius" href="javascript:;"
       onclick="admin_role_add('添加角色',addOrUpdate(),'800')"><i class="Hui-iconfont">&#xe600;</i> 添加分类</a>
</div>
<div class="page-container" style="padding: 0px;">
    <div id="container" style="min-width:700px;height:600px"></div>
</div>


<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/static/h-ui.admin/js/H-ui.admin.js"></script>


<script type="text/javascript" src="/lib/echarts/echarts.js"></script>


<script type="text/javascript">



</script>


<script type="text/javascript">

    // var chartdata = {};

    $.get('/chart/sort', function (data) {

        var option = {
            series: [{
                type: 'treemap',
                data: []
            }]
        };

        $.get('/chart/sort1', function (data1) {
            option.series[0].data.push({name: "图片", children: data1.data});
            option.series[0].data.push({name: "资讯", children: data.data});
            var myChart = echarts.init(document.getElementById("container"));
            myChart.hideLoading();
            myChart.setOption(option);
        });


    });


</script>

<script>

</script>
</body>
</html>