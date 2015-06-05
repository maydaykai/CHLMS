<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerList.aspx.cs" Inherits="WebUI.CustomerList" %>

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
                                <div class="text-muted bootstrap-admin-box-title">客户列表</div>
                                <button class="btn btn-xs btn-primary pull-right" data-toggle="modal" data-target="#addCustomer">添加</button>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                                <table class="table table-striped table-bordered" id="customerList">
                                    <thead>
                                        <tr>
                                            <th>真实姓名</th>
                                            <th>手机号码</th>
                                            <th>身份证号码</th>
                                            <th>创建时间</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tb_customerListHtml"></tbody>
                                </table>
                                <script type="text/html" id="tb_customerList">
                                    {{each list as $value i}}                       
                                        <tr class="gradeX">
                                            <td>{{$value.RealName}}</td>
                                            <td>{{$value.Mobile}}</td>
                                            <td>{{$value.Identity}}</td>
                                            <td>{{$value.CreateTime | dateFormat:'yyyy-MM-dd'}}</td>
                                            <td><button class="btn btn-xs btn-default" onclick="getUpdateInfo('{{$value.ID}}');">修改/查看</button></td>
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
        <div class="modal fade" id="addCustomer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <form id="customerForm" class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加客户</h4>
              </div>
              <div class="modal-body">
                <div id="first" class="form-group">
                    <label for="txt_realName" class="control-label">真实姓名:</label>
                    <input type="text" class="form-control" id="txt_realName" placeholder="请输入真实姓名" />
                </div>
                <div class="form-group">
                    <label for="txt_identity" class="control-label">身份证号码:</label>
                    <input type="text" class="form-control" id="txt_identity" placeholder="请输入身份证号码" />
                </div>
                <div class="form-group">
                    <label for="txt_mobile" class="control-label">手机号码:</label>
                    <input type="text" class="form-control" id="txt_mobile" placeholder="请输入手机号码" />
                </div>
                <div class="form-group">
                    <label for="txt_address" class="control-label">地址:</label>
                    <input type="text" class="form-control" id="txt_address" placeholder="请输入地址" />
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
                    saveCustomer(1);
                });
                $('#btn_update').click(function () {
                    if (!validate()) return false;
                    saveCustomer(2);
                });
                $('#addCustomer').on('hidden.bs.modal', function () {
                    loadInfo();
                    $('.alert').hide();
                });
                $("a:contains('客户列表')").parent().addClass("active").siblings().removeClass("active");
            });
            function saveCustomer(type){
                var obj = new Object();
                obj.model = new Object({
                    ID: $('#hid_id').val(),
                    RealName: $.trim($('#txt_realName').val()),
                    Mobile: $.trim($('#txt_mobile').val()),
                    Identity: $.trim($('#txt_identity').val()),
                    Address: $('#txt_address').val(),
                    CreateUserID: '<%=UserID %>'
                });
                obj.type = type;
                var jsonobj = JSON.stringify(obj);
                $.ajax({
                    type: "POST",
                    url: "../WebService/Customer.svc/AddCustomer",
                    contentType: "application/json; charset=utf-8",
                    data: jsonobj,
                    dataType: 'json',
                    success: function (result) {
                        var jsondatas = JSON.parse(result.d);
                        if (jsondatas.result == "success") {
                            $.alertWarningHtml('alert-success', jsondatas.message);
                            $("#customerForm")[0].reset();
                            loadInfo();
                        } else {
                            $.alertWarningHtml('alert-' + jsondatas.result, jsondatas.message);
                        }
                    }
                });
            }
            function getUpdateInfo(id) {
                $('#hid_id').val(id);
                var obj = new Object();
                obj.id = id;
                var jsonobj = JSON.stringify(obj);
                $.ajax({
                    type: "POST",
                    url: "../WebService/Customer.svc/GetCustomerModel",
                    contentType: "application/json; charset=utf-8",
                    data: jsonobj,
                    dataType: 'json',
                    success: function (result) {
                        var jsondatas = JSON.parse(result.d);
                        if (jsondatas != null) {
                            $('#txt_realName').val(jsondatas.RealName);
                            $('#txt_mobile').val(jsondatas.Mobile);
                            $('#txt_identity').val(jsondatas.Identity);
                            $('#txt_address').val(jsondatas.Address);
                        } else {
                            $.alertWarningHtml('alert-danger', '获取数据失败');
                        }
                        $('#btn_save').addClass('hidden');
                        $('#btn_update').removeClass('hidden');
                        $('#addCustomer').modal('show');
                    }
                });
            }
            function validate() {
                //var userName = $('#txt_userName').val();
                var realName = $('#txt_realName').val();
                var mobile = $('#txt_mobile').val();
                var identity = $('#txt_identity').val();
                //if ($.trim(userName) == "") {
                //    $.alertWarningHtml('alert-warning', '请输入用户名');
                //    return false;
                //}
                //if ($.trim(userName).length < 5 || $.trim(userName).length > 12) {
                //    $.alertWarningHtml('alert-warning', '您输入的用户名长度错误,应在5~12个字符之间,请确认');
                //    return false;
                //}
                //if (!new RegExp(regexEnum.username).test($.trim(userName))) {
                //    $.alertWarningHtml('alert-warning', '用户名不包含除26个英文字母或数字以外的字符');
                //    return false;
                //}
                if ($.trim(realName) == "") {
                    $.alertWarningHtml('alert-warning', '请输入真实姓名');
                    return false;
                }
                if ($.trim(realName).length < 2 || $.trim(realName).length > 12) {
                    $.alertWarningHtml('alert-warning', '您输入的真实姓名长度错误,应在2~12个字符之间,请确认');
                    return false;
                }
                if ($.trim(identity) == "") {
                    $.alertWarningHtml('alert-warning', '请输入身份证号码');
                    return false;
                }
                var msg = isCardID($.trim(identity));
                if (!(msg === true)) {
                    $.alertWarningHtml('alert-warning', msg);
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
            function loadInfo() {
                var obj = new Object();
                obj.currentPage = 1;
                obj.pageSize = 1000;
                obj.filter = "";
                obj.orderBy = "ID";
                var jsonobj = JSON.stringify(obj);
                $.ajax({
                    type: "POST",
                    url: "../WebService/Customer.svc/GetCustomerList",
                    contentType: "application/json; charset=utf-8",
                    data: jsonobj,
                    dataType: 'json',
                    success: function (result) {
                        var jsondatas = JSON.parse(result.d);
                        var html = template('tb_customerList', { list: jsondatas });
                        $("#tb_customerListHtml").html(html);
                        var table = $('#customerList').dataTable({
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
                            //"bServerSide": true,
                            //"sAjaxSource": "../WebService/Customer.svc/GetCustomerListDt",
		                    //"fnServerData": function ( sSource, aoData, fnCallback ) {
		                    //    $.ajax( {
		                    //        "dataType": 'json',
		                    //        "contentType":"application/json" ,
                            //        "type": "POST", 
                            //        "url": sSource,
                            //        "data": JSON.stringify({ jsondatas: JSON.stringify(aoData) }),
                            //        "success": fnCallback
                            //    } );
		                    //},
		                    //"aoColumns": [
                            //    { "sName": "RealName" },
                            //    { "sName": "Mobile" },
                            //    { "sName": "Identity" },
                            //    { "sName": "CreateTime" },
                            //    { "sName": "grade" }
		                    //]//$_GET['sColumns']将接收到aoColumns传递数据
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
