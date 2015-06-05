<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanEdit.aspx.cs" Inherits="WebUI.LoanEdit" %>

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
                    <div class="navbar navbar-default bootstrap-admin-navbar-thin">
                        <ol class="breadcrumb bootstrap-admin-breadcrumb">
                            <li>
                                <a href="LoanList.aspx">借款列表</a>
                            </li>
                            <li class="active">添加/查看借款</li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <div class="panel panel-default bootstrap-admin-no-table-panel">
                        <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                            <form id="loanForm" runat="server" class="form-horizontal">
                                <fieldset>
                                    <legend id="title">添加借款</legend>
                                    <div id="first" class="form-group hidden">
                                        <label class="col-lg-2 control-label" for="sp_loanNumber">借款编号：</label>
                                        <div class="col-lg-3">
                                            <span class="form-control" id="sp_loanNumber"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label" for="sel_customerID">借款人：</label>
                                        <div class="col-lg-3">
                                            <asp:ListBox runat="server" ID="sel_customerID" CssClass="form-control"></asp:ListBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label" for="txt_loanAmount">借款金额(元)：</label>
                                        <div class="col-lg-3">
                                            <input class="form-control" id="txt_loanAmount" type="number" placeholder="请输入借款金额" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label" for="sel_loanTypeID">标种类型：</label>
                                        <div class="col-lg-3">
                                            <asp:ListBox runat="server" ID="sel_loanTypeID" CssClass="form-control"></asp:ListBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label" for="sel_repaymentmethod">还款方式：</label>
                                        <div class="col-lg-3">
                                            <select id="sel_repaymentmethod" class="form-control">
                                                <option value="0">--请选择--</option>
                                                <option value="1">按月付息到期还本</option>
                                                <option value="2">按月平息</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label" for="sel_repaymentmethod">计息模式：</label>
                                        <div class="col-lg-3">
                                            <select id="sel_calculateHead" class="form-control disabled" disabled="disabled">
                                                <option value="-1">--请选择--</option>
                                                <option value="0" selected="selected">算头不算尾</option>
                                                <option value="1">算头算尾</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label" for="txt_loanTerm">借款期限(月)：</label>
                                        <div class="col-lg-3">
                                            <input class="form-control" id="txt_loanTerm" type="number" placeholder="请输入借款期限" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label" for="txt_loanRate">年利率(%)：</label>
                                        <div class="col-lg-3">
                                            <input class="form-control" id="txt_loanRate" type="number" placeholder="请输入年利率" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label" for="txt_loanDate">借款日期：</label>
                                        <div class="col-lg-3">
                                            <input class="form-control" id="txt_loanDate" type="text" placeholder="请选择" onclick="WdatePicker()" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label" for="sel_agent">经办人：</label>
                                        <div class="col-lg-3">
                                            <select id="sel_agent" class="form-control">
                                            </select>
                                        </div>
                                    </div>
                                    <input type="hidden" value="0" id="hid_id" />
                                    <button type="button" id="btn_save" class="btn btn-primary">保存</button>
                                    <button type="button" class="btn btn-primary hidden" id="btn_update">确认</button>
                                    <button type="button" class="btn btn-primary hidden" id="btn_repay">还款</button>
                                    <button type="reset" class="btn btn-default">重置</button>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <uc:Footer runat="server" ID="Footer" />
    </div>
    <script src="vendors/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/twitter-bootstrap-hover-dropdown.min.js"></script>
    <script type="text/javascript" src="vendors/datatables/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/DT_bootstrap.js"></script>
    <script type="text/javascript" src="js/template.js"></script>
    <script type="text/javascript" src="js/template-helper.js"></script>
    <script src="js/My97DatePicker/WdatePicker.js"></script>
    <script src="js/common.js"></script>

    <script type="text/javascript">
        var id = getPValueByName("id");
        var type = getPValueByName("type");
        $(function () {
            var array = [{ "agent": "sel_agent" }];
            $.initAgent(array);
            if (type == 2)
                getUpdateInfo(id);
            $('#btn_save').click(function () {
                if (validate()) {
                    saveLoan(1);
                }
            });
            $('#btn_update').click(function () {
                if (validate()) {
                    saveLoan(2);
                }
            });
            $('#btn_repay').click(function () {
                //跳转到还款页面
                window.location.href = "RepaymentEidt.aspx?id=" + id;
            });
        });
        function saveLoan(type) {
            var obj = new Object();
            obj.model = new Object({
                ID: $('#hid_id').val(),
                LoanCustomerID: $.trim($('#sel_customerID').val()),
                LoanAmount: $.trim($('#txt_loanAmount').val()),
                LoanTypeID: $.trim($('#sel_loanTypeID').val()),
                RepaymentMethod: $.trim($('#sel_repaymentmethod').val()),
                CalculateHead: $.trim($('#sel_calculateHead').val()),
                BorrowMode: 1,
                LoanTerm: $.trim($('#txt_loanTerm').val()),
                LoanRate: $('#txt_loanRate').val(),
                UserID: $('#sel_agent').val(),
                LoanDate: $.jsDate2WcfDate(new Date($('#txt_loanDate').val()))
            });
            obj.type = type;
            var jsonobj = JSON.stringify(obj);
            $.ajax({
                type: "POST",
                url: "../WebService/Loan.svc/AddLoan",
                contentType: "application/json; charset=utf-8",
                data: jsonobj,
                dataType: 'json',
                success: function (result) {
                    var jsondatas = JSON.parse(result.d);
                    if (jsondatas.result == "success") {
                        $.alertWarningHtml('alert-success', jsondatas.message);
                        $('#loanForm')[0].reset();
                        window.parent.loadInfo();
                    } else {
                        $.alertWarningHtml('alert-' + jsondatas.result, jsondatas.message);
                    }
                }
            });
        }
        function validate() {
            var customerID = $('#sel_customerID').val();
            var loanAmount = $("#txt_loanAmount").val();
            var loanTypeID = $("#sel_loanTypeID").val();
            var repaymentmethod = $("#sel_repaymentmethod").val();
            var loanTerm = $("#txt_loanTerm").val();
            var loanRate = $("#txt_loanRate").val();
            var agent = $("#sel_agent").val();
            var loanDate = $("#txt_loanDate").val();
            if (customerID == 0) {
                $.alertWarningHtml('alert-warning', '请选择借款人');
                return false;
            }
            if ($.trim(loanAmount) == "") {
                $.alertWarningHtml('alert-warning', '请输入借款金额');
                return false;
            }
            if (isNaN($.trim(loanAmount))) {
                $.alertWarningHtml('alert-warning', '请输入正确的金额');
                return false;
            }
            if (loanTypeID == 0) {
                $.alertWarningHtml('alert-warning', '请选择标种类型');
                return false;
            }
            if (repaymentmethod == 0) {
                $.alertWarningHtml('alert-warning', '请选择还款方式');
                return false;
            }
            if ($.trim(loanTerm) == "") {
                $.alertWarningHtml('alert-warning', '请输入借款期限');
                return false;
            }
            if (isNaN($.trim(loanTerm)) || $.trim(loanTerm) < 1 || $.trim(loanTerm) > 36) {
                $.alertWarningHtml('alert-warning', '请输入正确的期限');
                return false;
            }
            if ($.trim(loanRate) == "") {
                $.alertWarningHtml('alert-warning', '请输入借款年利率');
                return false;
            }
            if (isNaN($.trim(loanRate)) || $.trim(loanRate) < 0 || $.trim(loanRate) > 120) {
                $.alertWarningHtml('alert-warning', '请输入正确的年利率');
                return false;
            }
            if (loanDate == "") {
                $.alertWarningHtml('alert-warning', '请选择借款时间');
                return false;
            }
            if (agent == 0) {
                $.alertWarningHtml('alert-warning', '请选择经办人');
                return false;
            }
            return true;
        }
        function getUpdateInfo(id) {
            $('#hid_id').val(id);
            var obj = new Object();
            obj.id = id;
            var jsonobj = JSON.stringify(obj);
            $.ajax({
                type: "POST",
                url: "../WebService/Loan.svc/GetLoanModel",
                contentType: "application/json; charset=utf-8",
                data: jsonobj,
                dataType: 'json',
                success: function (result) {
                    var jsondatas = JSON.parse(result.d);
                    if (jsondatas != null) {
                        var ifAuditPermission = "<%=IfAuditPermission %>" === "True";
                        if (!ifAuditPermission || jsondatas.Status !=1) {
                            $('#sp_loanNumber').text(jsondatas.LoanNumber);
                            $('#sel_customerID').val(jsondatas.LoanCustomerID).attr("disabled", "disabled");
                            $('#txt_loanAmount').val(jsondatas.LoanAmount).attr("disabled", "disabled");
                            $('#sel_loanTypeID').val(jsondatas.LoanTypeID).attr("disabled", "disabled");
                            $('#sel_repaymentmethod').val(jsondatas.RepaymentMethod).attr("disabled", "disabled");
                            $('#txt_loanTerm').val(jsondatas.LoanTerm).attr("disabled", "disabled");
                            $('#txt_loanRate').val(jsondatas.LoanRate).attr("disabled", "disabled");
                            $('#sel_agent').val(jsondatas.UserID).attr("disabled", "disabled");
                            $('#txt_loanDate').val(jsondatas.LoanDate.substr(0, 10)).attr("disabled", "disabled");
                            $(':reset').attr("disabled", "disabled");
                            if (jsondatas.Status != 1)
                                $('#btn_repay').removeClass('hidden');
                            $('#first').removeClass('hidden');
                            $('#title').text("查看借款");
                            
                        }else{
                            $('#sp_loanNumber').text(jsondatas.LoanNumber);
                            $('#sel_customerID').val(jsondatas.LoanCustomerID);
                            $('#txt_loanAmount').val(jsondatas.LoanAmount);
                            $('#sel_loanTypeID').val(jsondatas.LoanTypeID);
                            $('#sel_repaymentmethod').val(jsondatas.RepaymentMethod);
                            $('#txt_loanTerm').val(jsondatas.LoanTerm);
                            $('#txt_loanRate').val(jsondatas.LoanRate);
                            $('#sel_agent').val(jsondatas.UserID);
                            $('#txt_loanDate').val(jsondatas.LoanDate.substr(0, 10));
                            $('#btn_update,#first').removeClass('hidden');
                            $('#title').text("确认借款");
                        }
                    } else {
                        $.alertWarningHtml('alert-danger', '获取数据失败');
                    }
                    $('#btn_save').addClass('hidden');
                }
            });
        }
        function getRepayData() {
            var id = $('#hid_id').val();
            var obj = new Object();
            obj.loanID = id;
            var jsonobj = JSON.stringify(obj);
            $.ajax({
                type: "POST",
                url: "../WebService/Loan.svc/GetRepayListByID",
                contentType: "application/json; charset=utf-8",
                data: jsonobj,
                dataType: 'json',
                success: function (result) {
                    var jsondatas = JSON.parse(result.d);
                    var html = template('tb_repayList', { list: jsondatas });
                    $("#tb_repayListHtml").html(html);
                }
            });
        }
        function repayLoan(id) {
            var obj = new Object();
            obj.repayID = id;
            var jsonobj = JSON.stringify(obj);
            $.ajax({
                type: "POST",
                url: "../WebService/Loan.svc/RepayLoanByID",
                contentType: "application/json; charset=utf-8",
                data: jsonobj,
                dataType: 'json',
                success: function (result) {
                    var jsondatas = JSON.parse(result.d);
                    if (jsondatas.result == "success") {
                        $.alertWarningHtml('alert-success', jsondatas.message, "modalFirst");
                        getRepayData();
                    } else {
                        $.alertWarningHtml('alert-' + jsondatas.result, jsondatas.message, "modalFirst");
                    }
                }
            });
        }
    </script>
</body>
</html>
