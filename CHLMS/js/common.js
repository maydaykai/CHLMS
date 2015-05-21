(function($) {
    $.alertWarningHtml = function(icon, warningTxt) {
        $('.alert').alert('close');
        var html = '<div class="alert ' + icon + '">' +
            '<a class="close" data-dismiss="alert" href="#">&times;</a>' +
            warningTxt +
            '</div>';
        $('#first').before(html);
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