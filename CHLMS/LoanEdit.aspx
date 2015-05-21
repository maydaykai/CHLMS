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
                            <li class="active">添加/修改借款</li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <div class="panel panel-default bootstrap-admin-no-table-panel">
                        <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                            <form id="loanForm" class="form-horizontal">
                                <fieldset>
                                    <legend>添加/修改借款</legend>
                                    <div id="first" class="form-group">
                                        <label class="col-lg-2 control-label" for="sel_customerID">借款人：</label>
                                        <div class="col-lg-3">
                                            <select id="sel_customerID" class="form-control">
                                            </select>
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
                                            <select id="sel_loanTypeID" class="form-control">
                                            </select>
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
                                        <label class="col-lg-2 control-label" for="txt_loanTime">借款时间：</label>
                                        <div class="col-lg-3">
                                            <input class="form-control" id="txt_loanTime" type="text" placeholder="请选择" />
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
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/twitter-bootstrap-hover-dropdown.min.js"></script>
    <script type="text/javascript" src="vendors/datatables/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/DT_bootstrap.js"></script>
    <script type="text/javascript" src="js/template.js"></script>
    <script type="text/javascript" src="js/template-helper.js"></script>
    <script src="vendors/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="js/common.js"></script>
    <script type="text/javascript">
        $(function () {
            var array = [{ "agent": "sel_agent" }];
            var customerArray = [{ "customer": "sel_customerID" }];
            var loanTypeArray = [{ "loanType": "sel_loanTypeID" }];
            $.initCustomer(customerArray);
            $.initLoanType(loanTypeArray);
            $.initAgent(array);
            $('#txt_loanTime').datepicker({ format: 'yyyy-mm-dd' });
            $('#btn_save').click(function () {
                if (validate()) {
                    saveLoan(1);
                }
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
                LoanTerm: $.trim($('#txt_loanTerm').val()),
                LoanRate: $('#txt_loanRate').val(),
                UserID: $('#sel_agent').val(),
                LoanTime: $.jsDate2WcfDate(new Date($('#txt_loanTime').val()))
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
                    } else {
                        $.alertWarningHtml('alert-' + jsondatas.result, jsondatas.message);
                    }
                }
            });
        }
        function validate(){
            var loanAmount = $("#txt_loanAmount").val();
            var loanTypeID = $("#sel_loanTypeID").val();
            var repaymentmethod = $("#sel_repaymentmethod").val();
            var loanTerm = $("#txt_loanTerm").val();
            var loanRate = $("#txt_loanRate").val();
            var agent = $("#sel_agent").val();
            var loanTime = $("#txt_loanTime").val();
            if ($.trim(loanAmount) == "") {
                $.alertWarningHtml('alert-warning', '请输入借款金额');
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
            if ($.trim(loanRate) == "") {
                $.alertWarningHtml('alert-warning', '请输入借款年利率');
                return false;
            }
            if (agent == 0) {
                $.alertWarningHtml('alert-warning', '请选择经办人');
                return false;
            }
            if (loanTime == "") {
                $.alertWarningHtml('alert-warning', '请选择借款时间');
                return false;
            }
            return true;
        }
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
