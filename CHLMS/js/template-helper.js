
/** 
 * 对日期进行格式化， 
 * @param date 要格式化的日期 
 * @param format 进行格式化的模式字符串
 *     支持的模式字母有： 
 *     y:年, 
 *     M:年中的月份(1-12), 
 *     d:月份中的天(1-31), 
 *     h:小时(0-23), 
 *     m:分(0-59), 
 *     s:秒(0-59), 
 *     S:毫秒(0-999),
 *     q:季度(1-4)
 * @return String
 * @author yanis.wang
 * @see	http://yaniswang.com/frontend/2013/02/16/dateformat-performance/
 */
template.helper('dateFormat', function (time, format) {
    time = time.replace("/Date(", "").replace(")/", "");
    if (time.indexOf("T") > -1) {
        time = time.replace(/(\d{4})-(\d{2})-(\d{2})T(.*)/, "$1/$2/$3 $4");
        if(time.indexOf(".") > -1)
            time = time.split(".")[0];
    } else
        time = parseInt(time);
    var date = new Date(time);
    var map = {
        "M": date.getMonth() + 1, //月份 
        "d": date.getDate(), //日 
        "h": date.getHours(), //小时 
        "m": date.getMinutes(), //分 
        "s": date.getSeconds(), //秒 
        "q": Math.floor((date.getMonth() + 3) / 3), //季度 
        "S": date.getMilliseconds() //毫秒 
    };

    format = format.replace(/([yMdhmsqS])+/g, function (all, t) {
        var v = map[t];
        if (v !== undefined) {
            if (all.length > 1) {
                v = '0' + v;
                v = v.substr(v.length - 2);
            }
            return v;
        }
        else if (t === 'y') {
            return (date.getFullYear() + '').substr(4 - all.length);
        }
        return all;
    });
    return format;
});
template.helper('currencyFormat', function (num, symbol) {
    if (isNaN(num)) {
        return '0';
    }
    var sign = "";
    if (num < 0)
        sign = "-";
    var numParts = String(num).split('.');
    var hasDecimals = (numParts.length > 1);
    var decimals = (hasDecimals ? numParts[1].toString() : '0');
    num = Math.abs(numParts[0]);
    num = isNaN(num) ? 0 : num;
    num = String(num);
    for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3) ; i++) {
        num = num.substring(0, num.length - (4 * i + 3)) + ',' + num.substring(num.length - (4 * i + 3));
    }
    if (hasDecimals) {
        num += '.' + decimals;
    }
    var format = "%s%n";
    var money = format.replace(/%s/g, symbol);
    money = money.replace(/%n/g, num);
    money = sign + money;
    return money;
});