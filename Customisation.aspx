<%@ Page Title="Milk And Berries - Customisation" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Customisation.aspx.cs" Inherits="Admin_Customisation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
		.mainDiv{
            margin-top:20px;
            background:#f8f8f8
        }
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    
<div class="mainDiv">
    <div class="container">
        <div class="row flex-lg-nowrap">

          <div class="col">
            <div class="e-tabs mb-3 px-3">
              <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link active" href="#">Panels</a></li>
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
                              <th>Title</th>
                              <th>ON / OFF</th>
                              <th>Edit</th>
                            </tr>
                          </thead>
                          <tbody>
                              
                              <asp:ListView ID="ListView1" OnItemDataBound="ListView1_ItemDataBound" runat="server" DataKeyNames="ID">
        <AlternatingItemTemplate>

        <asp:Label ID="lblIsActive" runat="server" CssClass="d-none" Text='<%# Eval("ISACTIVE") %>'></asp:Label>
        <tr>
            <td class="text-nowrap align-middle"><%# Eval("ID") %></td>
            <td class="text-nowrap align-middle">
                <asp:TextBox ID="txtMainTitle" Text='<%# Eval("MAINTITLE") %>' runat="server"></asp:TextBox>
                <asp:Button ID="btnUpdateTitle" CommandArgument='<%# Eval("ID") %>' OnClick="btnUpdateTitle_Click" Text="Update" runat="server" />
            </td>  
            
            <td class="text-center align-middle d-flex justify-content-center align-items-center">
                <asp:CheckBox ID="isActive" OnCheckedChanged="isActive_CheckedChanged" AutoPostBack="true" type="checkbox" runat="server" />
            </td>
            <td class="text-center align-middle">
                <div class="btn-group align-top">
                    <asp:Button ID="btnEdit" CommandArgument='<%# Eval("ID") %>' OnClick="btnRespond_Click" CssClass="btn btn-dark" runat="server" Text="Edit" />
                </div>
            </td>
            </tr>

            <%--<span style="">ID:
            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            MAINTITLE:
            <asp:Label ID="MAINTITLELabel" runat="server" Text='<%# Eval("MAINTITLE") %>' />
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
            MAINTITLE:
            <asp:TextBox ID="MAINTITLETextBox" runat="server" Text='<%# Bind("MAINTITLE") %>' />
            <br />
            ISACTIVE:
            <asp:TextBox ID="ISACTIVETextBox" runat="server" Text='<%# Bind("ISACTIVE") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">ID:
            <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
            <br />MAINTITLE:
            <asp:TextBox ID="MAINTITLETextBox" runat="server" Text='<%# Bind("MAINTITLE") %>' />
            <br />ISACTIVE:
            <asp:TextBox ID="ISACTIVETextBox" runat="server" Text='<%# Bind("ISACTIVE") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            <br /><br /></span>
        </InsertItemTemplate>
        <ItemTemplate>

            <asp:Label ID="lblIsActive" runat="server" CssClass="d-none" Text='<%# Eval("ISACTIVE") %>'></asp:Label>
        <tr>
            <td class="text-nowrap align-middle"><%# Eval("ID") %></td>
            <td class="text-nowrap align-middle">
                <asp:TextBox ID="txtMainTitle" Text='<%# Eval("MAINTITLE") %>' runat="server"></asp:TextBox>
                <asp:Button ID="btnUpdateTitle" CommandArgument='<%# Eval("ID") %>' OnClick="btnUpdateTitle_Click" Text="Update" runat="server" />
            </td>  
            
            <td class="text-center align-middle d-flex justify-content-center align-items-center">
                <asp:CheckBox ID="isActive" OnCheckedChanged="isActive_CheckedChanged" AutoPostBack="true" type="checkbox" runat="server" />
            </td>
            <td class="text-center align-middle">
                <div class="btn-group align-top">
                    <asp:Button ID="btnEdit" CommandArgument='<%# Eval("ID") %>' OnClick="btnRespond_Click" CssClass="btn btn-dark" runat="server" Text="Edit" />
                </div>
            </td>
            </tr>

            <%--<span style="">ID:
            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            MAINTITLE:
            <asp:Label ID="MAINTITLELabel" runat="server" Text='<%# Eval("MAINTITLE") %>' />
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
            MAINTITLE:
            <asp:Label ID="MAINTITLELabel" runat="server" Text='<%# Eval("MAINTITLE") %>' />
            <br />
            ISACTIVE:
            <asp:Label ID="ISACTIVELabel" runat="server" Text='<%# Eval("ISACTIVE") %>' />
            <br />
<br /></span>
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

