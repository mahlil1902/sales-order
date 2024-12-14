<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucMessageBoxBootstrap.ascx.cs" Inherits="wuc_wucMessageBoxBootstrap" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:UpdatePanel ID="upModal" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div class="modal fade" id="myModalMessageBootstrap" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body text-center text-uppercase">
                        <asp:Label ID="lModalBody" runat="server" ForeColor="#4682B4" Font-Bold="true"/>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
