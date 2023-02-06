<%@ Page Title="Milk And Berries - Products" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Admin_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>       
        .mainDiv{
            margin-top:20px;
            background:#f8f8f8
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="mainDiv"> 
    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    
    <div class="container">
        <div class="row flex-lg-nowrap">

          <div class="col">
            <div class="e-tabs mb-3 px-3">
              <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link active" href="#">Products</a></li>
              </ul>
            </div>

            <div class="row flex-lg-nowrap">
              <div class="col mb-3">
                <div class="e-panel card">
                  <div class="card-body">
                    <div class="card-title">
                      <h6 class="mr-2"><span>All</span><small class="px-1">Products</small></h6>
                    </div>
                    <div class="e-table">
                      <div class="table-responsive table-lg mt-3">
                        <table class="table table-bordered text-center">
                          <thead>
                            <tr>
                              <th class="align-top">
                                  <label class="custom-control-label" for="all-items">#</label>
                              </th>
                              <th>Photo</th>
                              <th class="max-width">Name</th>
                              <th>On/off</th>
                              <th>Actions</th>
                            </tr>
                          </thead>
                          <tbody>
                              
                              <asp:ListView OnItemDataBound="ListView1_ItemDataBound" ID="ListView1" runat="server" DataKeyNames="PRODUCTNO">
        <AlternatingItemTemplate>
            <asp:Label ID="lblIsActive" runat="server" CssClass="d-none" Text='<%# Eval("ISACTIVE") %>'></asp:Label>
                                <tr>
                              <td class="align-middle">
                                  <p class="fw-bold"><%# Eval("PRODUCTNO") %></p>
                              </td>
                              <td class="align-middle text-center">
                                <div class="bg-light d-inline-flex justify-content-center align-items-center align-top" style="width: 35px; height: 35px; border-radius: 3px;">
                                    <img src="../<%# Eval("MAINIMAGEURL") %>" class="img-fluid" width="100" />
                                </div>
                              </td>
                              <td class="text-nowrap align-middle"><%# Eval("NAME") %></td>
                              
                              <td class="text-center d-flex align-items-center" style="justify-content:center;">
                                <asp:CheckBox ID="isActive" AutoPostBack="true" type="checkbox" OnCheckedChanged="isActive_CheckedChanged" runat="server" />
                                    
                              </td>
                                <td class="text-center align-middle">
                                <div class="btn-group align-top">
                                    <asp:Button ID="btnEdit" CssClass="btn btn-dark" OnClick="btnEdit_Click" CommandArgument='<%# Eval("PRODUCTNO") %>' runat="server" Text="Edit" />
                                </div>
                              </td>
                                  </tr>

            <%--<span style="">PRODUCTNO:
            <asp:Label ID="PRODUCTNOLabel" runat="server" Text='<%# Eval("PRODUCTNO") %>' />
            <br />
            NAME:
            <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
            <br />
            ISACTIVE:
            <asp:Label ID="ISACTIVELabel" runat="server" Text='<%# Eval("ISACTIVE") %>' />
            <br />
            MAINIMAGEURL:
            <asp:Label ID="MAINIMAGEURLLabel" runat="server" Text='<%# Eval("MAINIMAGEURL") %>' />
            <br />
            <br /></span>--%>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="">PRODUCTNO:
            <asp:Label ID="PRODUCTNOLabel1" runat="server" Text='<%# Eval("PRODUCTNO") %>' />
            <br />
            NAME:
            <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
            <br />
            ISACTIVE:
            <asp:TextBox ID="ISACTIVETextBox" runat="server" Text='<%# Bind("ISACTIVE") %>' />
            <br />
            MAINIMAGEURL:
            <asp:TextBox ID="MAINIMAGEURLTextBox" runat="server" Text='<%# Bind("MAINIMAGEURL") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">PRODUCTNO:
            <asp:TextBox ID="PRODUCTNOTextBox" runat="server" Text='<%# Bind("PRODUCTNO") %>' />
            <br />NAME:
            <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
            <br />ISACTIVE:
            <asp:TextBox ID="ISACTIVETextBox" runat="server" Text='<%# Bind("ISACTIVE") %>' />
            <br />MAINIMAGEURL:
            <asp:TextBox ID="MAINIMAGEURLTextBox" runat="server" Text='<%# Bind("MAINIMAGEURL") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            <br /><br /></span>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr>
                            <asp:Label ID="lblIsActive" runat="server" CssClass="d-none" Text='<%# Eval("ISACTIVE") %>'></asp:Label>
                              <td class="align-middle">
                                  <p class="fw-bold"><%# Eval("PRODUCTNO") %></p>
                              </td>
                              <td class="align-middle text-center">
                                <div class="bg-light d-inline-flex justify-content-center align-items-center align-top" style="width: 35px; height: 35px; border-radius: 3px;">
                                    <img src="../<%# Eval("MAINIMAGEURL") %>" class="img-fluid" width="100" />
                                </div>
                              </td>
                              <td class="text-nowrap align-middle"><%# Eval("NAME") %></td>
                              
                              <td class="text-center align-middle d-flex justify-content-center align-items-center">
                                <asp:CheckBox ID="isActive" AutoPostBack="true" type="checkbox" OnCheckedChanged="isActive_CheckedChanged" runat="server" />   
                              </td>
                                <td class="text-center align-middle">
                                <div class="btn-group align-top">
                                    <asp:Button ID="btnEdit" OnClick="btnEdit_Click" CommandArgument='<%# Eval("PRODUCTNO") %>' CssClass="btn btn-dark" runat="server" Text="Edit" />
                                </div>
                              </td>
                                  </tr>
            <%--<span style="">PRODUCTNO:
            <asp:Label ID="PRODUCTNOLabel" runat="server" Text='<%# Eval("PRODUCTNO") %>' />
            <br />
            NAME:
            <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
            <br />
            ISACTIVE:
            <asp:Label ID="ISACTIVELabel" runat="server" Text='<%# Eval("ISACTIVE") %>' />
            <br />
            MAINIMAGEURL:
            <asp:Label ID="MAINIMAGEURLLabel" runat="server" Text='<%# Eval("MAINIMAGEURL") %>' />
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
            <span style="">PRODUCTNO:
            <asp:Label ID="PRODUCTNOLabel" runat="server" Text='<%# Eval("PRODUCTNO") %>' />
            <br />
            NAME:
            <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
            <br />
            ISACTIVE:
            <asp:Label ID="ISACTIVELabel" runat="server" Text='<%# Eval("ISACTIVE") %>' />
            <br />
            MAINIMAGEURL:
            <asp:Label ID="MAINIMAGEURLLabel" runat="server" Text='<%# Eval("MAINIMAGEURL") %>' />
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
              <div class="col-12 col-lg-3 mb-3">
                <div class="card">
                  <div class="card-body">
                    <div class="text-center px-xl-3">
                        <asp:Button ID="btnNewProduct" OnClick="btnNewProduct_Click" runat="server" Text="New Product" CssClass="btn btn-primary btn-block" />
                    </div>
                    <hr class="my-3">
                    <div class="e-navlist e-navlist--active-bold">
                      
                        <ul class="list-group">
                          <li class="list-group-item d-flex justify-content-between align-items-center">
                            All
                            <span class="badge bg-primary rounded-pill">
                                <asp:Label ID="lblAllCount" CssClass="fs-6" runat="server" Text="Label"></asp:Label>
                            </span>
                          </li>
                          <li class="list-group-item d-flex justify-content-between align-items-center">
                            Active
                            <span class="badge bg-primary rounded-pill">
                                <asp:Label ID="lblActiveCount" CssClass="fs-6" runat="server" Text="Label"></asp:Label>
                            </span>
                          </li>
                          <li class="list-group-item d-flex justify-content-between align-items-center">
                            Deactive
                            <span class="badge bg-primary rounded-pill">
                                <asp:Label ID="lblDeactiveCount" CssClass="fs-6" runat="server" Text="Label"></asp:Label>
                            </span>
                          </li>
                        </ul>

                    </div>
                    <hr class="my-3">
                    <div>
                      <div class="form-group mt-2 mb-2">
                        <label>Search by Name:</label>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="txtSearchProduct" CssClass="form-control" placeholder="Search product" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearch" OnClick="btnSearch_Click" CssClass="btn btn-outline-secondary" runat="server" Text="Search" />
                        </div>
                      </div>
                    </div>
                    <hr class="my-3">
                    <div class="">
                      <label>Status:</label>
                        <asp:RadioButtonList OnSelectedIndexChanged="rbl_SelectedIndexChanged" ID="rbl" AutoPostBack="true" runat="server">
                            <asp:ListItem Value="All">&nbsp;All</asp:ListItem>
                            <asp:ListItem Value="1">&nbsp;Active</asp:ListItem>
                            <asp:ListItem Value="0">&nbsp;Deactive</asp:ListItem>
                        </asp:RadioButtonList>
                      <%--<div class="px-2">
                        <div class="custom-control custom-radio">
                          <input type="radio" class="custom-control-input" name="user-status" id="users-status-disabled">
                          <label class="custom-control-label" for="users-status-disabled">Disabled</label>
                        </div>
                      </div>
                      <div class="px-2">
                        <div class="custom-control custom-radio">
                          <input type="radio" class="custom-control-input" name="user-status" id="users-status-active">
                          <label class="custom-control-label" for="users-status-active">Active</label>
                        </div>
                      </div>
                      <div class="px-2">
                        <div class="custom-control custom-radio">
                          <input type="radio" class="custom-control-input" name="user-status" id="users-status-any" checked="">
                          <label class="custom-control-label" for="users-status-any">Any</label>
                        </div>
                      </div>--%>
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

