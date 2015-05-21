<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="WebUI.UserControl.Menu" %>
<div class="col-md-2 bootstrap-admin-col-left">
    <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
        <li class="active">
            <a href="/Index.aspx"><i class="glyphicon glyphicon-chevron-right"></i>首页</a>
        </li>
        <li id="uList" runat="server">
            <a href="/UserList.aspx"><i class="glyphicon glyphicon-chevron-right"></i>用户列表</a>
        </li>
        <li>
            <a href="/CustomerList.aspx"><i class="glyphicon glyphicon-chevron-right"></i>客户列表</a>
        </li>
        <li>
            <a href="/LoanList.aspx"><i class="glyphicon glyphicon-chevron-right"></i>借款列表</a>
        </li>
    </ul>
</div>
