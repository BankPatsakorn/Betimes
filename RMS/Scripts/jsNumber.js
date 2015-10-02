function check_num(number) {
    number.value = parseFloat(number.value);
    if (number.value == 'NaN') {
        number.value = '0';
    } else {
        if (number.value > 99) {
            number.value = FormatNum(number.value, 0, '', ',');
        } else {
            number.value = FormatNum(number.value, 0, '', ',');
            number.value = number.value.split(",").join("");
        }
    }
}
function check_floats(number, floats) {
    number.value = ReplaceAll(number.value, ",", "");
    number.value = parseFloat(number.value);
    //alert(number.value);
    if (number.value == 'NaN') {
        number.value = '0.00';
    } else {
        if (number.value > 99) {
            number.value = FormatNum(number.value, floats, '.', ',');
        } else {
            number.value = FormatNum(number.value, floats, '.', ',');
            number.value = number.value.split(",").join("");
        }
    }
}
function ReplaceAll(Source, stringToFind, stringToReplace) {
    var temp = Source;
    var index = temp.indexOf(stringToFind);
    while (index != -1) {
        temp = temp.replace(stringToFind, stringToReplace);
        index = temp.indexOf(stringToFind);
    }
    return temp;
}
function FormatNum(n, c, d, t) {
    /*parameter  n =ค่า Value
    parameter c = จำนวนทศนิยม
    parameter d =เคื่องหมายคั่นจำนวนเต็มกับจุดทศนิยม(.)
    parameter  t =เครื่องหมายคั่นตำแหน่งพัน(,)    
    */
    var m = (c = Math.abs(c) + 1 ? c : 2, d = d || ",", t = t || ".", /(\d+)(?:(\.\d+)|)/.exec(n + "")), x = m[1].length % 3;
    return (x ? m[1].substr(0, x) + t : "") + m[1].substr(x).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + (+m[2]).toFixed(c).substr(2) : "");
}