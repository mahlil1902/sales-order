function formatGeneral(num,mode,digit) {
    if(mode == "ENG") { 
        separatorThousand = ","; separatorDecimal = "."; 
        num = num.toString().replace(/\,/g,'');
    } else { 
        separatorThousand = "."; separatorDecimal = ","; 
        num = num.toString().replace(/\$|\./g,'').replace(/\,/g,'.');
    }
    kuadrat = Math.pow(10, digit);

    if (isNaN(num)) {
        num = "0";
    }
    sign = (num == (num = Math.abs(num)));
 
    num = Math.floor(num*kuadrat+0.50000000001);
    cents = num%kuadrat; //alert(cents);
    num = Math.floor(num / kuadrat).toString();
 
    ///////// new /////////
    if((num*kuadrat) < (kuadrat/10)) {
        var deczero = "";
        for (i = 1; i <= (digit - cents.toString().length); i++) {
            deczero = "0" + deczero;
            //alert(digit+'//'+cents.toString().length+'//'+deczero+'//'+cents);//
        }
        cents = deczero + cents;
    } else if(cents<10) {
        cents = "0" + cents;
    }
    ///////////////////////
 
    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
        num = num.substring(0,num.length-(4*i+3))+separatorThousand+
        num.substring(num.length-(4*i+3));
 
    if(digit == 0) { 
        separatorDecimal = "";
        cents = "";
    }
  
    return (((sign)?'':'-') + '' + num + separatorDecimal + cents);
}


function formatCurrency(num,mode) {
    if(mode == "ENG") { 
        separatorThousand = ","; separatorDecimal = "."; 
    }else { 
        separatorThousand = "."; separatorDecimal = ","; 
    }
 
    num = num.toString().replace(/\$|\./g,'').replace(/\,/g,'.');
    if(isNaN(num))
        num = "0";
    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num*100+0.50000000001);
    cents = num%100;
    num = Math.floor(num/100).toString();
    if(cents<10)
        cents = "0" + cents;
    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
        num = num.substring(0,num.length-(4*i+3))+separatorThousand+
        num.substring(num.length-(4*i+3));
    return (((sign)?'':'-') + '' + num + separatorDecimal + cents);
}

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}