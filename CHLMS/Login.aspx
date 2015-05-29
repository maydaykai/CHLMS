<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebUI.Login" %>

<!DOCTYPE html>
<html class="bootstrap-admin-vertical-centered">
    <head>
        <title>登录页面</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" media="screen">

        <!-- Bootstrap Admin Theme -->
        <link href="css/bootstrap-admin-theme.css" rel="stylesheet" media="screen">

        <!-- Custom styles -->
        <style type="text/css">
            .alert{
                margin: 0 auto 20px;
            }
        </style>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
           <script type="text/javascript" src="js/html5shiv.js"></script>
           <script type="text/javascript" src="js/respond.min.js"></script>
        <![endif]-->

        <script type="text/javascript" src="vendors/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script src="js/common.js"></script>
    </head>
    <body class="bootstrap-admin-without-padding">
        <form runat="server" class="container">
            <div class="row">
                <div class="alert alert-info">
                    <a class="close" data-dismiss="alert" href="#">&times;</a>
                    请输入正确的用户名和密码！
                </div>
                <div id="first" class="bootstrap-admin-login-form">
                    <h1>登录</h1>
                    <div class="form-group">
                        <input class="form-control" type="text" id="txt_userName" runat="server" placeholder="用户名" />
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="password" id="txt_password" runat="server" placeholder="密码" />
                    </div>
                    <%--<div class="form-group">
                        <label>
                            <input type="checkbox" name="remember_me">
                           记住密码
                        </label>
                    </div>--%>
                    <asp:Button CssClass="btn btn-lg btn-primary" runat="server" OnClick="Btn_Click" Text="提交" />
                </div>
            </div>
        </form>
        <script type="text/javascript">
            $(function () {
                // Setting focus
                $('#txt_userName').focus();

                // Setting width of the alert box
                var formWidth = $('.bootstrap-admin-login-form').innerWidth();
                var alertPadding = parseInt($('.alert').css('padding'));
                $('.alert').width(formWidth - 2 * alertPadding);
            });
        </script>
    </body>
</html>
