<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExpireManage.aspx.cs" Inherits="WebUI.Repayment.ExpireManage" %>


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
                            <div class="text-muted bootstrap-admin-box-title">即将到期提醒</div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <table class="table table-striped table-bordered" id="loanList">
                                <thead>
                                    <tr>
                                        <th>借款编号</th>
                                        <th>会员名</th>
                                        <th>期数</th>
                                        <th>应还本金</th>
                                        <th>应还利息</th>
                                        <th>应还逾期利息</th>
                                        <th>到期天数</th>
                                        <th>还款状态</th>

                                    </tr>
                                </thead>
                                <tbody id="tb_loanListHtml"></tbody>
                            </table>
                            <script type="text/html" id="tb_loanList">
                                {{each list as $value i}}                       
                                        <tr class="gradeX">
                                            <td>{{$value.LoanNumber}}</td>
                                            <td>{{$value.UserID}}</td>
                                            <td>{{$value.PeNumber}}</td>
                                            <td>{{$value.RePrincipal.toFixed(2) | currencyFormat:'￥'}}</td>
                                            <td>{{$value.ReInterest.toFixed(2) | currencyFormat:'￥'}}</td>
                                            <td>{{$value.ReOverInterest}}</td>
                                            <td>{{$value.ExpireDays}}</td>
                                            <td>{{$value.Status==0?'未还':$value.Status==1?'全额已还':'作废'}}</td>


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
    <script type="text/javascript" src="vendors/jquery-1.9.1.min.js"></script>
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
            obj.pageSize = 1000;
            obj.filter = "";
            obj.orderBy = " DATEDIFF(dd,GETDATE(),DATEADD(MONTH,b.LoanTerm,LoanTime)) ASC";
            var jsonobj = JSON.stringify(obj);
             $.ajax({
                type: "POST",
                url: "../WebService/RepaymentServer.svc/GetPageRepaymentPlanList",
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
