<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucConfirmBoxBootstrap.ascx.cs" Inherits="wuc_wucConfirmBoxBootstrap" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<script type="text/javascript">
    $('#myModalLookup').modal({ backdrop: 'static', keyboard: true }) 
</script>

<style type="text/css">
    .modal {
    }
    .vertical-alignment-helper {
        display:table;
        height: 100%;
        width: 100%;
    }
    .vertical-align-center {
        display: table-cell;
        vertical-align: middle;
    }
    .modal-content {
        width:inherit;
        height:inherit;
        margin: 0 auto;
}
</style>

<asp:UpdatePanel ID="upModal" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div class="modal fade" id="myModal" data-backdrop="static" data-toggle="modal" aria-hidden="true">
            <div class="vertical-alignment-helper">
                <div class="modal-dialog modal-sm vertical-align-center">
                    <div class="modal-content">
                        <div class="modal-header" style="text-align:center; font-variant:small-caps; background-color:#4682B4;">
                            <h4 class="modal-title" id="myModalLabel">
                                <asp:Label ID="lModalTitle" runat="server" ForeColor="White" Font-Bold="true" />
                            </h4>
                        </div>
                        <div class="modal-footer" style="text-align:center;">
                            <asp:LinkButton ID="bYes" runat="server" OnClick="bYes_OnClick" CssClass="btn btn-success" Width="72px" Height="36px" ForeColor="White"><i class="fa fa-check"></i>&nbsp;Yes</asp:LinkButton>
                            <asp:LinkButton ID="bNo" runat="server" data-dismiss="modal" CssClass="btn btn-danger" Width="72px" Height="36px" ForeColor="White"><i class="fa fa-close"></i>&nbsp;No</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
