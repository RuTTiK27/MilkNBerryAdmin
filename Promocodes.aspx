<%@ Page Title="Milk And Berries - Promocodes" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Promocodes.aspx.cs" Inherits="Admin_Promocodes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .mainDiv {
            margin-top: 20px;
            background-color: #f7f7fc;
        }

        .timeline {
            list-style-type: none;
            position: relative
        }

            .timeline:before {
                background: #dee2e6;
                left: 9px;
                width: 2px;
                height: 100%
            }

            .timeline-item:before,
            .timeline:before {
                content: " ";
                display: inline-block;
                position: absolute;
                z-index: 1
            }

        .timeline-item:before {
            background: #fff;
            border-radius: 50%;
            border: 3px solid #3b7ddd;
            left: 0;
            width: 20px;
            height: 20px
        }

        .card {
            margin-bottom: 24px;
            box-shadow: 0 0 0.875rem 0 rgba(33,37,41,.05);
        }

        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: initial;
            border: 0 solid transparent;
            border-radius: .25rem;
        }

        .card-body {
            flex: 1 1 auto;
            padding: 1.25rem;
        }

        .card-header:first-child {
            border-radius: .25rem .25rem 0 0;
        }

        .card-header {
            border-bottom-width: 1px;
        }

        .pb-0 {
            padding-bottom: 0 !important;
        }

        .card-header {
            padding: 1rem 1.25rem;
            margin-bottom: 0;
            background-color: #fff;
            border-bottom: 0 solid transparent;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="mainDiv">
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

        <div class="container">
            <div class="container-fluid p-0">
                <div class="row">
                    <div class="col-xl-8">
                        <div class="card">
                            <div class="card-header pb-0">
                                <h5 class="card-title mb-0">Promocode</h5>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped" style="width: 100%">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Name</th>
                                            <th>Discount(%)</th>
                                            <th>Minimum Amount</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="ListView1" OnItemDataBound="ListView1_ItemDataBound" runat="server" DataKeyNames="PROMOCODEID">
                                            <AlternatingItemTemplate>
                                                <asp:Label ID="lblIsActive" CssClass="d-none" runat="server" Text='<%# Eval("ISACTIVE") %>'></asp:Label>
                                                <tr>
                                                    <td><%# Eval("PROMOCODEID") %> </td>
                                                    <td>
                                                        <asp:TextBox ID="txtPromocodeName" Text='<%# Eval("PROMOCODE") %>' CssClass="form-control" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtPromocodeDiscount" Text='<%# Eval("DISCOUNT") %>' CssClass="form-control" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtPromocodeMinimumamount" Text='<%# Eval("MINAMOUNT") %>' CssClass="form-control" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:CheckBox OnCheckedChanged="isActive_CheckedChanged" AutoPostBack="true" ID="isActive" runat="server" />
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btnUpdate" OnClick="btnUpdate_Click" CommandArgument='<%# Eval("PROMOCODEID")%>' CssClass="btn btn-dark btn-sm" runat="server" Text="Update" />
                                                    </td>
                                                </tr>

                                                <%--<span style="">PROMOCODEID:
            <asp:Label ID="PROMOCODEIDLabel" runat="server" Text='<%# Eval("PROMOCODEID") %>' />
            <br />
            PROMOCODE:
            <asp:Label ID="PROMOCODELabel" runat="server" Text='<%# Eval("PROMOCODE") %>' />
            <br />
            DISCOUNT:
            <asp:Label ID="DISCOUNTLabel" runat="server" Text='<%# Eval("DISCOUNT") %>' />
            <br />
            MINAMOUNT:
            <asp:Label ID="MINAMOUNTLabel" runat="server" Text='<%# Eval("MINAMOUNT") %>' />
            <br />
            ISACTIVE:
            <asp:Label ID="ISACTIVELabel" runat="server" Text='<%# Eval("ISACTIVE") %>' />
            <br />
<br /></span>--%>
                                            </AlternatingItemTemplate>
                                            <EditItemTemplate>
                                                <span style="">PROMOCODEID:
            <asp:Label ID="PROMOCODEIDLabel1" runat="server" Text='<%# Eval("PROMOCODEID") %>' />
                                                    <br />
                                                    PROMOCODE:
            <asp:TextBox ID="PROMOCODETextBox" runat="server" Text='<%# Bind("PROMOCODE") %>' />
                                                    <br />
                                                    DISCOUNT:
            <asp:TextBox ID="DISCOUNTTextBox" runat="server" Text='<%# Bind("DISCOUNT") %>' />
                                                    <br />
                                                    MINAMOUNT:
            <asp:TextBox ID="MINAMOUNTTextBox" runat="server" Text='<%# Bind("MINAMOUNT") %>' />
                                                    <br />
                                                    ISACTIVE:
            <asp:TextBox ID="ISACTIVETextBox" runat="server" Text='<%# Bind("ISACTIVE") %>' />
                                                    <br />
                                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                                    <br />
                                                    <br />
                                                </span>
                                            </EditItemTemplate>
                                            <EmptyDataTemplate>
                                                <span>No data was returned.</span>
                                            </EmptyDataTemplate>
                                            <InsertItemTemplate>
                                                <span style="">PROMOCODE:
            <asp:TextBox ID="PROMOCODETextBox" runat="server" Text='<%# Bind("PROMOCODE") %>' />
                                                    <br />
                                                    DISCOUNT:
            <asp:TextBox ID="DISCOUNTTextBox" runat="server" Text='<%# Bind("DISCOUNT") %>' />
                                                    <br />
                                                    MINAMOUNT:
            <asp:TextBox ID="MINAMOUNTTextBox" runat="server" Text='<%# Bind("MINAMOUNT") %>' />
                                                    <br />
                                                    ISACTIVE:
            <asp:TextBox ID="ISACTIVETextBox" runat="server" Text='<%# Bind("ISACTIVE") %>' />
                                                    <br />
                                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                                    <br />
                                                    <br />
                                                </span>
                                            </InsertItemTemplate>
                                            <ItemTemplate>

                                                <asp:Label ID="lblIsActive" CssClass="d-none" runat="server" Text='<%# Eval("ISACTIVE") %>'></asp:Label>
                                                <tr>
                                                    <td><%# Eval("PROMOCODEID") %> </td>
                                                    <td>
                                                        <asp:TextBox ID="txtPromocodeName" Text='<%# Eval("PROMOCODE") %>' CssClass="form-control" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtPromocodeDiscount" Text='<%# Eval("DISCOUNT") %>' CssClass="form-control" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtPromocodeMinimumamount" Text='<%# Eval("MINAMOUNT") %>' CssClass="form-control" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="text-center">
                                                        <asp:CheckBox ID="isActive" OnCheckedChanged="isActive_CheckedChanged" AutoPostBack="true" runat="server" />
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btnUpdate" OnClick="btnUpdate_Click" CommandArgument='<%# Eval("PROMOCODEID")%>' CssClass="btn btn-dark btn-sm" runat="server" Text="Update" />
                                                    </td>


                                                </tr>

                                                <%--<span style="">PROMOCODEID:
            <asp:Label ID="PROMOCODEIDLabel" runat="server" Text='<%# Eval("PROMOCODEID") %>' />
            <br />
            PROMOCODE:
            <asp:Label ID="PROMOCODELabel" runat="server" Text='<%# Eval("PROMOCODE") %>' />
            <br />
            DISCOUNT:
            <asp:Label ID="DISCOUNTLabel" runat="server" Text='<%# Eval("DISCOUNT") %>' />
            <br />
            MINAMOUNT:
            <asp:Label ID="MINAMOUNTLabel" runat="server" Text='<%# Eval("MINAMOUNT") %>' />
            <br />
            ISACTIVE:
            <asp:Label ID="ISACTIVELabel" runat="server" Text='<%# Eval("ISACTIVE") %>' />
            <br />
<br /></span>--%>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <div id="itemPlaceholderContainer" runat="server" style="">
                                                    <span runat="server" id="itemPlaceholder" />
                                                </div>
                                                <div style="">
                                                </div>
                                            </LayoutTemplate>
                                            <SelectedItemTemplate>
                                                <span style="">PROMOCODEID:
            <asp:Label ID="PROMOCODEIDLabel" runat="server" Text='<%# Eval("PROMOCODEID") %>' />
                                                    <br />
                                                    PROMOCODE:
            <asp:Label ID="PROMOCODELabel" runat="server" Text='<%# Eval("PROMOCODE") %>' />
                                                    <br />
                                                    DISCOUNT:
            <asp:Label ID="DISCOUNTLabel" runat="server" Text='<%# Eval("DISCOUNT") %>' />
                                                    <br />
                                                    MINAMOUNT:
            <asp:Label ID="MINAMOUNTLabel" runat="server" Text='<%# Eval("MINAMOUNT") %>' />
                                                    <br />
                                                    ISACTIVE:
            <asp:Label ID="ISACTIVELabel" runat="server" Text='<%# Eval("ISACTIVE") %>' />
                                                    <br />
                                                    <br />
                                                </span>
                                            </SelectedItemTemplate>
                                        </asp:ListView>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-4">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title text-center mb-0">New Promocode</h5>
                            </div>

                            <div class="container">
                                <hr />
                            </div>

                            <div class="card-body">

                                <asp:TextBox ID="txtName" CssClass="form-control mb-2" placeholder="Promocode Name" runat="server"></asp:TextBox>

                                <asp:TextBox ID="txtDiscount" CssClass="form-control mb-2" placeholder="Discount(%)" runat="server"></asp:TextBox>

                                <asp:TextBox ID="txtMinimumAmount" CssClass="form-control mb-2" placeholder="Minimum Amount" runat="server"></asp:TextBox>

                                <div class="d-flex justify-content-center">
                                    <asp:Button ID="btnAdd" OnClick="btnAdd_Click" CssClass="btn btn-primary" runat="server" Text="Add" />
                                </div>
                            </div>


                            <div class="card-footer">
                                <label>Status:</label>
                                <asp:RadioButtonList OnSelectedIndexChanged="rbl_SelectedIndexChanged" ID="rbl" AutoPostBack="true" runat="server">
                                    <asp:ListItem Value="All">&nbsp;All</asp:ListItem>
                                    <asp:ListItem Value="1">&nbsp;Active</asp:ListItem>
                                    <asp:ListItem Value="0">&nbsp;Deactive</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

