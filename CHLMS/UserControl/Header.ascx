<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="WebUI.UserControl.Header" %>
<nav class="navbar navbar-default navbar-inverse navbar-fixed-top " role="navigation">
    <div class="container">
        <div class="row">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">车贷房贷管理系统</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="userName" runat="server">管理员<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <%--<li><a href="#">设置</a></li>
                            <li><a href="#">个人资料</a></li>
                            <li><a href="#">账户中心</a></li>--%>
                            <li class="divider"></li>
                            <li><a href="LoginOut.aspx">退出登录</a></li>
                        </ul>
                    </li>
                    <li><a href="LoginOut.aspx">退出登录</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </div>
</nav>
