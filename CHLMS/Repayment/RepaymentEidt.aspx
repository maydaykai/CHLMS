<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepaymentEidt.aspx.cs" Inherits="WebUI.Repayment.RepaymentEidt" %>

<%@ Register Src="~/UserControl/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/UserControl/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
<%@ Register Src="~/UserControl/Menu.ascx" TagPrefix="uc" TagName="Menu" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>还款</title>
    <!-- Bootstrap -->

    <link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/bootstrap-theme.min.css" rel="stylesheet" media="screen">

    <!-- Bootstrap Admin Theme -->
    <link href="../css/bootstrap-admin-theme.css" rel="stylesheet" media="screen">

    <!-- Vendors -->
    <link href="../vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
    <link href="../vendors/easypiechart/jquery.easy-pie-chart_custom.css" rel="stylesheet" media="screen">
</head>
<body>
    <form id="form1" runat="server">
        <fieldset>
            <legend>当前还款信息</legend>

            <div class="form-group">
                <label class="col-lg-2 control-label" for="txt_loanTime">名称：<span id="LoanNumber"></span></label>
                <label class="col-lg-2 control-label" for="txt_loanTime">还款开始时间：<span id="loanTim"></span></label>
                <label class="col-lg-2 control-label" for="txt_loanTime">还款结束时间：<span id="endtime"></span></label>
                <label class="col-lg-2 control-label" for="txt_loanTime">还款本金：<span id="LoanAmount"></span></label>
                <label class="col-lg-2 control-label" for="txt_loanTime">还款方式：<span id="RepaymentMethod"></span></label>
            </div>

        </fieldset>

        <fieldset>
            <legend>添加还款信息</legend>

            <div class="form-group">
                <%--                <label class="col-lg-2 control-label" for="txt_loanTime">
                    方式：<select id=""><option value="1">按天计算</option>
                        <option value="1">按月计算</option>
                    </select>
                </label>--%>

                <label class="col-lg-2 control-label" for="txt_loanTime">本金：<input id="Principal" type="text" placeholder="请输入本金" /></label>
                <label class="col-lg-2 control-label" for="txt_loanTime">利息：<input id="Interest" type="text" placeholder="请输入利息" /></label>

                <label class="col-lg-2 control-label" for="txt_loanTime">指定还款日期：</label>
                <div class="col-lg-3">
                    <input class="form-control" id="txt_loanTime" type="text" placeholder="请选择" />
                </div>
                <input type="button" id="btn_save" value="保存信息" />
            </div>
        </fieldset>



        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="text-muted bootstrap-admin-box-title">还款信息</div>
                </div>
                <div class="bootstrap-admin-panel-content">
                    <table class="table" id="newtable">
                        <thead>
                            <tr>

                                <th>本金</th>
                                <th>利息</th>
                                <th>创建时间</th>
                                <th>指定还款日期</th>
                                <th>计息方式</th>
                                <th>还款方式</th>
                                <th>创建人</th>
                            </tr>
                        </thead>
                        <tbody id="tb_repayListHtml">
                        </tbody>
                    </table>
                </div>
                <script type="text/html" id="tb_repayList">
                    {{each list as $value i}}                       
                                <tr class="gradeX">
                                    <td>{{$value.Principal.toFixed(2) | currencyFormat:'￥'}}</td>
                                    <td>{{$value.Interest.toFixed(2) | currencyFormat:'￥'}}</td>
                                    <td>{{$value.CreateTime | dateFormat:'yyyy-MM-dd'}}</td>
                                    <td>{{$value.RepayDate | dateFormat:'yyyy-MM-dd'}}</td>
                                    <td>{{$value.BorrowMode==1?'按天':'按月'}}</td>

                                    <td>{{$value.RepaymentMethod==1?'先息后本':$value.RepaymentMethod==2?'等额本息':'等本本息'}}</td>
                                    <td>{{$value.CreateUserID}}</td>
                                    <td>
                                        <a class="btn btn-xs btn-default" onclick="delInfo('{{$value.ID}}');">删除</a>

                                    </td>
                                </tr>
                    {{/each}}
                </script>

            </div>
        </div>
        <input type="button" id="btn_saveList" value="确认还款" />

        <!--查询还款信息列表-->
    </form>
