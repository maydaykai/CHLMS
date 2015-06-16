<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepaymentEidt.aspx.cs" Inherits="WebUI.Repayment.RepaymentEidt" %>

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
                            <div class="text-muted bootstrap-admin-box-title">当前还款信息</div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>借款编号:</th>
                                        <th>还款开始时间:</th>
                                        <th>还款结束时间：</th>
                                        <th>还款本金：</th>
                                        <th>还款方式：</th>
                                        <th>是否按照还款计划还款：</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><span id="LoanNumber"></span></td>
                                        <td><span id="loanTim"></span></td>
                                        <td><span id="endtime"></span></td>
                                        <td><span id="LoanAmount"></span></td>
                                        <td><span id="RepaymentMethod"></span></td>
                                        <td><span id="IfOnPlan"></span></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">还款计划</div>
                            <i class="glyphicon glyphicon-chevron-up pull-right btn-link" id="tableStretch" title="隐藏"></i>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <table class="table table-striped table-bordered table-hover" id="repaymentPlan">
                                <thead>
                                    <tr>
                                        <th>期号</th>
                                        <th>应还本金</th>
                                        <th>应还利息</th>
                                        <th>应还日期</th>
                                        <th>状态</th>
                                    </tr>
                                </thead>
                                <tbody id="tb_repaymentPlanHtml">
                                </tbody>
                            </table>
                            <script type="text/html" id="tb_repaymentPlan">
                                {{each list as $value i}}                       
                                    <tr class="gradeX">
                                        <td>{{$value.PeNumber}}</td>
                                        <td>{{$value.RePrincipal.toFixed(2) | currencyFormat:'¥'}}</td>
                                        <td>{{$value.ReInterest.toFixed(2) | currencyFormat:'¥'}}</td>
                                        <td>{{$value.RePayDate | dateFormat:'yyyy-MM-dd'}}</td>
                                        <td>{{$value.Status==0?'未还':($value.Status==1?'已还':'作废')}}</td>
                                    </tr>
                                {{/each}}
                            </script>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">每天还款计划</div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <table class="table table-striped table-bordered" id="loanList">
                                <thead>
                                    <tr>
                                        <th>开始时间~结束时间</th>
                                        <th>利息</th>
                                        <th>总计</th>
                                    </tr>
                                </thead>
                                <tbody id="tb_loanListHtml"></tbody>
                            </table>
                            <script type="text/html" id="tb_loanList">
                                {{each list as $value i}}                       
                                        <tr class="gradeX">
                                            <td>{{$value.BeginDate | dateFormat:'yyyy-MM-dd'}}~{{$value.EndDate | dateFormat:'yyyy-MM-dd'}}</td>
                                            <td>{{$value.Interest.toFixed(2) | currencyFormat:'¥'}}</td>
                                            <td>{{($value.Days*$value.Interest).toFixed(2) | currencyFormat:'¥'}}</td>
                                        </tr>
                                {{/each}}
                            </script>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">添加还款信息</div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>已还本金:</th>
                                        <th>剩余本金:</th>
                                        <th>已还利息:</th>
                                        <th>剩余利息：</th>
                                    </tr>
                                </thead>
                                <tbody id="completeInfoHtml">
                                </tbody>
                                <script type="text/html" id="completeInfo">
                                    <tr class="success">
                                        <td class="col-lg-2">{{CompletePrincipal.toFixed(2) | currencyFormat:'￥'}}</td>
                                        <td class="col-lg-2">{{$helpers. currencyFormat((LoanAmount - CompletePrincipal).toFixed(2), '￥')}}</td>
                                        <td class="col-lg-2">{{CompleteInterest.toFixed(2) | currencyFormat:'￥'}}</td>
                                        <td class="col-lg-2">{{$helpers. currencyFormat((ReInterest - CompleteInterest).toFixed(2), '￥')}}</td>
                                    </tr>
                            </script>
                            </table>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>本金:</th>
                                        <th>利息:</th>
                                        <th>指定还款日期：</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="col-lg-2">
                                            <input id="Principal" type="number" min="0" max="100000" value="0.00" class="form-control" placeholder="请输入本金" /></td>
                                        <td class="col-lg-2">
                                            <input id="Interest" type="number" min="0" max="100000" value="0.00" class="form-control" placeholder="请输入利息" /></td>
                                        <td class="col-lg-3">
                                            <input class="form-control" id="txt_loanTime1" onclick="WdatePicker()" type="text" placeholder="请选择" /></td>
                                        <td>
                                            <input type="button" id="btn_save" class="btn btn-sm btn-default" value="保存信息" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">还款信息</div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <table class="table" id="newtable">
                                <thead>
                                    <tr>
                                        <th>还款日期</th>
                                        <th>还款本金</th>
                                        <th>还款利息</th>
                                        <th>创建时间</th>
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
                                    <td>{{$value.RepayDate | dateFormat:'yyyy-MM-dd'}}</td>
                                    <td>{{$value.Principal.toFixed(2) | currencyFormat:'¥'}}</td>
                                    <td>{{$value.Interest.toFixed(2) | currencyFormat:'¥'}}</td>
                                    <td>{{$value.CreateTime | dateFormat:'yyyy-MM-dd'}}</td>
                                    <td>{{$value.RealName}}</td>
                                </tr>
                            {{/each}}
                        </script>
                    </div>
                </div>
            </div>
        </div>
        <uc:Footer runat="server" ID="Footer" />
    </div>
