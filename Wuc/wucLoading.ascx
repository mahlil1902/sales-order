<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucLoading.ascx.cs" Inherits="wuc_wucLoading" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />

<asp:ScriptManagerProxy ID="MyProxy" runat="server">
    <Scripts>
        <asp:ScriptReference Path="~/Scripts/jsLoading.js" />
    </Scripts>
</asp:ScriptManagerProxy>

<asp:LinkButton ID="lnkLoading" runat="server" CssClass="Invisible" />
<asp:Panel ID="pnlLoading" runat="server" CssClass="confirm-dialog" style="display:none;">
    <div class="inner">
        <h2>Loading...</h2>
    </div>
</asp:Panel>     

<cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="lnkLoading"
PopupControlID="pnlLoading" BackgroundCssClass="modalBackground" BehaviorID="LoadingBehaviorID" />
