<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AnimationText.aspx.cs" Inherits="Admin_AnimationText" %>

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
                            <h5 class="card-title mb-0">Animation Text</h5>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Text</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="ListView1" OnItemDataBound="ListView1_ItemDataBound" runat="server" DataKeyNames="ID">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblIsActive" CssClass="d-none" runat="server" Text='<%# Eval("ISACTIVE") %>'></asp:Label>
                                            <tr>
                                                <td><%# Eval("ID") %> </td>
                                                <td>
                                                    <asp:TextBox ID="txtAnimationText" Text='<%# Eval("ANIMATIONTEXT") %>' CssClass="form-control" runat="server"></asp:TextBox>
                                                </td>

                                                <td class="text-center">
                                                    <asp:CheckBox OnCheckedChanged="isActive_CheckedChanged" AutoPostBack="true" ID="isActive" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnUpdate" OnClick="btnUpdate_Click" CommandArgument='<%# Eval("ID")%>' CssClass="btn btn-dark btn-sm" runat="server" Text="Update" />
                                                </td>
                                            </tr>
                                            <%--<span style="">ID:

                <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel" /><br />
                                                ANIMATIONTEXT:
                <asp:Label Text='<%# Eval("ANIMATIONTEXT") %>' runat="server" ID="ANIMATIONTEXTLabel" /><br />
                                                ISACTIVE:
                <asp:Label Text='<%# Eval("ISACTIVE") %>' runat="server" ID="ISACTIVELabel" /><br />
                                                <br />
                                            </span>--%>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <span style="">ID:
                <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel1" /><br />
                                                ANIMATIONTEXT:
                <asp:TextBox Text='<%# Bind("ANIMATIONTEXT") %>' runat="server" ID="ANIMATIONTEXTTextBox" /><br />
                                                ISACTIVE:
                <asp:TextBox Text='<%# Bind("ISACTIVE") %>' runat="server" ID="ISACTIVETextBox" /><br />
                                                <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /><br />
                                                <br />
                                            </span>
                                        </EditItemTemplate>
                                        <EmptyDataTemplate>
                                            <span>No data was returned.</span>
                                        </EmptyDataTemplate>
                                        <InsertItemTemplate>
                                            <span style="">ID:
                <asp:TextBox Text='<%# Bind("ID") %>' runat="server" ID="IDTextBox" /><br />
                                                ANIMATIONTEXT:
                <asp:TextBox Text='<%# Bind("ANIMATIONTEXT") %>' runat="server" ID="ANIMATIONTEXTTextBox" /><br />
                                                ISACTIVE:
                <asp:TextBox Text='<%# Bind("ISACTIVE") %>' runat="server" ID="ISACTIVETextBox" /><br />
                                                <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
                                                <br />
                                            </span>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblIsActive" CssClass="d-none" runat="server" Text='<%# Eval("ISACTIVE") %>'></asp:Label>
                                            <tr>
                                                <td><%# Eval("ID") %> </td>
                                                <td>
                                                    <asp:TextBox ID="txtAnimationText" Text='<%# Eval("ANIMATIONTEXT") %>' CssClass="form-control" runat="server"></asp:TextBox>
                                                </td>

                                                <td class="text-center">
                                                    <asp:CheckBox OnCheckedChanged="isActive_CheckedChanged" AutoPostBack="true" ID="isActive" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnUpdate" OnClick="btnUpdate_Click" CommandArgument='<%# Eval("ID")%>' CssClass="btn btn-dark btn-sm" runat="server" Text="Update" />
                                                </td>
                                            </tr>
                                            <%--<span style="">ID:
                <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel" /><br />
                                                ANIMATIONTEXT:
                <asp:Label Text='<%# Eval("ANIMATIONTEXT") %>' runat="server" ID="ANIMATIONTEXTLabel" /><br />
                                                ISACTIVE:
                <asp:Label Text='<%# Eval("ISACTIVE") %>' runat="server" ID="ISACTIVELabel" /><br />
                                                <br />
                                            </span>--%>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <div runat="server" id="itemPlaceholderContainer" style=""><span runat="server" id="itemPlaceholder" /></div>
                                            <div style="">
                                            </div>
                                        </LayoutTemplate>
                                        <SelectedItemTemplate>
                                            <span style="">ID:
                <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel" /><br />
                                                ANIMATIONTEXT:
                <asp:Label Text='<%# Eval("ANIMATIONTEXT") %>' runat="server" ID="ANIMATIONTEXTLabel" /><br />
                                                ISACTIVE:
                <asp:Label Text='<%# Eval("ISACTIVE") %>' runat="server" ID="ISACTIVELabel" /><br />
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

</asp:Content>

