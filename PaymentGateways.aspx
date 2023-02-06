<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="PaymentGateways.aspx.cs" Inherits="Admin_PaymentGateways" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    <div class="container">
        <div class="container-fluid p-0">
            <div class="row">
                <div class="col-xl-8">
                    <div class="card">
                        <div class="card-header pb-0">
                            <h5 class="card-title mb-0">Payment Gateway</h5>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>PAYMENTGATEWAYNAME</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView runat="server" ID="ListView1" OnItemDataBound="ListView1_ItemDataBound" DataKeyNames="ID">
                                        <alternatingitemtemplate>
                                            <asp:Label ID="lblIsActive" CssClass="d-none" runat="server" Text='<%# Eval("ISACTIVE") %>'></asp:Label>
                                            <tr>
                                                <td><%# Eval("ID") %> </td>
                                                <td>
                                                    <asp:TextBox ID="txtPaymentGatewayName" Enabled="false" Text='<%# Eval("PAYMENTGATEWAYNAME") %>' CssClass="form-control" runat="server"></asp:TextBox>
                                                </td>

                                                <td class="text-center">
                                                    <asp:CheckBox OnCheckedChanged="isActive_CheckedChanged" AutoPostBack="true" ID="isActive" runat="server" />
                                                </td>
                                            </tr>
                                            <%--<span style="">ID:
                <asp:Label Text='<%# Eval("ID") %>' runat="server" id="IDLabel" />
                                                <br />
                                                PAYMENTGATEWAYNAME:
                <asp:Label Text='<%# Eval("PAYMENTGATEWAYNAME") %>' runat="server" id="PAYMENTGATEWAYNAMELabel" />
                                                <br />
                                                ISACTIVE:
                <asp:Label Text='<%# Eval("ISACTIVE") %>' runat="server" id="ISACTIVELabel" />
                                                <br />
                                                <br />
                                            </span>--%>
                                        </alternatingitemtemplate>
                                        <edititemtemplate>
                                            <span style="">ID:
                <asp:Label Text='<%# Eval("ID") %>' runat="server" id="IDLabel1" />
                                                <br />
                                                PAYMENTGATEWAYNAME:
                <asp:TextBox Text='<%# Bind("PAYMENTGATEWAYNAME") %>' runat="server" id="PAYMENTGATEWAYNAMETextBox" />
                                                <br />
                                                ISACTIVE:
                <asp:TextBox Text='<%# Bind("ISACTIVE") %>' runat="server" id="ISACTIVETextBox" />
                                                <br />
                                                <asp:Button runat="server" CommandName="Update" Text="Update" id="UpdateButton" />
                                                <asp:Button runat="server" CommandName="Cancel" Text="Cancel" id="CancelButton" />
                                                <br />
                                                <br />
                                            </span>
                                        </edititemtemplate>
                                        <emptydatatemplate>
                                            <span>No data was returned.</span>
                                        </emptydatatemplate>
                                        <insertitemtemplate>
                                            <span style="">PAYMENTGATEWAYNAME:
                <asp:TextBox Text='<%# Bind("PAYMENTGATEWAYNAME") %>' runat="server" id="TextBox5" />
                                                <br />
                                                ISACTIVE:
                <asp:TextBox Text='<%# Bind("ISACTIVE") %>' runat="server" id="TextBox6" />
                                                <br />
                                                <asp:Button runat="server" CommandName="Insert" Text="Insert" id="InsertButton" />
                                                <asp:Button runat="server" CommandName="Cancel" Text="Clear" id="Button6" />
                                                <br />
                                                <br />
                                            </span>
                                        </insertitemtemplate>
                                        <itemtemplate>
                                            <asp:Label ID="lblIsActive" CssClass="d-none" runat="server" Text='<%# Eval("ISACTIVE") %>'></asp:Label>
                                            <tr>
                                                <td><%# Eval("ID") %> </td>
                                                <td>
                                                    <asp:TextBox ID="txtPaymentGatewayName" Enabled="false" Text='<%# Eval("PAYMENTGATEWAYNAME") %>' CssClass="form-control" runat="server"></asp:TextBox>
                                                </td>

                                                <td class="text-center">
                                                    <asp:CheckBox OnCheckedChanged="isActive_CheckedChanged" AutoPostBack="true" ID="isActive" runat="server" />
                                                </td>
                                            </tr>
                                            <%--<span style="">ID:
                <asp:Label Text='<%# Eval("ID") %>' runat="server" id="Label5" />
                                                <br />
                                                PAYMENTGATEWAYNAME:
                <asp:Label Text='<%# Eval("PAYMENTGATEWAYNAME") %>' runat="server" id="Label6" />
                                                <br />
                                                ISACTIVE:
                <asp:Label Text='<%# Eval("ISACTIVE") %>' runat="server" id="Label7" />
                                                <br />
                                                <br />
                                            </span>--%>
                                        </itemtemplate>
                                        <layouttemplate>
                                            <div runat="server" id="itemPlaceholderContainer" style=""><span runat="server" id="itemPlaceholder" /></div>
                                            <div style="">
                                            </div>
                                        </layouttemplate>
                                        <selecteditemtemplate>
                                            <span style="">ID:
                <asp:Label Text='<%# Eval("ID") %>' runat="server" id="Label8" />
                                                <br />
                                                PAYMENTGATEWAYNAME:
                <asp:Label Text='<%# Eval("PAYMENTGATEWAYNAME") %>' runat="server" id="Label9" />
                                                <br />
                                                ISACTIVE:
                <asp:Label Text='<%# Eval("ISACTIVE") %>' runat="server" id="Label10" />
                                                <br />
                                                <br />
                                            </span>
                                        </selecteditemtemplate>
                                    </asp:ListView>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

