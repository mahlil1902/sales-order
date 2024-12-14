<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucConfirmBox.ascx.cs" Inherits="wuc_wucConfirmBox" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:UpdatePanel ID="upMpeConfirm" runat="server">
    <ContentTemplate>
<%--        <asp:LinkButton ID="linkConfirm" runat="server" Style="display: none" Visible="true" />
        <cc1:ModalPopupExtender ID="mpeConfirm" BehaviorID="mpeConfirm" runat="server" TargetControlID="linkConfirm"
                    PopupControlID="panelConfirm" BackgroundCssClass="modalBackground" />
        <asp:Panel ID="panelConfirm" runat="server" style="display: none;">--%>
            <div class="modal fade" id="mpeConfirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header" style="text-align:center; font-variant:small-caps; background-color:#00269a;">
                            <h4 class="modal-title" id="myModalLabel">
                                <asp:Label ID="lModalTitle" runat="server" ForeColor="White" Font-Bold="true" />
                            </h4>
                        </div>
                        <div class="modal-footer" style="text-align:center;background-color:#fff;">
                            <asp:UpdatePanel ID="upButton" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="bYes" runat="server" OnClick="btnYes_Click" EnableViewState="false" CssClass="btn btn-success" Width="72px" Height="36px" ForeColor="White" Text="Yes"></asp:Button>
                                    <asp:Button ID="bNo" runat="server"  data-dismiss="modal" CssClass="btn btn-danger" Width="72px" Height="36px" ForeColor="White" Text="No"></asp:Button>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="bYes" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
<%--        </asp:Panel>    --%> 
    </ContentTemplate>
</asp:UpdatePanel>

