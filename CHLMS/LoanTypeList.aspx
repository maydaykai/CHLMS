<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanTypeList.aspx.cs" Inherits="WebUI.LoanTypeList" %>
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
                                        <th>类型名称</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody id="tb_loanTypeListHtml"></tbody>
                            </table>
                            <script type="text/html" id="tb_loanTypeList">
                                {{each list as $value i}}                       
                                        <tr class="gradeX">
                                            <td>{{$value.Name}}</td>
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
    <div class="modal fade" id="addLoanType" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form id="userForm" class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加/修改标种类型</h4>
                </div>
                <div class="modal-body">
                    <div id="first" class="form-group">
                        <label for="txt_name" class="control-label">类型名称:</label>
                        <input type="text" class="form-control" id="txt_name" placeholder="请输入类型名称" />
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
    <script type="text/javascript">
        $(function () {
            loadInfo();
            $('#btn_save').click(function () {
                if (!validate()) return false;
                saveLoanType(1);
            });
            $('#btn_update').click(function () {
                if (!validate()) return false;
                saveLoanType(2);
            });
            $('#addLoanType').on('hidden.bs.modal', function () {
                loadInfo();
                $('.alert').hide();
            });
            $("a:contains('标种列表')").parent().addClass("active").siblings().removeClass("active");
        });
        function validate() {
            var name = $('#txt_name').val();
            if ($.trim(name) == "") {
                $.alertWarningHtml('alert-warning', '请输入名称');
                return false;
            }
            return true;
        }
        function saveLoanType(type) {
            var obj = new Object();
            obj.model = new Object({
                ID: $('#hid_id').val(),
                Name: $.trim($('#txt_name').val())
            });
            obj.type = type;
            var jsonobj = JSON.stringify(obj);
            $.ajax({
                type: "POST",
                url: "../WebService/Loan.svc/AddLoanType",
                contentType: "application/json; charset=utf-8",
                data: jsonobj,
                dataType: 'json',
                success: function (result) {
                    var jsondatas = JSON.parse(result.d);
                    if (jsondatas.result == "success") {
                        $.alertWarningHtml('alert-success', jsondatas.message);
                        $("#userForm")[0].reset();
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
            $('#addLoanType').modal('show');
        }
        function getUpdateInfo(id) {
            $('#hid_id').val(id);
            var obj = new Object();
            obj.id = id;
            var jsonobj = JSON.stringify(obj);
            $.ajax({
                type: "POST",
                url: "../WebService/Loan.svc/GetLoanTypeModel",
                contentType: "application/json; charset=utf-8",
                data: jsonobj,
                dataType: 'json',
                success: function (result) {
                    var jsondatas = JSON.parse(result.d);
                    if (jsondatas != null) {
                        $('#txt_name').val(jsondatas.Name);
                    } else {
                        $.alertWarningHtml('alert-danger', '获取数据失败');
                    }
                    $('#btn_save').addClass('hidden');
                    $('#btn_update').removeClass('hidden');
                    $('#addLoanType').modal('show');
                }
            });
        }
        function loadInfo() {
            $.ajax({
                type: "POST",
                url: "../WebService/Loan.svc/GetLoanTypeList",
                contentType: "application/json; charset=utf-8",
                data: null,
                dataType: 'json',
                success: function (result) {
                    var jsondatas = JSON.parse(result.d);
                    var html = template('tb_loanTypeList', { list: jsondatas });
                    $("#tb_loanTypeListHtml").html(html);
                }
            });
        }
    </script>
</body>
</html>
