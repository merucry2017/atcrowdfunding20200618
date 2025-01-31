<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/main.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
        table tbody tr:nth-child(odd){background:#F4F4F4;}
        table tbody td:nth-child(even){color:#C00;}
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 用户维护</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li style="padding-top:8px;">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i> ${sessionScope.user.username} <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><i class="glyphicon glyphicon-cog"></i> 个人设置</a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-comment"></i> 消息</a></li>
                            <li class="divider"></li>
                            <li><a href="${APP_PATH}/logout.htm"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                        </ul>
                    </div>
                </li>
                <li style="margin-left:10px;padding-top:8px;">
                    <button type="button" class="btn btn-default btn-danger">
                        <span class="glyphicon glyphicon-question-sign"></span> 帮助
                    </button>
                </li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <ul style="padding-left:0px;" class="list-group">
                    <li class="list-group-item tree-closed" >
                        <a href="${APP_PATH}/main.htm"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a>
                    </li>
                    <li class="list-group-item">
                        <span><i class="glyphicon glyphicon glyphicon-tasks"></i> 权限管理 <span class="badge" style="float:right">3</span></span>
                        <ul style="margin-top:10px;">
                            <li style="height:30px;">
                                <a href="${APP_PATH}/user/toIndex.htm" style="color:red;"><i class="glyphicon glyphicon-user"></i> 用户维护</a>
                            </li>
                            <li style="height:30px;">
                                <a href="role.html"><i class="glyphicon glyphicon-king"></i> 角色维护</a>
                            </li>
                            <li style="height:30px;">
                                <a href="permission.html"><i class="glyphicon glyphicon-lock"></i> 许可维护</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed">
                        <span><i class="glyphicon glyphicon-ok"></i> 业务审核 <span class="badge" style="float:right">3</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="auth_cert.html"><i class="glyphicon glyphicon-check"></i> 实名认证审核</a>
                            </li>
                            <li style="height:30px;">
                                <a href="auth_adv.html"><i class="glyphicon glyphicon-check"></i> 广告审核</a>
                            </li>
                            <li style="height:30px;">
                                <a href="auth_project.html"><i class="glyphicon glyphicon-check"></i> 项目审核</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed">
                        <span><i class="glyphicon glyphicon-th-large"></i> 业务管理 <span class="badge" style="float:right">7</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="cert.html"><i class="glyphicon glyphicon-picture"></i> 资质维护</a>
                            </li>
                            <li style="height:30px;">
                                <a href="type.html"><i class="glyphicon glyphicon-equalizer"></i> 分类管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="process.html"><i class="glyphicon glyphicon-random"></i> 流程管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="advertisement.html"><i class="glyphicon glyphicon-hdd"></i> 广告管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="message.html"><i class="glyphicon glyphicon-comment"></i> 消息模板</a>
                            </li>
                            <li style="height:30px;">
                                <a href="project_type.html"><i class="glyphicon glyphicon-list"></i> 项目分类</a>
                            </li>
                            <li style="height:30px;">
                                <a href="tag.html"><i class="glyphicon glyphicon-tags"></i> 项目标签</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed" >
                        <a href="param.html"><i class="glyphicon glyphicon-list-alt"></i> 参数管理</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="form" style="float:left;">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">查询条件</div>
                                <input id="queryText" class="form-control has-success" type="text" placeholder="请输入查询条件">
                            </div>
                        </div>
                        <button id="queryBtn" type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
                    </form>
                    <button type="button" class="btn btn-danger" style="float:right;margin-left:10px;" id="deleteBatchBtn"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
                    <button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='${APP_PATH}/user/toAdd.htm'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <table class="table  table-bordered">
                            <thead>
                            <tr >
                                <th width="30">#</th>
                                <th width="30"><input id="allCheckbox" type="checkbox"></th>
                                <th>账号</th>
                                <th>名称</th>
                                <th>邮箱地址</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%--<c:forEach items="${page.datas}" var="user" varStatus="status">--%>
                                <%--<tr>--%>
                                    <%--<td>${status.count}</td>--%>
                                    <%--<td><input type="checkbox"></td>--%>
                                    <%--<td>${user.loginacct}</td>--%>
                                    <%--<td>${user.username}</td>--%>
                                    <%--<td>${user.email}</td>--%>
                                <%--<td>--%>
                                    <%--<button type="button" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>--%>
                                    <%--<button type="button" onclick="window.location.href='${APP_PATH}/user/toUpdate.htm?id='+n.id" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>--%>
                                    <%--<button type="button" onclick="deleteUser(n.id, n.loginacct)" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>--%>
                                <%--</td>--%>
                                <%--</tr>--%>
                            <%--</c:forEach>--%>
                            <%--<tr>--%>
                                <%--<td>16</td>--%>
                                <%--<td><input type="checkbox"></td>--%>
                                <%--<td>sodales</td>--%>
                                <%--<td>ligula</td>--%>
                                <%--<td>in</td>--%>
                                <%--<td>--%>
                                    <%--<button type="button" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>--%>
                                    <%--<button type="button" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>--%>
                                    <%--<button type="button" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="6" align="center">
                                        <ul class="pagination">
                                            <%--&lt;%&ndash;区分第一页与非第一页的区别&ndash;%&gt;--%>
                                            <%--<c:if test="${page.pageno==1}">--%>
                                                <%--<li class="disabled"><a href="#">上一页</a></li>--%>
                                            <%--</c:if>--%>

                                            <%--<c:if test="${page.pageno!=1}">--%>
                                                <%--<li ><a href="#" onclick="pageChange(${page.pageno-1})">上一页</a></li>--%>
                                            <%--</c:if>--%>

                                            <%--<c:forEach begin="1" end="${page.totalno}" var="num">--%>
                                                <%--<li--%>
                                                    <%--<c:if test="${page.pageno==num}">--%>
                                                        <%--class="active"--%>
                                                    <%--</c:if>--%>
                                                <%--><a href="#" onclick="pageChange(${num})">${num}</a></li>--%>
                                            <%--</c:forEach>--%>

                                                <%--&lt;%&ndash;区分最后一页与非最后一页的区别&ndash;%&gt;--%>
                                                <%--<c:if test="${page.pageno==page.totalno}">--%>
                                                    <%--<li class="disabled"><a href="#">下一页</a></li>--%>
                                                <%--</c:if>--%>

                                                <%--<c:if test="${page.pageno!=page.totalno}">--%>
                                                    <%--<li ><a href="#" onclick="pageChange(${page.pageno+1})">下一页</a></li>--%>
                                                <%--</c:if>--%>
                                        </ul>
                                    </td>
                                </tr>
                            <%--<tr >--%>
                                <%--<td colspan="6" align="center">--%>
                                    <%--<ul class="pagination">--%>
                                        <%--<li class="disabled"><a href="#">上一页</a></li>--%>
                                        <%--<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>--%>
                                        <%--<li><a href="#">2</a></li>--%>
                                        <%--<li><a href="#">3</a></li>--%>
                                        <%--<li><a href="#">4</a></li>--%>
                                        <%--<li><a href="#">5</a></li>--%>
                                        <%--<li><a href="#">下一页</a></li>--%>
                                    <%--</ul>--%>
                                <%--</td>--%>
                            <%--</tr>--%>

                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/script/docs.min.js"></script>
<script src="${APP_PATH}/jquery/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        $(".list-group-item").click(function(){
            if ( $(this).find("ul") ) {
                $(this).toggleClass("tree-closed");
                if ( $(this).hasClass("tree-closed") ) {
                    $("ul", this).hide("fast");
                } else {
                    $("ul", this).show("fast");
                }
            }
        });
        queryPageUser(1);
    });
    $("tbody .btn-success").click(function(){
        window.location.href = "assignRole.html";
    });
    $("tbody .btn-primary").click(function(){
        window.location.href = "edit.html";
    });

    function pageChange(pageno) {
        //window.location.href="${APP_PATH}/user/index.do?pageno=" + pageno;
        queryPageUser(pageno);
    }

    var jsonObj = {
        "pageno" : 1,
        "pagesize" : 10
    };
    var loadingIndex = -1;
    function queryPageUser(pageIndex) {
        jsonObj.pageno = pageIndex;
        $.ajax({
            type : "POST",
            data : jsonObj,
            url : "${APP_PATH}/user/doIndex.do",
            beforeSend : function(){
                loadingIndex = layer.load(2, {time: 10*1000});
                return true;
            },
            success : function (result) {
                layer.close(loadingIndex);
                if (result.success){
                    var page = result.page;
                    var data = page.datas;

                    var content = '';

                    $.each(data, function (i, n) {
                        content += '<tr>';
                        content += '    <td>'+(i + 1)+'</td>';
                        content += '    <td><input type="checkbox" id="' + n.id + '"></td>';
                        content += '    <td>'+ n.loginacct + '</td>';
                        content += '    <td>'+ n.username + '</td>';
                        content += '    <td>'+ n.email + '</td>';
                        content += '    <td>';
                        content += '        <button type="button" onclick="window.location.href=\'${APP_PATH}/user/assignRole.htm?id=' + n.id + '\'" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>';
                        content += '        <button type="button" onclick="window.location.href=\'${APP_PATH}/user/toUpdate.htm?id=' + n.id + '\'" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
                        content += '        <button type="button" onclick="deleteUser(' + n.id + ',\'' + n.loginacct + '\')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
                        content += '    </td>';
                        content += '</tr>';
                    })


                    $("tbody").html(content);

                    var contentBar = "";

                    if(page.pageno==1){
                        contentBar+='<li class="disabled"><a href="#">上一页</a></li>';
                    }else{
                        contentBar+='<li><a href="#" onclick="pageChange('+(page.pageno-1)+')">上一页</a></li>';
                    }

                    for(var i=1;i<=page.totalno;i++){
                        if(page.pageno==i){
                            contentBar+='<li class="active"><a href="#" onclick="pageChange('+i+')">'+i+'</a></li>';
                        }else{
                            contentBar+='<li><a href="#" onclick="pageChange('+i+')">'+i+'</a></li>';
                        }
                    }

                    if(page.pageno==page.totalno){
                        contentBar+='<li class="disabled"><a href="#">下一页</a></li>';
                    }else{
                        contentBar+='<li><a href="#" onclick="pageChange('+(page.pageno+1)+')">下一页</a></li>';
                    }

                    $(".pagination").html(contentBar);

                    // // 创建分页
                    // $("#Pagination").pagination(page.totalsize, {
                    //     num_edge_entries: 1, //边缘页数
                    //     num_display_entries: 2, //主体页数
                    //     callback: queryPageUser,
                    //     items_per_page:10, //每页显示1项
                    //     prev_text : "上一页",
                    //     next_text : "下一页",
                    //     current_page : (page.pageno - 1)
                    // });

                }else {
                    layer.msg(result.message, {time: 1000, icon: 5, shift: 6});
                }
            },
            error : function () {
                layer.msg("加载数据失败！", {time: 1000, icon: 5, shift: 6});
            }
        });
    }

    $("#queryBtn").click(function () {
        var queryText = $("#queryText").val();
        jsonObj.queryText = queryText;
        queryPageUser(1);
    })

    function deleteUser(id, loginacct) {

        layer.confirm('确认要删除[' + loginacct + ']用户吗?', {icon: 3, title:'提示'}, function(cihdex){
            layer.close(cihdex);
            $.ajax({
                type : "POST",
                data : {
                    "id" : id
                },
                url : "${APP_PATH}/user/doDelete.do",
                beforeSend : function() {
                    return true;
                },
                success : function (result) {
                    if (result.success){
                        window.location.href="${APP_PATH}/user/toIndex.htm";
                    }else {
                        layer.msg(result.message, {time: 1000, icon: 5, shift: 6});
                    }
                },
                error : function () {
                    layer.msg("删除用户失败！", {time: 1000, icon: 5, shift: 6});
                }
            });
        }, function (cihdex) {
            layer.close(cihdex);
        });
    }

    $("#allCheckbox").click(function () {
        var checkedStatus = this.checked;
        $("tbody tr td input[type='checkbox']").attr("checked",checkedStatus);
    });

    $("#deleteBatchBtn").click(function () {
        var selectCheckbox = $("tbody tr td input:checked");

        if (selectCheckbox.length == 0){
            layer.msg("至少选择一个用户进行删除！请选择用户！", {time: 1000, icon: 5, shift: 6});
            return false;
        }
        var idStr = "";
        $.each(selectCheckbox, function (i, n) {
            if (i != 0){
                idStr += "&";
            }
            idStr += "id=" + n.id;
        });

       /* var jsonObj = {};

        $.each(selectCheckbox, function (i, n) {
            jsonObj["datas[" + i + "].id"] = n.id;
            jsonObj["datas[" + i + "].loginacct"] = n.name;
        });*/

        layer.confirm('确认要删除这些用户吗?', {icon: 3, title:'提示'}, function(cihdex){
            layer.close(cihdex);
            $.ajax({
                type : "POST",
                data : idStr,
                // data : jsonObj,
                url : "${APP_PATH}/user/doDeleteBatch.do",
                beforeSend : function() {
                    return true;
                },
                success : function (result) {
                    if (result.success){
                        layer.msg("批量删除成功", {time: 1000, icon: 6, shift: 6});
                        window.location.href="${APP_PATH}/user/toIndex.htm";
                    }else {
                        layer.msg(result.message, {time: 1000, icon: 5, shift: 6});
                    }
                },
                error : function () {
                    layer.msg("删除用户失败！", {time: 1000, icon: 5, shift: 6});
                }
            });
        }, function (cihdex) {
            layer.close(cihdex);
        });
    });

</script>
<%--<script type="text/javascript" src="${APP_PATH}/script/menu.js"></script>--%>
</body>
</html>
