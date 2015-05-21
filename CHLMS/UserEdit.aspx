<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="WebUI.UserEdit" %>
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
                        <div id="first" class="form-group">
                            <label for="txt_userName" class="control-label">用户名:</label>
                            <input type="text" class="form-control" id="txt_userName" placeholder="请输入用户名" />
                        </div>
                        <div class="form-group">
                            <label for="txt_password" class="control-label">密码:</label>
                            <input type="password" class="form-control" id="txt_password" placeholder="请输入密码" />
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
                    </div>
                </div>
            </div>
            <uc:Footer runat="server" ID="Footer" />
        </div>
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/twitter-bootstrap-hover-dropdown.min.js"></script>
        <script type="text/javascript" src="vendors/datatables/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/DT_bootstrap.js"></script>
        <script type="text/javascript" src="js/template.js"></script>
        <script type="text/javascript" src="js/template-helper.js"></script>
        <script type="text/javascript">
            $(function () {
                loadInfo();
            });
            function loadInfo() {
                var obj = new Object();
                obj.currentPage = 1;
                obj.pageSize = 10;
                obj.filter = "";
                obj.orderBy = "ID";
                var jsonobj = JSON.stringify(obj);
                $.ajax({
                    type: "POST",
                    url: "../WebService/Loan.svc/GetLoanList",
                    contentType: "application/json; charset=utf-8",
                    data: jsonobj,
                    dataType: 'json',
                    success: function (result) {
                        var jsondatas = JSON.parse(result.d);
                        var html = template('tb_loanList', { list: jsondatas });
                        $("#tb_loanListHtml").html(html);
                        $('#loanList').dataTable({
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
                            }
                        });
                    }
                });
            }
        </script>
    </body>
</html>
