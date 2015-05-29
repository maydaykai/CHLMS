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
                            <div class="text-muted bootstrap-admin-box-title" style="float: right"><a href="javascript:void(0)" id="btn_repay">查看还款计划</a></div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <table class="table table-striped">
                                <thead>

                                    <tr>
                                        <th>名称:</th>
                                        <th>还款开始时间:</th>
                                        <th>还款结束时间：</th>
                                        <th>还款本金：</th>
                                        <th>还款方式：</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><span id="LoanNumber"></span></td>
                                        <td><span id="loanTim"></span></td>
                                        <td><span id="endtime"></span></td>
                                        <td><span id="LoanAmount"></span></td>
                                        <td><span id="RepaymentMethod"></span></td>
                                    </tr>

                                </tbody>
                            </table>
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
                                        <th>本金:</th>
                                        <th>利息:</th>
                                        <th>指定还款日期：</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <input id="Principal" type="text" placeholder="请输入本金" /></td>
                                        <td>
                                            <input id="Interest" type="text" placeholder="请输入利息" /></td>
                                        <td>
                                            <input class="form-control" id="txt_loanTime1" onclick="WdatePicker()" type="text" placeholder="请选择" /></td>
                                        <td>
                                            <input type="button" id="btn_save" value="保存信息" /></td>
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

                                    <td>{{$value.RepaymentMethod==1?'按月付息到期还本':'按月平息'}}</td>
                                    <td>{{$value.RealName}}</td>
                                    <%-- <td>
                                        <a class="btn btn-xs btn-default" onclick="delInfo('{{$value.ID}}');">删除</a>

                                    </td>--%>
                                </tr>
                            {{/each}}
                        </script>

                    </div>
                    <%--<input type="button" id="btn_saveList" value="确认还款" />--%>
                </div>

                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">已经生成的还款信息</div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <table class="table table-striped table-bordered" id="loanList">

                                <thead>

                                    <tr>
                                        <th>开始时间</th>
                                        <th>结束时间</th>
                                        <th>利息</th>

                                    </tr>
                                </thead>
                                <tbody id="tb_loanListHtml"></tbody>
                            </table>
                            <script type="text/html" id="tb_loanList">
                                {{each list as $value i}}                       
                                        <tr class="gradeX">
                                            <td>{{$value.BeginDate | dateFormat:'yyyy-MM-dd'}}</td>
                                            <td>{{$value.EndDate | dateFormat:'yyyy-MM-dd'}}</td>
                                            <td>{{$value.Interest.toFixed(2) | currencyFormat:'￥'}}</td>



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
    <div class="modal fade" id="repay" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form id="userForm" class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">还款</h4>
                </div>
                <div class="modal-body">
                    <div id="modalFirst" class="bootstrap-admin-panel-content">
                        <table id="repayList" class="table table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th>期号</th>
                                    <th>应还本金</th>
                                    <th>应还利息</th>
                                    <th>应还日期</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody id="Tbody1">
                            </tbody>
                        </table>
                        <script type="text/html" id="Script1">
                            {{each list as $value i}}                       
                                <tr class="gradeX">
                                    <td>{{$value.PeNumber}}</td>


                                    <td>{{$value.RePrincipal.toFixed(2) | currencyFormat:'￥'}}</td>
                                    <td>{{$value.ReInterest.toFixed(2) | currencyFormat:'￥'}}</td>
                                    <td>{{$value.RePayDate | dateFormat:'yyyy-MM-dd'}}</td>
                                    <td>{{$value.Status==0?'未还':($value.Status==1?'已还':'作废')}}</td>
                                    <td>{{if $value.Status==0}}
                                            <a class="btn btn-xs btn-default" onclick="repayLoan('{{$value.ID}}');">还款</a>
                                        {{/if}}
                                    </td>
                                </tr>
                            {{/each}}
                        </script>
                    </div>
                </div>
            </form>
        </div>
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
<script src="vendors/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="js/My97DatePicker/WdatePicker.js"></script>
<script src="js/common.js"></script>
<script type="text/javascript">
    $(function () {
        var array = [{ "agent": "sel_agent" }];
        //获取url Id
        var id = getPValueByName("id");
        $("#Principal").val("0.00");
        $("#Interest").val("0.00");
        getLoanInfo(id);
        showRepaymentComplete();
        getRepayData();
        $.initAgent(array);

        $('#btn_repay').click(function () {
            //跳转到还款页面
            // 获取url 参数 id
            // alert(id);
            // window.location.href = "RepaymentEidt.aspx?id=" + id;
            getRepayData_one();
            $('#repay').modal();
        });

        $('#btn_save').click(function () {
            //输入的利息和金额必须一个大于0
            if (validate()) {
                if (confirm("是否确认保存当前数据？")) {
                    saveRepayment();
                }

            }




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

    function validate() {

        var loanTime = $("#txt_loanTime1").val();
        var Principal = $("#Principal").val();
        var Interest = $("#Interest").val();

        if ((parseFloat(Principal) + parseFloat(Interest)) <= 0) {
            alert("利息和本金不能同时为0");
            return false;
        }

        if (loanTime == "") {
            alert("请选择指定还款时间");
            // $.alertWarningHtml('alert-warning', '请选择指定还款时间');
            return false;
        }
        return true;

    }

    function getRepayData() {
        // (int currentPage, int pageSize, string orderBy, string where)


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
                var html = template('Script1', { list: jsondatas });
                $("#Tbody1").html(html);
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
                $('#LoanAmount').text(jsondatas.LoanAmount);
                $('#LoanNumber').text(jsondatas.LoanNumber);
                $('#endtime').text(jsondatas.EndTime);
            }
        });
    }


    //保存信息
    function saveRepayment() {
        //$.jsDate2WcfDate(new Date($('#txt_loanTime').val()))
        // alert($('#txt_loanTime1').val());
        var obj = new Object();
        obj.model = new Object({
            ID: 0,
            RepayDate: $.jsDate2WcfDate(new Date($('#txt_loanTime1').val())),
            Principal: $("#Principal").val(),
            Interest: $("#Interest").val(),
            CreateUserID: 1,
            LoanID: getPValueByName("id")
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
                getRepayData();
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
                    }
                });
            }
        });
    }



</script>
