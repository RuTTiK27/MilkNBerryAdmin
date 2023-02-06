<%@ Page Title="Milk And Berries - Messages" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="Admin_Messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .mainDiv {
            margin-top: 20px;
            background: #f8f8f8
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Message</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="alert alert-success" role="alert">
                        <span>Id : </span>
                        <asp:Label ID="lblEmail" CssClass="d-none" runat="server" Text=""></asp:Label>

                        <span>Id : </span>
                        <asp:Label ID="lblId" runat="server" Text=""></asp:Label>
                        <br />
                        <span>Message : </span>
                        <asp:Label CssClass="fw-bold" ID="lblMessages" runat="server" Text=""></asp:Label>
                    </div>
                    <asp:TextBox ID="txtResponse" CssClass="form-control" runat="server" Columns="5" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <asp:Button ID="btnAnswer" CssClass="btn btn-primary" OnClick="btnAnswer_Click" runat="server" Text="Answer It" />
                </div>
            </div>
        </div>
    </div>

    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

    <div class="mainDiv">
        <div class="container">
            <div class="row flex-lg-nowrap">

                <div class="col">
                    <div class="e-tabs mb-3 px-3">
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a class="nav-link active" href="#">Messages</a></li>
                        </ul>
                    </div>

                    <div class="row flex-lg-nowrap">
                        <div class="col mb-3">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <asp:Button ID="deleteAllMessages" CssClass="btn btn-danger" OnClick="deleteAllMessages_Click" runat="server" Text="Delete All" />
                                            <table class="table table-bordered text-center">
                                                <thead>
                                                    <tr>
                                                        <th class="align-top">
                                                            <label class="custom-control-label" for="all-items">#</label>
                                                        </th>
                                                        <th>Name</th>
                                                        <th class="max-width">Email</th>
                                                        <th class="max-width">Phone</th>
                                                        <th>Responded</th>
                                                        <th>Respond</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <asp:ListView OnItemDataBound="ListView1_ItemDataBound" ID="ListView1" runat="server" DataKeyNames="ID">
                                                        <AlternatingItemTemplate>
                                                            <asp:Label ID="lblIsActive" runat="server" CssClass="d-none" Text='<%# Eval("ISACTIVE") %>'></asp:Label>
                                                            <tr>
                                                                <td class="text-nowrap align-middle"><%# Eval("ID") %></td>
                                                                <td class="text-nowrap align-middle"><%# Eval("NAME") %></td>
                                                                <td class="text-nowrap align-middle"><%# Eval("EMAIL") %></td>
                                                                <td class="text-nowrap align-middle"><%# Eval("PHONE") %></td>
                                                                <td class="text-center align-middle d-flex justify-content-center align-items-center">
                                                                    <asp:CheckBox ID="isActive" Enabled="false" AutoPostBack="true" type="checkbox" runat="server" />
                                                                </td>
                                                                <td class="text-center align-middle">
                                                                    <div class="btn-group align-top">
                                                                        <asp:Button ID="btnRespond" CommandArgument='<%# Eval("ID")+","+Eval("MESSAGE")+","+Eval("RESPONSE")+","+Eval("EMAIL")%>' OnClick="btnRespond_Click" CssClass="btn btn-dark" runat="server" Text="Respond" />
                                                                        <asp:Button ID="btnDelete" CommandArgument='<%# Eval("ID")%>' OnClick="btnDelete_Click" CssClass="btn btn-danger" runat="server" Text="Delete" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <%--<span style="">ID:
            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            NAME:
            <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
            <br />
            EMAIL:
            <asp:Label ID="EMAILLabel" runat="server" Text='<%# Eval("EMAIL") %>' />
            <br />
            PHONE:
            <asp:Label ID="PHONELabel" runat="server" Text='<%# Eval("PHONE") %>' />
            <br />
            MESSAGE:
            <asp:Label ID="MESSAGELabel" runat="server" Text='<%# Eval("MESSAGE") %>' />
            <br />
            ISACTIVE:
            <asp:Label ID="ISACTIVELabel" runat="server" Text='<%# Eval("ISACTIVE") %>' />
            <br />
