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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 资讯管理 <span
        class="c-gray en">&gt;</span> 图片管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>

<div class="page-container">
    <div class="text-c"> 日期范围：
        <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'end\')||\'%y-%M-%d\'}' })" id="start"
               class="input-text Wdate" style="width:120px;" name="start"/>
        -
        <input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'start\')}',maxDate:'%y-%M-%d' })" id="end"
               class="input-text Wdate" style="width:120px;" name="end"/>
        <input type="text" class="input-text" style="width:250px" placeholder="输入关键词" id="keywords" name="keywords"/>
        <button type="button" class="btn btn-success radius" id="search" name="search"><i
                class="Hui-iconfont">&#xe665;</i> 搜图片
        </button>
    </div>
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
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    $(function () {
        layui.use(['table', 'laytpl', 'element'], function () {
            var table = layui.table;
            var laytpl = layui.laytpl;
            var element = layui.element;

            $("#search").click(function () {
                reload();
            });

            function reload() {
                table.reload('table', {
                    where: { //请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
                        start: $("#start").val(),
                        end: $("#end").val(),
                        keywords: $("#keywords").val()
                    }
                });
            }


            //第一个实例
            table.render({
                id: 'table'
                , elem: '.table-sort'
                , toolbar: '#toolbarDemo'
                , height: 'full-220'
                , url: '/picture/all' //数据接口
                , page: true //开启分页
                , cols: [[ //表头
                    {type: 'checkbox', fixed: 'left'}
                    , {field: 'id', title: 'ID', width: 180, sort: true, fixed: 'left',}
                    , {field: 'pictureName', title: '图片名', width: 180}
                    , {field: 'picture', title: '图片', width: 160, sort: true}
                    , {field: 'classify', title: '分类', width: 160}
                    , {field: 'author', title: '作者', width: 177}
                    , {field: 'updateTime', title: '更新时间', width: 180, sort: true, templet: function (d) {return d.updateTime;}}
                    , {field: 'tag', title: '标签', width: 180, sort: true}
                    , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: '10%'}
                ]]
            });

            //头工具栏事件
            table.on('toolbar(test)', function (obj) {
                var checkStatus = table.checkStatus(obj.config.id);
                switch (obj.event) {
                    case 'getCheckData':
                        var data = checkStatus.data;
                        if (data == null || data.length === 0) {
                            layer.msg("请先选择需要删除的数据");
                        } else {
                            var arr = [];
                            for (var i = 0; i < data.length; i++) {
                                arr.push(data[i].id);
                            }
                            layer.alert(arr.join(','));
                            layer.confirm('真的删除这些数据么', function (index) {
                                $.ajax({
                                    "url": "/picture/delete",
                                    "data": {
                                        ids: arr.join(',')
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

                        break;

                }
                ;
            });

            //监听行工具事件
            table.on('tool(test)', function (obj) {
                var data = obj.data;

                console.log(data);
                if (obj.event === 'del') {
                    layer.confirm('真的删除行么', function (index) {
                        $.ajax({
                            "url": "/picture/delete",
                            "data": {
                                ids: data.id
                            },
                            type: "get",
                            dataType: "json",
                            success: function (res) {
                                if (res.code === 200) {
                                    layer.msg("删除成功");
                                    obj.del();
                                    layer.close(index);
                                } else {
                                    layer.msg(res.msg);
                                }
                            }
                        })
                    });
                } else if (obj.event === 'edit') {
                    var getTpl = $("#demo")[0].innerHTML;
                    laytpl(getTpl).render(data, function (html) {
                        var index = layer.open({
                            type: 1,
                            content: html,
                            area: ['500px', '600px']
                        });
                        element.render();
                    });
                }
            });

        });

    });


</script>



<script type="text/javascript">

    /*图片-添加*/
    function picture_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-查看*/
    function picture_show(title, url, id) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-审核*/
    function picture_shenhe(obj, id) {
        layer.confirm('审核文章？', {
                btn: ['通过', '不通过'],
                shade: false
            },
            function () {
                $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
                $(obj).remove();
                layer.msg('已发布', {icon: 6, time: 1000});
            },
            function () {
                $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
                $(obj).remove();
                layer.msg('未通过', {icon: 5, time: 1000});
            });
    }

    /*图片-下架*/
    function picture_stop(obj, id) {
        layer.confirm('确认要下架吗？', function (index) {
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
            $(obj).remove();
            layer.msg('已下架!', {icon: 5, time: 1000});
        });
    }

    /*图片-发布*/
    function picture_start(obj, id) {
        layer.confirm('确认要发布吗？', function (index) {
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
            $(obj).remove();
            layer.msg('已发布!', {icon: 6, time: 1000});
        });
    }

    /*图片-申请上线*/
    function picture_shenqing(obj, id) {
        $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
        $(obj).parents("tr").find(".td-manage").html("");
        layer.msg('已提交申请，耐心等待审核!', {icon: 1, time: 2000});
    }

    /*图片-编辑*/
    function picture_edit(title, url, id) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-删除*/
    function picture_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function (data) {
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', {icon: 1, time: 1000});
                },
                error: function (data) {
                    console.log(data.msg);
                },
            });
        });
    }
</script>
</body>
</html>