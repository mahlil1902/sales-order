<%@ Page Title="MahlilProject || Sales Order" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SalesOrder.aspx.cs" Inherits="Transaction_SalesOrder" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="titlePage">SALES ORDER</div>
        <br />
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="card" style="border: 1px solid black; border-radius: 10px;">
                <div class="card-body" style="padding-top: 10px;">
                    <div class="row">
                        <div class="col-md-5" style="padding-left: 50px;">
                            <label for="txtKeyword">Keywords:</label>
                            <asp:TextBox ID="txtKeyword" runat="server" CssClass="form-control" placeholder="Input Here" Width="50%"></asp:TextBox>
                        </div>
                        <div class="col-md-5">
                            <label for="tbReqDelvDate">Order Date:</label>
                            <div class="input-group">
                                <asp:TextBox ID="tbReqDelvDate" runat="server" CssClass="form-control" placeholder="Pick Date" Width="100%" />
                                <cc1:CalendarExtender ID="ceInstallationDate" runat="server" TargetControlID="tbReqDelvDate" Format="dd-MM-yyyy" />
                            </div>
                        </div>
                        <div class="col-md-2" style="padding-top: 15px;">
                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />

                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-11 text-right">
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" style="height: 40px; padding-top: 20px;">
        <ContentTemplate>
            <div class="form-inline">
                <div class="col-sm-12">
                    <asp:LinkButton ID="btnAddNew" runat="server" ForeColor="White" CssClass="btn btn-danger btn-sm" OnClick="btnAddNew_Click"><i class="fa fa-save"></i>&nbsp;Add New Data</asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="btnExportToExcel" runat="server" ForeColor="White" CssClass="btn btn-success btn-sm" OnClick="btnExportToExcel_Click" CausesValidation="false"><i class="fa fa-undo"></i>&nbsp;Export To Excel</asp:LinkButton>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="col-sm-12">
        <asp:UpdatePanel ID="upGrid" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:GridView ID="grid" runat="server" class="table table-striped table-bordered table-hover" AllowPaging="false" 
                    AutoGenerateColumns="False" Width="100%" DataKeyNames="order_id" EmptyDataText="NO DATA" BackColor="White">
                    <HeaderStyle BackColor="#2E1A75" Font-Bold="True" ForeColor="White" />
                    <EmptyDataRowStyle HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <AlternatingRowStyle BackColor="White" />
                    <PagerStyle BorderWidth="1px" BackColor="White" ForeColor="#284775" HorizontalAlign="Center" />
                    <FooterStyle BackColor="#2E1A75" Font-Bold="True" ForeColor="White" HorizontalAlign="Right" />
                    <Columns>
                        <asp:TemplateField HeaderText="No." HeaderStyle-CssClass="text-center">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="80px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="text-center">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
<%--                                <asp:ImageButton ID="btnEdit" runat="server" ImageUrl="~/Images/edit.png" OnClick="btnEdit_Click" CssClass="mr-2" />--%>
                                <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/Images/delete.png" OnClick="btnDelete_Click" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="80px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sales Order" HeaderStyle-CssClass="text-center">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lSalesOrderid" runat="server" Visible="false" Text='<%# Bind("order_id") %>' />
                                <asp:Label ID="lSalesOrderno" runat="server" Text='<%# Bind("order_no") %>' />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="80px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Order Date" HeaderStyle-CssClass="text-center">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lOrderDate" runat="server" Text='<%# Bind("ORDER_DATE","{0:dd MMM yyyy}") %>' />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="80px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Customer" HeaderStyle-CssClass="text-center">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lCustomer" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>' />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="80px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
