(function($) {
    $.alertWarningHtml = function (icon, warningTxt, id) {
        if (id == undefined) id = "first";
        $('.alert').alert('close');
        var html = '<div class="alert ' + icon + '">' +
            '<a class="close" data-dismiss="alert" href="#">&times;</a>' +
            warningTxt +
            '</div>';
        $('#' + id).before(html);
    },
    $.commonAjax = function (url, jsonobj, successCall) {
        $.ajax({
            type: "POST",
            async: true,
            contentType: "application/json; charset=utf-8",
            url: url,
            dataType: "json",
            cache: false,
            data: jsonobj,
            success: function (data) {
                successCall(data);
            },
            error: function (xmlHttpRequest) {
                alert(xmlHttpRequest.innerText);
            }
        });
    },
    $.initAgent = function(array) {
        var obj = new Object();
        obj.currentPage = 1;
        obj.pageSize = 100;
        obj.filter = "Type=2";
        obj.orderBy = "ID";
        var jsonobj = JSON.stringify(obj);
        $.commonAjax("/WebService/User.svc/GetUserList", jsonobj, function (data) {
            var jsondatas = JSON.parse(data.d);
            $.each(array, function (n, jsonObj) {
                $("#" + jsonObj.agent).empty().append("<option value='0'>--请选择--</option>");
                if (jsondatas != null && jsondatas.length > 0) {
                    $(jsondatas).each(function () {
                        $("#" + jsonObj.agent).append("<option value='" + this["ID"] + "'>" + this["LoginName"] + "|" + this["RealName"] + "</option>");
                    });
                }
            });
        });
    },
    $.initCustomer = function (array) {
        var obj = new Object();
        obj.currentPage = 1;
        obj.pageSize = 100;
        obj.filter = "";
        obj.orderBy = "ID";
        var jsonobj = JSON.stringify(obj);
        $.commonAjax("/WebService/Customer.svc/GetCustomerList", jsonobj, function (data) {
            var jsondatas = JSON.parse(data.d);
            $.each(array, function (n, jsonObj) {
                $("#" + jsonObj.customer).empty().append("<option value='0'>--请选择--</option>");
                if (jsondatas != null && jsondatas.length > 0) {
                    $(jsondatas).each(function () {
                        $("#" + jsonObj.customer).append("<option value='" + this["ID"] + "'>" + this["Name"] + "|" + this["RealName"] + "</option>");
                    });
                }
            });
        });
    },
    $.initLoanType = function (array) {
        var obj = new Object();
        obj.currentPage = 1;
        obj.pageSize = 100;
        obj.filter = "";
        obj.orderBy = "ID";
        var jsonobj = JSON.stringify(obj);
        $.commonAjax("/WebService/Loan.svc/GetLoanTypeList", jsonobj, function (data) {
            var jsondatas = JSON.parse(data.d);
            $.each(array, function (n, jsonObj) {
                $("#" + jsonObj.loanType).empty().append("<option value='0'>--请选择--</option>");
                if (jsondatas != null && jsondatas.length > 0) {
                    $(jsondatas).each(function () {
                        $("#" + jsonObj.loanType).append("<option value='" + this["ID"] + "'>" + this["Name"] + "</option>");
                    });
                }
            });
        });
    },
    $.wcfDate2JsDate = function (wcfDate) {
        var date = new Date(parseInt(wcfDate.substring(6)));
        return date;
    },
    $.jsDate2WcfDate = function (jsDate) {
        return "\/Date(" + jsDate.getTime() + "+0000)\/";
    }
})(jQuery);
//url获取参数
function param(name, value) {
    this.name = name;
    this.value = value;
}
var url = window.location.href;
var p = url.split("?");
var all = new Array();
var params = p.length > 1 ? p[1].split("&") : new Array();
for (var i = 0; i < params.length; i++) {
    var pname = params[i].split("=")[0];
    var pvalue = params[i].split("=")[1];
    all[i] = new param(pname, pvalue);
}
//获取参数值
function getPValueByName(name) {
    for (var i = 0; i < all.length; i++) {
        if (all[i].name == name)
            return all[i].value;
    }
}