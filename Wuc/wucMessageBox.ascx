<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucMessageBox.ascx.cs" Inherits="wuc_wucMessageBox" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:UpdatePanel ID="upModal" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div class="modal fade" id="myModalMessage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-body text-center text-uppercase">
                        <asp:Label ID="lModalBody" runat="server" ForeColor="#4682B4" Font-Bold="true"/>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<%--<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucMessageBox.ascx.cs" Inherits="wuc_wucMessageBox" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:UpdatePanel ID="upMdlPopup" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:LinkButton ID="lnkDummy" runat="server" Style="display: none" Visible="true" />
        <cc1:ModalPopupExtender ID="mdlPopup" BehaviorID="mdlPopup" runat="server" TargetControlID="lnkDummy"
                    PopupControlID="pnlPopup" BackgroundCssClass="modalBackground" />
        <asp:Panel ID="pnlPopup" runat="server" CssClass="confirm-dialog" style="display:none;">
            <div class="inner">
                <h2><asp:Label ID="lblMessage" runat="server" Text="" /></h2>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="close" OnClientClick="$find('mdlPopup').hide(); return false;" />
            </div>
        </asp:Panel>     
    </ContentTemplate>
</asp:UpdatePanel>--%>

