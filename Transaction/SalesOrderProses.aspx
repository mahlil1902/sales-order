<%@ Page Title="MahlilProject || Sales Order Proses" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SalesOrderProses.aspx.cs" Inherits="Transaction_SalesOrderProses" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="titlePage">ADD NEW - SALES ORDER</div>
    </div>
    <asp:UpdatePanel ID="upHeader" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div style="float: left; width: 100%;">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-inline">
                            <div class="col-sm-2">
                                <asp:Label runat="server" ID="lblTransNo">Sales Order Number</asp:Label>
                            </div>
                            <div class="col-sm-10">
                                <div class="form-group">
                                    <asp:TextBox ID="tbSalesOrderNo" runat="server" CssClass="form-control" Width="210px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-inline">
                            <div class="col-sm-2">
                                <asp:Label runat="server" ID="lblOrderDate">Order Date</asp:Label>
                            </div>
                            <div class="col-sm-10">
                                <div class="form-group">
                                    <asp:TextBox ID="tbOrderDate" runat="server" CssClass="form-control" Width="100px" />
                                    <cc1:CalendarExtender ID="ceOrderDate" runat="server" TargetControlID="tbOrderDate" Format="dd-MM-yyyy" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-inline">
                            <div class="col-sm-2">
                                <asp:Label runat="server" ID="Label1">Customer</asp:Label>
                            </div>
                            <div class="col-sm-10">
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlCustomer" runat="server" Width="250px" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-inline">
                            <div class="col-sm-2">
                                <asp:Label runat="server" ID="Label2">Address</asp:Label>
                            </div>
                            <div class="col-sm-10">
                                <div class="form-group">
                                    <asp:TextBox ID="tbAddress" runat="server" CssClass="form-control" TextMode="MultiLine" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" style="height: 60px; padding-top: 20px;">
        <ContentTemplate>
            <div class="form-inline">
                <div class="col-sm-12">
                    <asp:LinkButton ID="btnAddNew" runat="server" ForeColor="White" CssClass="btn btn-danger btn-sm" OnClick="btnAddNew_Click"><i class="fa fa-save"></i>&nbsp;Add New Item</asp:LinkButton>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="upGridTemp" runat="server"  UpdateMode="Conditional">
        <ContentTemplate>
            <div class="row" >
                <div class="col-sm-12">
                    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" class="table table-striped table-bordered table-hover"
                        EmptyDataText="NO DATA" BackColor="White" ShowFooter="true" OnRowDataBound="GridView1_RowDataBound"
                        AllowPaging="True" PageSize="10" PagerSettings-Visible="false">
                        <HeaderStyle BackColor="#2E1A75" Font-Bold="True" ForeColor="White" />
                        <EmptyDataRowStyle HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <AlternatingRowStyle BackColor="White" />
                        <PagerStyle BorderWidth="1px" BackColor="White" ForeColor="#284775" HorizontalAlign="Center" />
                        <Columns>
                            <asp:TemplateField HeaderText="No">
                                <ItemStyle HorizontalAlign="right" VerticalAlign="Top" Width="5%" />
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ACTION">
                                <ItemStyle HorizontalAlign="right" VerticalAlign="Top" Width="10%" />
                                <ItemTemplate>
                                    <asp:Button ID="btnSave" runat="server" Visible="false" Text="💾" OnClick="btnSave_Click" CommandArgument="<%# Container.DataItemIndex %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ITEM NAME">
                                <ItemStyle HorizontalAlign="right" VerticalAlign="Top" Width="20%" />
                                <ItemTemplate>
                                    <asp:TextBox ID="txtItemName" Enabled="false" runat="server" Text='<%# Bind("ItemName") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="QTY">
                                <ItemStyle HorizontalAlign="right" VerticalAlign="Top" Width="15%" />
                                <ItemTemplate>
                                    <asp:TextBox ID="txtQty" Enabled="false" runat="server" Text='<%# Bind("Qty") %>' AutoPostBack="true" OnTextChanged="CalculateTotal"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblTotalQty" runat="server"></asp:Label>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PRICE">
                                <ItemStyle HorizontalAlign="right" VerticalAlign="Top" Width="15%" />
                                <ItemTemplate>
                                    <asp:TextBox ID="txtPrice" Enabled="false" runat="server" Text='<%# Bind("Price") %>' AutoPostBack="true" OnTextChanged="CalculateTotal"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TOTAL">
                                <ItemStyle HorizontalAlign="right" VerticalAlign="Top" Width="15%" />
                                <ItemTemplate>
                                    <asp:Label ID="lTotal" runat="server" CssClass="right" Text='<%# Bind("total", "{0:##,#0.#0}") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblGrandTotal" runat="server" ></asp:Label>
                                </FooterTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="height: 40px">
        <ContentTemplate>
            <div class="form-inline">
                <div class="row text-center">
                    <div class="col-sm-12">
                        <asp:LinkButton ID="btnSaveall" runat="server" ForeColor="White" CssClass="btn btn-primary btn-sm" OnClick="btnSaveall_Click"><i class="fa fa-save"></i>&nbsp;Save</asp:LinkButton>
                        <asp:LinkButton ID="btnCancel" runat="server" ForeColor="White" CssClass="btn btn-danger btn-sm" OnClick="btnCancel_Click" CausesValidation="false"><i class="fa fa-undo"></i>&nbsp;Back</asp:LinkButton>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

