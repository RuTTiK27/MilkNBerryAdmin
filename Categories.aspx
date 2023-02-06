<%@ Page Title="Milk And Berries - Categories" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Admin_Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .mainDiv {
            margin-top: 20px;
            background: #f8f8f8
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

    <div class="mainDiv">
        <div class="container">
            <div class="row flex-lg-nowrap">

                <div class="col">
                    <div class="e-tabs mb-3 px-3">
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a class="nav-link active" href="#">Category</a></li>
                        </ul>
                    </div>

                    <div class="row flex-lg-nowrap">
                        <div class="col mb-3">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered text-center">
                                                <thead>
                                                    <tr>
                                                        <th class="align-top">
                                                            <label class="custom-control-label" for="all-items">#</label>
                                                        </th>
                                                        <th class="max-width">Categoryname</th>
                                                        <th class="">GST (%)</th>
                                                        <th class="">Respond</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="CATEGORYID">
                                                        <AlternatingItemTemplate>

                                                            <tr>
                                                                <td><%# Eval("CATEGORYID") %> </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtCategoryName" Text='<%# Eval("CATEGORYNAME") %>' CssClass="form-control" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtGstPercentage" Enabled="false" Text='<%# Eval("GSTPERCENTAGE") %>' CssClass="form-control" runat="server"></asp:TextBox>
                                                                </td>

                                                                <%--<td class="text-center"> <asp:CheckBox OnCheckedChanged="isActive_CheckedChanged" AutoPostBack="true" ID="isActive" runat="server" /> </td>--%>

                                                                <td>
                                                                    <asp:Button ID="btnUpdate" OnClick="btnUpdate_Click" CommandArgument='<%# Eval("CATEGORYID")%>' CssClass="btn btn-dark btn-sm" runat="server" Text="Update" />
                                                                </td>
                                                            </tr>



                                                            <%--<span style="">CATEGORYID:
            <asp:Label ID="CATEGORYIDLabel" runat="server" Text='<%# Eval("CATEGORYID") %>' />
            <br />
            CATEGORYNAME:
            <asp:Label ID="CATEGORYNAMELabel" runat="server" Text='<%# Eval("CATEGORYNAME") %>' />
            <br />
            GSTPERCENTAGE:
            <asp:Label ID="GSTPERCENTAGELabel" runat="server" Text='<%# Eval("GSTPERCENTAGE") %>' />
            <br />
<br /></span>--%>
                                                        </AlternatingItemTemplate>
                                                        <EditItemTemplate>
                                                            <span style="">CATEGORYID:
            <asp:Label ID="CATEGORYIDLabel1" runat="server" Text='<%# Eval("CATEGORYID") %>' />
                                                                <br />
                                                                CATEGORYNAME:
            <asp:TextBox ID="CATEGORYNAMETextBox" runat="server" Text='<%# Bind("CATEGORYNAME") %>' />
                                                                <br />
                                                                GSTPERCENTAGE:
            <asp:TextBox ID="GSTPERCENTAGETextBox" runat="server" Text='<%# Bind("GSTPERCENTAGE") %>' />
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
                                                            <span style="">CATEGORYNAME:
            <asp:TextBox ID="CATEGORYNAMETextBox" runat="server" Text='<%# Bind("CATEGORYNAME") %>' />
                                                                <br />
                                                                GSTPERCENTAGE:
            <asp:TextBox ID="GSTPERCENTAGETextBox" runat="server" Text='<%# Bind("GSTPERCENTAGE") %>' />
                                                                <br />
                                                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                                                <br />
                                                                <br />
                                                            </span>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>

                                                            <tr>
                                                                <td><%# Eval("CATEGORYID") %> </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtCategoryName" Text='<%# Eval("CATEGORYNAME") %>' CssClass="form-control" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtGstPercentage" Enabled="false" Text='<%# Eval("GSTPERCENTAGE") %>' CssClass="form-control" runat="server"></asp:TextBox>
                                                                </td>

                                                                <%--<td class="text-center"> <asp:CheckBox OnCheckedChanged="isActive_CheckedChanged" AutoPostBack="true" ID="isActive" runat="server" /> </td>--%>

                                                                <td>
                                                                    <asp:Button ID="btnUpdate" OnClick="btnUpdate_Click" CommandArgument='<%# Eval("CATEGORYID")%>' CssClass="btn btn-dark btn-sm" runat="server" Text="Update" />
                                                                </td>
                                                            </tr>

                                                            <%--<span style="">CATEGORYID:
            <asp:Label ID="CATEGORYIDLabel" runat="server" Text='<%# Eval("CATEGORYID") %>' />
            <br />
            CATEGORYNAME:
            <asp:Label ID="CATEGORYNAMELabel" runat="server" Text='<%# Eval("CATEGORYNAME") %>' />
            <br />
            GSTPERCENTAGE:
            <asp:Label ID="GSTPERCENTAGELabel" runat="server" Text='<%# Eval("GSTPERCENTAGE") %>' />
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
                                                            <span style="">CATEGORYID:
            <asp:Label ID="CATEGORYIDLabel" runat="server" Text='<%# Eval("CATEGORYID") %>' />
                                                                <br />
                                                                CATEGORYNAME:
            <asp:Label ID="CATEGORYNAMELabel" runat="server" Text='<%# Eval("CATEGORYNAME") %>' />
                                                                <br />
                                                                GSTPERCENTAGE:
            <asp:Label ID="GSTPERCENTAGELabel" runat="server" Text='<%# Eval("GSTPERCENTAGE") %>' />
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
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</asp:Content>

