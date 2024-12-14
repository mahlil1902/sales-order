function pageLoad(sender, args){
    //  register for our events
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginRequest);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequest);
}

function beginRequest(sender, args){
    var modalPopupBehavior = $find('LoadingBehaviorID');
    modalPopupBehavior.show();
    modalPopupBehavior.x = 0;
    modalPopupBehavior.y = 0;
}
function endRequest(sender, args) {
    var modalPopupBehavior = $find('LoadingBehaviorID');
    modalPopupBehavior.hide();
}
