<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="WebUI.UserList" %>

<%@ Register Src="~/UserControl/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/UserControl/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
<%@ Register Src="~/UserControl/Menu.ascx" TagPrefix="uc" TagName="Menu" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" media="screen">
    <!-- Bootstrap Admin Theme -->
    <link href="css/bootstrap-admin-theme.css" rel="stylesheet" media="screen">
    <!-- Datatables -->
    <link href="css/DT_bootstrap.css" rel="stylesheet" media="screen">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
           <script type="text/javascript" src="js/html5shiv.js"></script>
           <script type="text/javascript" src="js/respond.min.js"></script>
        <![endif]-->
</head>
<body class="bootstrap-admin-with-small-navbar">
    <uc:Header runat="server" ID="Header" />
    <div class="container">
        <!-- left, vertical navbar & content -->
        <div class="row">
            <!-- left, vertical navbar -->
            <uc:Menu runat="server" ID="Menu" />
            <!-- content -->
            <div class="col-md-10">
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">用户列表</div>
                            <button class="btn btn-xs btn-primary pull-right" onclick="getAddModal();">添加</button>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <table class="table table-striped table-bordered" id="userList">
                                <thead>
                                    <tr>
                                        <th>用户名</th>
                                        <th>用户类型</th>
                                        <th>真实姓名</th>
                                        <th>手机号码</th>
                                        <th>是否允许登录</th>
                                        <th>创建时间</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody id="tb_userListHtml"></tbody>
                            </table>
                            <script type="text/html" id="tb_userList">
                                {{each list as $value i}}                       
                                        <tr class="gradeX">
                                            <td>{{$value.LoginName}}</td>
                                            <td>{{$value.TypeStr}}</td>
                                            <td>{{$value.RealName}}</td>
                                            <td>{{$value.Mobile}}</td>
                                            <td>{{$value.IsActive ? '是' : '否'}}</td>
                                            <td>{{$value.CreateTime | dateFormat:'yyyy-MM-dd'}}</td>
                                            <td><button class="btn btn-xs btn-default" onclick="getUpdateInfo('{{$value.ID}}');">修改</button></td>
                                        </tr>
                                {{/each}}
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <uc:Footer runat="server" ID="Footer" />
    </div>
    <!-- Modal -->
    <div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form id="userForm" class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加用户</h4>
                </div>
                <div class="modal-body">
                    <div id="first" class="form-group">
                        <label for="txt_userName" class="control-label">用户名:</label>
                        <input type="text" class="form-control" id="txt_userName" placeholder="请输入用户名" />
                    </div>
                    <div class="form-group">
                        <label for="txt_password" class="control-label">密码:</label>
                        <input type="password" class="form-control" id="txt_password" placeholder="请输入密码" />
                    </div>
                    <div class="form-group">
                        <label for="txt_realName" class="control-label">真实姓名:</label>
                        <input type="text" class="form-control" id="txt_realName" placeholder="请输入真实姓名" />
                    </div>
                    <div class="form-group">
                        <label for="txt_mobile" class="control-label">手机号码:</label>
                        <input type="text" class="form-control" id="txt_mobile" placeholder="请输入手机号码" />
                    </div>
                    <div class="form-group">
                        <label for="txt_email" class="control-label">邮箱:</label>
                        <input type="text" class="form-control" id="txt_email" placeholder="请输入邮箱" />
                    </div>
                    <div class="btn-group">
                        <label for="sel_type" class="control-label">用户类型:</label>
                        <select id="sel_type" class="form-control">
                            <option value="1">系统用户</option>
                            <option value="2">营销人员</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
                            <div class="checkbox">
                                <label>
                                    是否允许登录<input id="chk_isActive" type="checkbox" checked="checked" />
                                </label>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" value="0" id="hid_id" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btn_save">保存</button>
                    <button type="button" class="btn btn-primary hidden" id="btn_update">保存</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="vendors/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/twitter-bootstrap-hover-dropdown.min.js"></script>
    <script type="text/javascript" src="vendors/datatables/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/DT_bootstrap.js"></script>
    <script src="js/dataTables.tableTools.js"></script>
    <script type="text/javascript" src="js/template.js"></script>
    <script type="text/javascript" src="js/template-helper.js"></script>
    <script src="js/common.js"></script>
    <script src="js/validatorRegex.js"></script>
    <script type="text/javascript">
        $(function () {
            loadInfo();
            $('#btn_save').click(function () {
                if (!validate()) return false;
                saveUser(1);
            });
            $('#btn_update').click(function () {
                if (!validate()) return false;
                saveUser(2);
            });
            $('#addUser').on('hidden.bs.modal', function () {
                loadInfo();
                $('.alert').hide();
            });
            $("a:contains('用户列表')").parent().addClass("active").siblings().removeClass("active");
            //    $('#userList').dataTable({
            //        serverSide: true,//分页，取数据等等的都放到服务端去
            //        processing: true,//载入数据的时候是否显示“载入中”
            //        pageLength: 10,//首次加载的数据条数
            //        ordering: false,//排序操作在服务端进行，所以可以关了。
            //        ajax: {//类似jquery的ajax参数，基本都可以用。
            //            type: "post",//后台指定了方式，默认get，外加datatable默认构造的参数很长，有可能超过get的最大长度。
            //            url: "WebService/User.svc/GetUserList",
            //            dataSrc: "data",//默认data，也可以写其他的，格式化table的时候取里面的数据
            //            data: function (d) {//d 是原始的发送给服务器的数据，默认很长。
            //                var param = {};//因为服务端排序，可以新建一个参数对象
            //                param.start = d.start;//开始的序号
            //                param.length = d.length;//要取的数据的
            //                var formData = $("#filter_form").serializeArray();//把form里面的数据序列化成数组
            //                formData.forEach(function (e) {
            //                    param[e.name] = e.value;
            //                });
            //                return param;//自定义需要传递的参数。
            //            },
            //        },
            //        columns: [//对应上面thead里面的序列
            //            { data: "id", },//字段名字和返回的json序列的key对应
            //            { data: "name", },
            //            {
            //                //Student 没有hireDate
            //                data: function (e) {
            //                    if (e.hireDate) {//默认是/Date(794851200000)/格式，需要显示成年月日方式
            //                        return new Date(Number(e.hireDate.replace(/\D/g, ''))).toLocaleDateString();
            //                    }
            //                    return "空";
            //                }
            //            },
            //            { data: "discriminator", },
            //            {
            //                data: function (e) {//这里给最后一列返回一个操作列表
            //                    //e是得到的json数组中的一个item ，可以用于控制标签的属性。
            //                    return '<a class="btn btn-default btn-xs show-detail-json"><i class="icon-edit"></i>显示详细</a>';
            //                }
            //            }
            //        ],
            //        initComplete: function (setting, json) {
            //            //初始化完成之后替换原先的搜索框。
            //            //本来想把form标签放到hidden_filter 里面，因为事件绑定的缘故，还是拿出来。
            //            $(tablePrefix + "filter").html("<form id='filter_form'>" + $("#hidden_filter").html() + "</form>");
            //        },
            //        language: {
            //            lengthMenu: '<select class="form-control input-xsmall">' + '<option value="5">5</option>' + '<option value="10">10</option>' + '<option value="20">20</option>' + '<option value="30">30</option>' + '<option value="40">40</option>' + '<option value="50">50</option>' + '</select>条记录',//左上角的分页大小显示。
            //            processing: "载入中",//处理页面数据的时候的显示
            //            paginate: {//分页的样式文本内容。
            //                previous: "上一页",
            //                next: "下一页",
            //                first: "第一页",
            //                last: "最后一页"
            //            },

            //            zeroRecords: "没有内容",//table tbody内容为空时，tbody的内容。
            //            //下面三者构成了总体的左下角的内容。
            //            info: "总共_PAGES_ 页，显示第_START_ 到第 _END_ ，筛选之后得到 _TOTAL_ 条，初始_MAX_ 条 ",//左下角的信息显示，大写的词为关键字。
            //            infoEmpty: "0条记录",//筛选为空时左下角的显示。
            //            infoFiltered: ""//筛选之后的左下角筛选提示(另一个是分页信息显示，在上面的info中已经设置，所以可以不显示)，
            //        }
            //    });
            //    //$("#table_server_filter input[type=search]").css({ width: "auto" });//右上角的默认搜索文本框，不写这个就超出去了。
        });
        function validate() {
            var userName = $('#txt_userName').val();
            var pwd = $('#txt_password').val();
            var realName = $('#txt_realName').val();
            var mobile = $('#txt_mobile').val();
            if ($.trim(userName) == "") {
                $.alertWarningHtml('alert-warning', '请输入用户名');
                return false;
            }
            if ($.trim(userName).length < 5 || $.trim(userName).length > 12) {
                $.alertWarningHtml('alert-warning', '您输入的用户名长度错误,应在5~12个字符之间,请确认');
                return false;
            }
            if (!new RegExp(regexEnum.username).test($.trim(userName))) {
                $.alertWarningHtml('alert-warning', '用户名不包含除26个英文字母或数字以外的字符');
                return false;
            }
            if ($.trim(pwd) == "") {
                $.alertWarningHtml('alert-warning', '请输入密码');
                return false;
            }
            if ($.trim(realName) == "") {
                $.alertWarningHtml('alert-warning', '请输入真实姓名');
                return false;
            }
            if ($.trim(realName).length < 2 || $.trim(realName).length > 12) {
                $.alertWarningHtml('alert-warning', '您输入的真实姓名长度错误,应在2~12个字符之间,请确认');
                return false;
            }
            if ($.trim(mobile) == "") {
                $.alertWarningHtml('alert-warning', '请输入手机号码');
                return false;
            }
            if (!new RegExp(regexEnum.mobile).test($.trim(mobile))) {
                $.alertWarningHtml('alert-warning', '手机号码格式错误');
                return false;
            }
            return true;
        }
        function saveUser(type){
            var obj = new Object();
            obj.model = new Object({
                ID: $('#hid_id').val(),
                LoginName: $.trim($('#txt_userName').val()),
                Password: $.trim($('#txt_password').val()),
                RealName: $.trim($('#txt_realName').val()),
                Mobile: $.trim($('#txt_mobile').val()),
                Email: $.trim($('#txt_email').val()),
                Type: $('#sel_type').val(),
                IsActive: $('#chk_isActive').is(':checked'),
                LoanTypePermission : ""
            });
            obj.type = type;
            var jsonobj = JSON.stringify(obj);
            $.ajax({
                type: "POST",
                url: "../WebService/User.svc/AddUser",
                contentType: "application/json; charset=utf-8",
                data: jsonobj,
                dataType: 'json',
                success: function (result) {
                    var jsondatas = JSON.parse(result.d);
                    if (jsondatas.result == "success") {
                        $.alertWarningHtml('alert-success', jsondatas.message);
                        loadInfo();
                    } else {
                        $.alertWarningHtml('alert-' + jsondatas.result, jsondatas.message);
                    }
                }
            });
        }
        function getAddModal() {
            $("#userForm")[0].reset();
            $('#btn_save').removeClass('hidden');
            $('#btn_update').addClass('hidden');
            $('#addUser').modal('show');
        }
        function getUpdateInfo(id) {
            $('#hid_id').val(id);
            var obj = new Object();
            obj.id = id;
            var jsonobj = JSON.stringify(obj);
            $.ajax({
                type: "POST",
                url: "../WebService/User.svc/GetUserModel",
                contentType: "application/json; charset=utf-8",
                data: jsonobj,
                dataType: 'json',
                success: function (result) {
                    var jsondatas = JSON.parse(result.d);
                    if (jsondatas != null) {
                        $('#txt_userName').val(jsondatas.LoginName);
                        $('#txt_password').val(jsondatas.Password);
                        $('#txt_realName').val(jsondatas.RealName);
                        $('#txt_mobile').val(jsondatas.Mobile);
                        $('#txt_email').val(jsondatas.Email);
                        $('#sel_type').val(jsondatas.Type);
                        $('#chk_isActive').attr("checked",jsondatas.IsActive);
                    } else {
                        $.alertWarningHtml('alert-danger', '获取数据失败');
                    }
                    $('#btn_save').addClass('hidden');
                    $('#btn_update').removeClass('hidden');
                    $('#addUser').modal('show');
                }
            });
        }
        function loadInfo() {
            var obj = new Object();
            obj.currentPage = 1;
            obj.pageSize = 1000;
            obj.filter = "";
            obj.orderBy = "ID";
            var jsonobj = JSON.stringify(obj);
            $.ajax({
                type: "POST",
                url: "../WebService/User.svc/GetUserList",
                contentType: "application/json; charset=utf-8",
                data: jsonobj,
                dataType: 'json',
                success: function (result) {
                    var jsondatas = JSON.parse(result.d);
                    var html = template('tb_userList', { list: jsondatas });
                    $("#tb_userListHtml").html(html);
                    var table = $('#userList').dataTable({
                        sDom: "<'row'<'col-md-6'l><'col-md-6'f>r>t<'row'<'col-md-6'i><'col-md-6'p>>",
                        sPaginationType: "bootstrap",
                        oLanguage: {
                            sLengthMenu: "显示 _MENU_ 条记录",
                            sInfoEmpty: "0条记录",
                            oPaginate: {//分页的样式文本内容。
                                sPrevious: "上一页",
                                sNext: "下一页",
                                sFirst: "第一页",
                                sLast: "最后一页"
                            }
                        },
                        bRetrieve: true,
                        bProcessing: true
                    });
                    //                        var tt = new $.fn.dataTable.TableTools(table);
                    //
                    //                        $(tt.fnContainer()).insertBefore('div.bootstrap-admin-panel-content');
                }
            });
        }
    </script>
</body>
</html>