</body>
</html>


<script src="vendors/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/twitter-bootstrap-hover-dropdown.min.js"></script>
<script type="text/javascript" src="vendors/datatables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/DT_bootstrap.js"></script>
<script type="text/javascript" src="js/template.js"></script>
<script type="text/javascript" src="js/template-helper.js"></script>
<script src="js/jquery.formatCurrency-1.4.0.js"></script>
<script src="js/My97DatePicker/WdatePicker.js"></script>
<script src="js/common.js"></script>
<script type="text/javascript">
    var configStr = "";
    $(function () {

        var array = [{ "agent": "sel_agent" }];
        //获取url Id
        var id = getPValueByName("id");
        getLoanInfo(id);
        showRepaymentComplete();
        getRepayData();
        $.initAgent(array);

        getRepayData_one();
        getCompleteRepaymentInfo(id);
        $('#btn_save').click(function () {
            //输入的利息和金额必须一个大于0
            if (validate()) {
                if (configStr.length > 1) {
                    if (confirm(configStr + "?是否确认")) {
                        saveRepayment();
                    }
                }
                else {
                    if (confirm("是否确认保存当前数据？")) {
                        saveRepayment();
                    }
                }
            }
        });
        $('#tableStretch').click(function () {
            $('#repaymentPlan').slideToggle('slow');
            if ($(this).hasClass("glyphicon-chevron-down"))
                $(this).removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up").attr("title", "隐藏");
            else
                $(this).removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down").attr("title", "显示");
        });
    });


    //还款验证
    function validate() {

        var loanTime = $("#txt_loanTime1").val();
        var Principal = $("#Principal").val();
        var Interest = $("#Interest").val();

        if (parseFloat(Principal) <= 0 && parseFloat(Interest) <= 0) {
            alert("利息和本金不能同时为0");
            return false;
        }

        if (loanTime == "") {
            alert("请选择指定还款时间");
            // $.alertWarningHtml('alert-warning', '请选择指定还款时间');
            return false;
        }
        var arrstr = RepaymentPlanModel().split('_');
        if (parseInt(arrstr[0]) != 1 && parseInt(arrstr[0]) != 2) {
            alert(arrstr[1]);
            return false;
        }
        else {
            //configStr
            configStr = arrstr[1];
        }
        return true;

    }

    function getRepayData() {
        var obj = new Object();
        obj.currentPage = 1;
        obj.pageSize = 1000;
        obj.filter = "";
        obj.orderBy = "a.ID";
        obj.where = " a.LoanID=" + getPValueByName("id");
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
    function getCompleteRepaymentInfo(id) {
        var obj = new Object();
        obj.loadId = id;
        var jsonobj = JSON.stringify(obj);

        $.ajax({
            type: "POST",
            url: "../WebService/RepaymentServer.svc/GetCompleteRepaymentInfo",
            contentType: "application/json; charset=utf-8",
            data: jsonobj,
            dataType: 'json',
            success: function (result) {
                var jsondatas = JSON.parse(result.d);
                var html = template("completeInfo", jsondatas[0]);
                $('#completeInfoHtml').html(html);
            }
        });
    }

    function getRepayData_one() {
        // var id = $('#hid_id').val();
        var obj = new Object();
        obj.loanID = getPValueByName("id");
        var jsonobj = JSON.stringify(obj);
        $.ajax({
            type: "POST",
            url: "../WebService/Loan.svc/GetRepayListByID",
            contentType: "application/json; charset=utf-8",
            data: jsonobj,
            dataType: 'json',
            success: function (result) {
                var jsondatas = JSON.parse(result.d);
                var html = template('tb_repaymentPlan', { list: jsondatas });
                $("#tb_repaymentPlanHtml").html(html);
            }
        });
    }
    function getLoanInfo(infoid) {

        var obj = new Object();
        obj.id = infoid;
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
                $('#LoanAmount').text(jsondatas.LoanAmount).formatCurrency();
                $('#LoanNumber').text(jsondatas.LoanNumber);
                $('#endtime').text(jsondatas.EndDate);
                $('#IfOnPlan').text(jsondatas.IfOnPlan == true ? "是" : "否");
            }
        });
    }


    //保存信息
    function saveRepayment() {
        var obj = new Object();
        obj.model = new Object({
            ID: 0,
            RepayDate: $.jsDate2WcfDate(new Date($('#txt_loanTime1').val())),
            Principal: $("#Principal").val(),
            Interest: $("#Interest").val(),
            CreateUserID: 1,
            LoanID: getPValueByName("id")
        });
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
                showRepaymentComplete();
                getRepayData();
                getRepayData_one();
            }
        });
    }

    function delInfo(delid) {
        var obj = new Object();
        obj.Id = delid;
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

    function showRepaymentComplete() {

        var obj = new Object();
        obj.currentPage = 1;
        obj.pageSize = 10000;
        obj.filter = "";
        obj.orderBy = " id DESC ";
        obj.where = "LoanID=" + getPValueByName("id");
        var jsonobj = JSON.stringify(obj);
        $.ajax({
            type: "POST",
            url: "../WebService/RepaymentServer.svc/GetRepaymentCompleteList",
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
                    },
                    bRetrieve: true,
                    bProcessing: true
                });
            }
        });
    }


    function RepaymentPlanModel() {
        //int LoadId, DateTime endTime
        var mesg = "1_已经按照还款计划还款";
        var obj = new Object();
        obj.LoadId = getPValueByName("id");
        obj.endTime = $.jsDate2WcfDate(new Date($('#txt_loanTime1').val()));
        var jsonobj = JSON.stringify(obj);
        $.ajax({
            async: false,
            type: "POST",
            url: "../WebService/RepaymentServer.svc/RepaymentPlanModel",
            contentType: "application/json; charset=utf-8",
            data: jsonobj,
            dataType: 'json',
            success: function (result) {
                // getRepayData();
                var jsondatas = JSON.parse(result.d);
                if (jsondatas.IfOnPlan == true) {
                    //是否按照还款计划还款
                    if (parseInt(jsondatas.TotalPan) <= 0) {
                        mesg = "1_当前没有按照还款计划";
                    }
                    //输入的日期不能小于上一次的还款日期
                    var day1 = new Date(jsondatas.lasttimeToString);
                    var day2 = new Date($('#txt_loanTime1').val());

                    //alert(dateCompare(jsondatas.lasttimeStr, $('#txt_loanTime1').val()));
                    if (dateCompare(jsondatas.lasttimeStr, $('#txt_loanTime1').val()) == true) {

                        mesg = "0_指定时间小于上一次还款的时间";
                    }
                    //当天的还款次数不能大于1

                    if (parseInt(jsondatas.planCount) >= 1) {
                        mesg = "0_当天已经还过款";
                    }


                }
                else {
                    mesg = "2_当前没有按照还款计划还款";
                }

            }
        });

        return mesg;

    }



    function dateDiff(date1, date2) {
        var type1 = typeof date1, type2 = typeof date2;
        if (type1 == 'string')
            date1 = stringToTime(date1);
        else if (date1.getTime)
            date1 = date1.getTime();
        if (type2 == 'string')
            date2 = stringToTime(date2);
        else if (date2.getTime)
            date2 = date2.getTime();
        return (date2 - date1) / 1000 / 60 / 60 / 24;//除1000是毫秒，不加是秒   
    }
    //字符串转成Time(dateDiff)所需方法   
    function stringToTime(string) {
        var f = string.split(' ', 2);
        var d = (f[0] ? f[0] : '').split('-', 3);
        var t = (f[1] ? f[1] : '').split(':', 3);
        return (new Date(
        parseInt(d[0], 10) || null,
        (parseInt(d[1], 10) || 1) - 1,
        parseInt(d[2], 10) || null,
        parseInt(t[0], 10) || null,
        parseInt(t[1], 10) || null,
        parseInt(t[2], 10) || null)).getTime();
    }

    function dateCompare(startDate, endDate) {
        var aStart = startDate.split('-'); //转成成数组，分别为年，月，日，下同  
        var aEnd = endDate.split('-');
        var startDateTemp = aStart[0] + "/" + aStart[1] + "/" + aStart[2];
        var endDateTemp = aEnd[0] + "/" + aEnd[1] + "/" + aEnd[2];
        if (startDateTemp > endDateTemp)
            return true;
        else
            return false;
    }

</script>
