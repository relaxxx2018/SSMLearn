<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="/lib/layui/css/layui.css" media="all">

    <title>图片列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 会员管理 <span
        class="c-gray en">&gt;</span> 游览记录 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>

<div class="page-container">
    <form class="layui-form" action="">
        <div class="text-c"> 日期范围：
            <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'end\')||\'%y-%M-%d\'}' })" id="start"
                   class="input-text Wdate" style="width:120px;" name="start"/>
            -
            <input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'start\')}',maxDate:'%y-%M-%d' })" id="end"
                   class="input-text Wdate" style="width:120px;" name="end"/>
            <input type="text" class="input-text" style="width:250px" placeholder="输入关键词" id="keywords"
                   name="keywords"/>
            <button type="button" class="btn btn-success radius" id="search" name="search" lay-submit
                    lay-filter="select_form_submit">
                <i class="Hui-iconfont">&#xe665;</i> 搜记录
            </button>
        </div>
    </form>
</div>

<div class="page-container">
    <table class="table table-border table-bordered table-hover table-bg table-sort" lay-filter="test"
           style="margin-top: 10px;"></table>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/static/h-ui.admin/js/H-ui.admin.js"></script>

<script type="text/javascript" src="/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/lib/laypage/1.2/laypage.js"></script>
<script src="/lib/layui/layui.all.js"></script>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">批量删除</button>

    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    $(function () {
        layui.use(['table', 'laytpl', 'element', 'form'], function () {
            var table = layui.table;
            var laytpl = layui.laytpl;
            var element = layui.element;
            var form = layui.form;


            //第一个实例
            table.render({
                id: 'table',
                elem: '.table-sort'
                , toolbar: '#toolbarDemo'
                , height: 'full-220'
                , url: '/record/all' //数据接口
                , page: true //开启分页
                , cols: [[ //表头
                    {type: 'checkbox', fixed: 'left'}
                    , {
                        field: 'id', title: 'ID', width: '5%', sort: true, fixed: 'left', templet: function (d) {
                            return d.id;//long 转Stirng
                        }
                    }
                    ,
                    {field: 'id', title: '用户ID', width: '5%'}
                    , {field: 'ip', title: 'IP地址', width: '10%'}
                    , {field: 'visitTime', title: '游览时间', width: '10%'}
                    , {field: 'isMember', title: '是否成员', width: '10%'}
                    , {field: 'infoId', title: '资讯ID', width: '5%'}
                    , {field: 'infoTitle', title: '资讯标题', width: '35%'}
                    , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: '10%'}


                ]]

            });

            function deleteByIds(ids) {
                layer.confirm('真的删除这些数据么', function (index) {
                    $.ajax({
                        "url": "/record/delete",
                        "data": {
                            ids: ids
                        },
                        type: "get",
                        dataType: "json",
                        success: function (data) {
                            if (data.code === 200) {
                                layer.msg("删除成功");
                                reload();

                                layer.close(index);
                            } else {
                                layer.msg(data.msg);
                            }
                        }
                    })

                });
            }


            table.on('toolbar(test)', function (obj) {
                var checkStatus = table.checkStatus(obj.config.id);
                switch (obj.event) {
                    case 'add':
                        addOrUpdate({});
                        break;
                    case 'getCheckData':
                        var data = checkStatus.data;
                        if (data == null || data.length === 0) {
                            layer.msg("请先选择需要删除的数据");
                        } else {
                            var arr = [];
                            for (var i = 0; i < data.length; i++) {
                                arr.push(data[i].id);
                            }
                            deleteByIds(arr.join(','));
                        }

                        break;

                }
                ;
            });

            table.on('tool(test)', function (obj) {
                var data = obj.data;
                if (obj.event === 'del') {
                    deleteByIds(data.id);
                } else if (obj.event === 'edit') {
                    addOrUpdate(data);
                }
            });


            function addOrUpdate(data) {
                var getTpl = document.getElementById("demo").innerHTML;
                laytpl(getTpl).render(data, function (html) {
                    var index = layer.open({
                        type: 1,
                        content: html,
                        area: ['500px', '600px']
                    });
                    form.render();
                    form.on('submit(update_form_submit)', function (data) {
                        layer.msg(JSON.stringify(data.field));
                        $.ajax({
                            "url": "/suggestings/updateOrAdd",
                            "data": JSON.stringify(data.field),
                            type: "post",
                            contentType: 'application/json',
                            dataType: "json",
                            success: function (res) {
                                if (res.code === 200) {
                                    layer.msg("操作成功");
                                    reload();
                                    layer.close(index);
                                } else {
                                    layer.msg(res.msg);
                                }
                            }
                        })
                        return false;
                    });
                });
            }
        });

    });


</script>



</body>
</html>