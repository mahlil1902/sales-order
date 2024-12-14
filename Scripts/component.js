function fnParseURL(url) {

    //parse jika ada PARC nya
    var x = url.split("?");
    var y = x[1];
    var requestParams = y.split("&");

    var i = 0;

    for (i = 0; i < requestParams.length; i++) {
        var requestParam = requestParams[i].split("=");

        if (requestParam[0].substr(0, 4) == 'parc') {
            var ctrl = requestParam[1];
            url = url.replace(requestParam[1], $get(ctrl).innerHTML);
        }
    }

    return url;
}

function fnShowDialog(url) {
    alert("aa");
    url = fnParseURL(url);

    $get('ifrpopup').src = url;
    $('#ModalPopup').modal('show');
}
function numPress(event, t) {
  
    var chCode = ('charCode' in event) ? event.charCode : event.keyCode;

    if (chCode != 0) {

        if (chCode < 48 || chCode > 57) {

            switch (t) {
                case 'T':
                    if (chCode != 45) {
                        return false;
                    } else {
                        return true;
                    }
                    break;
                case 'D':
                    if (chCode != 46) {
                        return false;
                    } else {
                        var $obj = event.target.id;
                        var $val = $('#' + $obj).val();
                        if ($val.indexOf(".") > 0) {
                            return false;
                        } else {
                            return true;
                        }
                    }
                    break;
                default:
                    return false;
            }

        }
    } else {
        return true;
    }


}
function numBlank(ob) {
   // alert(ob);
    var form = document.getElementById(ob);

    var txt = form.value;
  
    if (txt == '') {
        form.val('0');
    } else {

    form.value = formatGeneral(form.value, 'ENG', 0);
    }
}
String.prototype.replaceAll = function (find, replace) {
    var result = this;
    do {
        var split = result.split(find);
        result = split.join(replace);
    } while (split.length > 1);
    return result;
};