</body>
</html>


<script src="../vendors/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/twitter-bootstrap-hover-dropdown.min.js"></script>
<script type="text/javascript" src="../vendors/datatables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../js/DT_bootstrap.js"></script>
<script type="text/javascript" src="../js/template.js"></script>
<script type="text/javascript" src="../js/template-helper.js"></script>
<script src="../vendors/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="../js/common.js"></script>
<script type="text/javascript">
    $(function () {
        var array = [{ "agent": "sel_agent" }];
        //获取url Id
        $("#Principal").val("0.00");
        $("#Interest").val("0.00");
        var id = 1;
        getLoanInfo(id);
        getRepayData();
        $.initAgent(array);
        $('#txt_loanTime').datepicker({ format: 'yyyy-mm-dd' });
        // if (type == 2)
        // getUpdateInfo(id);
        $('#btn_save').click(function () {
            alert("保存信息");
            //
            saveRepayment();

        });

        $('#btn_saveList').click(function () {
            //循环表格信息
            var parmstr = "";
            $("#newtable tr:gt(0)").each(function (i) {
                //组装数据
                var arrtd = $(this).children();
                //获取当前的值
                parmstr = parmstr + arrtd.eq(0).text() + "_" + arrtd.eq(1).text() + "_" + arrtd.eq(2).text() + "_" + arrtd.eq(3).text() + "_" + arrtd.eq(4).text() + "|";
            });

            //调用方法


        });



    });

    function getRepayData() {
        // (int currentPage, int pageSize, string orderBy, string where)


        var obj = new Object();
        obj.currentPage = 1;
        obj.pageSize = 1000;
        obj.filter = "";
        obj.orderBy = "a.ID";
        var jsonobj = JSON.stringify(obj);

        $.ajax({
            type: "POST",
            url: "../WebService/RepaymentServer.svc/GetRepaymentList",
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

    function getLoanInfo(id) {

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
                $('#loanTim').text(jsondatas.critemToString);
                $('#RepaymentMethod').text(jsondatas.RepaymentMethodStr);
                $('#LoanAmount').text(jsondatas.LoanAmount);
                $('#LoanNumber').text(jsondatas.LoanNumber);
                $('#endtime').text(jsondatas.EndTime);
            }
        });
    }


    //保存信息
    function saveRepayment() {
        //$.jsDate2WcfDate(new Date($('#txt_loanTime').val()))
        
        var obj = new Object();
        obj.model = new Object({
            ID: 0,
            RepayDate: $.jsDate2WcfDate(new Date($('#txt_loanTime').val())),
            Principal: $("#Principal").val(),
            Interest: $("#Interest").val(),
            CreateUserID: 1,
            LoanID: "1"
            //  LoanTime: $.jsDate2WcfDate(new Date($('#txt_loanTime').val()))
        });
        //obj.type = type;


        var jsonobj = JSON.stringify(obj);
        //alert();
        $.ajax({
            type: "POST",
            url: "../WebService/RepaymentServer.svc/Add",
            contentType: "application/json; charset=utf-8",
            data: jsonobj,
            dataType: 'json',
            success: function (result) {
                var jsondatas = JSON.parse(result.d);
                if (jsondatas.result == "success") {
                    $.alertWarningHtml('alert-success', jsondatas.message);
                    //$('#loanForm')[0].reset();
                } else {
                    $.alertWarningHtml('alert-' + jsondatas.result, jsondatas.message);
                }
            }
        });
    }

    function delInfo(id) {
        var obj = new Object();
        obj.Id = id;
        var jsonobj = JSON.stringify(obj);

        $.ajax({
            type: "POST",
            url: "../WebService/RepaymentServer.svc/Delete",
            contentType: "application/json; charset=utf-8",
            data: jsonobj,
            dataType: 'json',
            success: function (result) {
                getRepayData();
            }
        });

    }

    function gettype(type) {
        var p_type = "-1";
        switch (type) {
            case "先利后本": p_type = "1";

        }
        return p_type;
    }

</script>