<br /></span>--%>
                                                        </AlternatingItemTemplate>
                                                        <EditItemTemplate>
                                                            <span style="">ID:
            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                                                                <br />
                                                                NAME:
            <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
                                                                <br />
                                                                EMAIL:
            <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                                                                <br />
                                                                PHONE:
            <asp:TextBox ID="PHONETextBox" runat="server" Text='<%# Bind("PHONE") %>' />
                                                                <br />
                                                                MESSAGE:
            <asp:TextBox ID="MESSAGETextBox" runat="server" Text='<%# Bind("MESSAGE") %>' />
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
                                                            <span style="">NAME:
            <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
                                                                <br />
                                                                EMAIL:
            <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                                                                <br />
                                                                PHONE:
            <asp:TextBox ID="PHONETextBox" runat="server" Text='<%# Bind("PHONE") %>' />
                                                                <br />
                                                                MESSAGE:
            <asp:TextBox ID="MESSAGETextBox" runat="server" Text='<%# Bind("MESSAGE") %>' />
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
                                                            <asp:Label ID="lblIsActive" runat="server" CssClass="d-none" Text='<%# Eval("ISACTIVE") %>'></asp:Label>
                                                            <tr>
                                                                <td class="text-nowrap align-middle"><%# Eval("ID") %></td>
                                                                <td class="text-nowrap align-middle"><%# Eval("NAME") %></td>
                                                                <td class="text-nowrap align-middle"><%# Eval("EMAIL") %></td>
                                                                <td class="text-nowrap align-middle"><%# Eval("PHONE") %></td>
                                                                <td class="text-center align-middle d-flex justify-content-center align-items-center">
                                                                    <asp:CheckBox ID="isActive" Enabled="false" AutoPostBack="true" type="checkbox" runat="server" />
                                                                </td>
                                                                <td class="text-center align-middle">
                                                                    <div class="btn-group align-top">
                                                                        <asp:Button ID="btnRespond" CommandArgument='<%# Eval("ID")+","+Eval("MESSAGE")+","+Eval("RESPONSE")+","+Eval("EMAIL")%>' OnClick="btnRespond_Click" CssClass="btn btn-dark" runat="server" Text="Respond" />
                                                                        <asp:Button ID="btnDelete" CommandArgument='<%# Eval("ID")%>' OnClick="btnDelete_Click" CssClass="btn btn-danger" runat="server" Text="Delete" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <%--<span style="">ID:
            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            NAME:
            <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
            <br />
            EMAIL:
            <asp:Label ID="EMAILLabel" runat="server" Text='<%# Eval("EMAIL") %>' />
            <br />
            PHONE:
            <asp:Label ID="PHONELabel" runat="server" Text='<%# Eval("PHONE") %>' />
            <br />
            MESSAGE:
            <asp:Label ID="MESSAGELabel" runat="server" Text='<%# Eval("MESSAGE") %>' />
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
                                                            <span style="">ID:
            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                                                <br />
                                                                NAME:
            <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
                                                                <br />
                                                                EMAIL:
            <asp:Label ID="EMAILLabel" runat="server" Text='<%# Eval("EMAIL") %>' />
                                                                <br />
                                                                PHONE:
            <asp:Label ID="PHONELabel" runat="server" Text='<%# Eval("PHONE") %>' />
                                                                <br />
                                                                MESSAGE:
            <asp:Label ID="MESSAGELabel" runat="server" Text='<%# Eval("MESSAGE") %>' />
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
                            </div>
                        </div>
                        <div class="col-12 col-lg-3 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="">
                                        <label>Status:</label>
                                        <asp:RadioButtonList OnSelectedIndexChanged="rbl_SelectedIndexChanged" ID="rbl" AutoPostBack="true" runat="server">
                                            <asp:ListItem Value="All">&nbsp;All</asp:ListItem>
                                            <asp:ListItem Value="1">&nbsp;Responded</asp:ListItem>
                                            <asp:ListItem Value="0">&nbsp;Not Responded</asp:ListItem>
                                        </asp:RadioButtonList>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
            keyboard: false
        });
        function MyFunction() {
            myModal.show();
        }
    </script>
</asp:Content>

