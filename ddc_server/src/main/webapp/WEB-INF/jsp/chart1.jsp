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
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="stylesheet" type="text/css" href="/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="/lib/Hui-iconfont/1.0.8/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/style.css"/>

    <title>折线图</title>
    <script type="text/javascript" src="/lib/Vue/vue.js"></script>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 统计管理 <span class="c-gray en">&gt;</span> 折线图 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div id="container" style="min-width:700px;height:800px"></div>
</div>
<%--<div id="app-4">--%>
<%--    <ol>--%>
<%--        <li v-for="todo in todos">--%>
<%--            {{ todo.name }}--%>
<%--        </li>--%>
<%--    </ol>--%>
<%--</div>--%>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/static/h-ui.admin/js/H-ui.admin.js"></script>


<script type="text/javascript" src="/lib/echarts/echarts.js"></script>




<script type="text/javascript">
    var userCityUrl = "/chart/record";


    option = {
        title: {
            text: '资讯游览统计',
            subtext: '数据来自网络'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            data: ['2019-6年']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'value',
            boundaryGap: [0, 0.01]
        },
        yAxis: {
            type: 'category',
            data: []
        },
        series: [
            {
                name: '2011年',
                type: 'bar',
                data: []
            }
        ]
    };


    drewUserCityEcharts("container",userCityUrl,option);
    function drewUserCityEcharts(id, url, option) {
        var myChart = echarts.init(document.getElementById(id));
        myChart.showLoading();

        var flag = loadUserCityData(url, option);
        console.log(flag);
        if (flag) {
            setTimeout(function () {
                myChart.hideLoading();
            }, 1000);
            myChart.setOption(option);
        }
    }

    function loadUserCityData(url, option) {
        var flag = false;
        $.ajax({
            type: "post",
            async: false,
            url: url,
            dataType: "json",
            success: function success(result) {
                flag = true;
                for (var i = result.data.length - 1; i >= 0; i--) {
                    option.series[0].data.push(result.data[i].value);
                }
                for (var i = result.data.length - 1; i >= 0; i--) {
                    option.yAxis.data.push(result.data[i].name);
                }

            }
        });
        return flag;
    }
</script>

<script>

</script>
</body>
</html>