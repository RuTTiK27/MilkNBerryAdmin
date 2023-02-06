﻿<%@ Page Title="Milk And Berries - Customers" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Customers.aspx.cs" Inherits="Admin_customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>       
    .mainDiv{
    background-color: #f8f9fa!important
    }
.p-4 {
    padding: 1.5rem!important;
}
.mb-0, .my-0 {
    margin-bottom: 0!important;
}
.shadow-sm {
    box-shadow: 0 .125rem .25rem rgba(0,0,0,.075)!important;
}    

/* user-dashboard-info-box */
.user-dashboard-info-box .candidates-list .thumb {
    margin-right: 20px;
}
.user-dashboard-info-box .candidates-list .thumb img {
    width: 80px;
    height: 80px;
    -o-object-fit: cover;
    object-fit: cover;
    overflow: hidden;
    border-radius: 50%;
}

.user-dashboard-info-box .title {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    padding: 30px 0;
}

.user-dashboard-info-box .candidates-list td {
    vertical-align: middle;
}

.user-dashboard-info-box td li {
    margin: 0 4px;
}

.user-dashboard-info-box .table thead th {
    border-bottom: none;
}

.table.manage-candidates-top th {
    border: 0;
}

.user-dashboard-info-box .candidate-list-favourite-time .candidate-list-favourite {
    margin-bottom: 10px;
}

.table.manage-candidates-top {
    min-width: 650px;
}

.user-dashboard-info-box .candidate-list-details ul {
    color: #969696;
}

/* Candidate List */
.candidate-list {
    background: #ffffff;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    border-bottom: 1px solid #eeeeee;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    padding: 20px;
    -webkit-transition: all 0.3s ease-in-out;
    transition: all 0.3s ease-in-out;
}
.candidate-list:hover {
    -webkit-box-shadow: 0px 0px 34px 4px rgba(33, 37, 41, 0.06);
    box-shadow: 0px 0px 34px 4px rgba(33, 37, 41, 0.06);
    position: relative;
    z-index: 99;
}
.candidate-list:hover a.candidate-list-favourite {
    color: #e74c3c;
    -webkit-box-shadow: -1px 4px 10px 1px rgba(24, 111, 201, 0.1);
    box-shadow: -1px 4px 10px 1px rgba(24, 111, 201, 0.1);
}

.candidate-list .candidate-list-image {
    margin-right: 25px;
    -webkit-box-flex: 0;
    -ms-flex: 0 0 80px;
    flex: 0 0 80px;
    border: none;
}
.candidate-list .candidate-list-image img {
    width: 80px;
    height: 80px;
    -o-object-fit: cover;
    object-fit: cover;
}

.candidate-list-title {
    margin-bottom: 5px;
}

.candidate-list-details ul {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-bottom: 0px;
}
.candidate-list-details ul li {
    margin: 5px 10px 5px 0px;
    font-size: 13px;
}

.candidate-list .candidate-list-favourite-time {
    margin-left: auto;
    text-align: center;
    font-size: 13px;
    -webkit-box-flex: 0;
    -ms-flex: 0 0 90px;
    flex: 0 0 90px;
}
.candidate-list .candidate-list-favourite-time span {
    display: block;
    margin: 0 auto;
}
.candidate-list .candidate-list-favourite-time .candidate-list-favourite {
    display: inline-block;
    position: relative;
    height: 40px;
    width: 40px;
    line-height: 40px;
    border: 1px solid #eeeeee;
    border-radius: 100%;
    text-align: center;
    -webkit-transition: all 0.3s ease-in-out;
    transition: all 0.3s ease-in-out;
    margin-bottom: 20px;
    font-size: 16px;
    color: #646f79;
}
.candidate-list .candidate-list-favourite-time .candidate-list-favourite:hover {
    background: #ffffff;
    color: #e74c3c;
}

.candidate-banner .candidate-list:hover {
    position: inherit;
    -webkit-box-shadow: inherit;
    box-shadow: inherit;
    z-index: inherit;
}

.bg-white {
    background-color: #ffffff !important;
}
.p-4 {
    padding: 1.5rem!important;
}
.mb-0, .my-0 {
    margin-bottom: 0!important;
}
.shadow-sm {
    box-shadow: 0 .125rem .25rem rgba(0,0,0,.075)!important;
}

.user-dashboard-info-box .candidates-list .thumb {
    margin-right: 20px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<div class="mainDiv">  
    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
<div class="container mt-3 mb-4">
    <div class="row">
        <div class="col-6">
            <div class="form-group mt-2 mb-2">
                        <label>Search by Name:</label>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="txtSearchCustomer" CssClass="form-control" placeholder="Enter customer first name" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearch" OnClick="btnSearch_Click" CssClass="btn btn-outline-secondary" runat="server" Text="Search" />
                        </div>
                      </div>
        </div>
        <div class="col-6">
            <label>Status:</label>
                        <asp:RadioButtonList OnSelectedIndexChanged="rbl_SelectedIndexChanged" ID="rbl" AutoPostBack="true" runat="server">
                            <asp:ListItem Value="All">&nbsp;All</asp:ListItem>
                            <asp:ListItem Value="1">&nbsp;Not Disabled</asp:ListItem>
                            <asp:ListItem Value="0">&nbsp;Disabled</asp:ListItem>
                        </asp:RadioButtonList>
        </div>

        </div>
            
        
<div class="col-lg-9 mt-4 mt-lg-0">
    <div class="row">
      <div class="col-md-12">
        <div class="user-dashboard-info-box table table-striped table-bordered table-responsive mb-0 bg-white p-4 shadow-sm">
          <table class="table table-striped table-bordered manage-candidates-top mb-0">
            <thead>
              <tr>
                <th>Candidate Name</th>
                <th class="text-center">Status</th>
                <th class="action text-right">Balance(₹)</th>
                <th class="action text-right">Action</th>
              </tr>
            </thead>
            <tbody>

                <asp:ListView ID="ListView1" OnItemDataBound="ListView1_ItemDataBound" runat="server" DataKeyNames="EMAIL" >
        <AlternatingItemTemplate>
            <asp:Label ID="lblIsPermanentBan" runat="server" CssClass="d-none" Text='<%# Eval("PERMANENTBAN") %>'></asp:Label>
            <tr class="candidates-list">
                <td class="title">
                    <div class="thumb">
                          &nbsp; <i class="fal fa-user fa-2xl"></i>
                    </div>
                  <div class="candidate-list-details">
                    <div class="candidate-list-info">
                      <div class="candidate-list-title">
                        <h5 class="mb-0"><%# Eval("FIRSTNAME") %> <%# Eval("LASTNAME") %></h5>
                      </div>
                      <div class="candidate-list-option">
                        <ul class="list-unstyled">
                          <li><i class="fa-solid fa-envelope pr-1"></i>  <%# Eval("EMAIL") %></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </td>
                <td class="candidate-list-favourite-time text-center">
                  <span class="candidate-list-time order-1">
                      <asp:CheckBox ID="isPermanentBan" AutoPostBack="true" OnCheckedChanged="isPermanentBan_CheckedChanged" runat="server" />
                  </span>
                </td>
                <td>
                  <span class="candidate-list-time order-1">
                      <%# Eval("BALANCE") %>
                  </span>
                </td>
                <td>
                  <span class="candidate-list-time order-1">
                      <asp:Button ID="btnDelete" OnClick="btnDelete_Click"  CommandArgument='<%# Eval("EMAIL")%>' CssClass="btn btn-dark btn-sm" runat="server" Text="Delete" />
                  </span>
                </td>
              </tr>

            <%--<span style="">EMAIL:
            <asp:Label ID="EMAILLabel" runat="server" Text='<%# Eval("EMAIL") %>' />
            <br />
            FIRSTNAME:
            <asp:Label ID="FIRSTNAMELabel" runat="server" Text='<%# Eval("FIRSTNAME") %>' />
            <br />
            LASTNAME:
            <asp:Label ID="LASTNAMELabel" runat="server" Text='<%# Eval("LASTNAME") %>' />
            <br />
            PERMANENTBAN:
            <asp:Label ID="PERMANENTBANLabel" runat="server" Text='<%# Eval("PERMANENTBAN") %>' />
            <br />
            BALANCE:
            <asp:Label ID="BALANCELabel" runat="server" Text='<%# Eval("BALANCE") %>' />
            <br />
<br /></span>--%>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="">EMAIL:
            <asp:Label ID="EMAILLabel1" runat="server" Text='<%# Eval("EMAIL") %>' />
            <br />
            FIRSTNAME:
            <asp:TextBox ID="FIRSTNAMETextBox" runat="server" Text='<%# Bind("FIRSTNAME") %>' />
            <br />
            LASTNAME:
            <asp:TextBox ID="LASTNAMETextBox" runat="server" Text='<%# Bind("LASTNAME") %>' />
            <br />
            PERMANENTBAN:
            <asp:TextBox ID="PERMANENTBANTextBox" runat="server" Text='<%# Bind("PERMANENTBAN") %>' />
            <br />
            BALANCE:
            <asp:TextBox ID="BALANCETextBox" runat="server" Text='<%# Bind("BALANCE") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">EMAIL:
            <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
            <br />FIRSTNAME:
            <asp:TextBox ID="FIRSTNAMETextBox" runat="server" Text='<%# Bind("FIRSTNAME") %>' />
            <br />LASTNAME:
            <asp:TextBox ID="LASTNAMETextBox" runat="server" Text='<%# Bind("LASTNAME") %>' />
            <br />PERMANENTBAN:
            <asp:TextBox ID="PERMANENTBANTextBox" runat="server" Text='<%# Bind("PERMANENTBAN") %>' />
            <br />BALANCE:
            <asp:TextBox ID="BALANCETextBox" runat="server" Text='<%# Bind("BALANCE") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            <br /><br /></span>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Label ID="lblIsPermanentBan" runat="server" CssClass="d-none" Text='<%# Eval("PERMANENTBAN") %>'></asp:Label>
            <tr class="candidates-list">
                <td class="title">
                    <div class="thumb">
                          &nbsp; <i class="fal fa-user fa-2xl"></i>
                    </div>
                  <div class="candidate-list-details">
                    <div class="candidate-list-info">
                      <div class="candidate-list-title">
                        <h5 class="mb-0"><%# Eval("FIRSTNAME") %> <%# Eval("LASTNAME") %></h5>
                      </div>
                      <div class="candidate-list-option">
                        <ul class="list-unstyled">
                          <li><i class="fa-solid fa-envelope pr-1"></i>  <%# Eval("EMAIL") %></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </td>
                <td class="candidate-list-favourite-time text-center">
                  <span class="candidate-list-time order-1">
                      <asp:CheckBox ID="isPermanentBan" AutoPostBack="true" OnCheckedChanged="isPermanentBan_CheckedChanged" runat="server" />
                  </span>
                </td>
                <td>
                  <span class="candidate-list-time order-1">
                      <%# Eval("BALANCE") %>
                  </span>
                </td>
                <td>
                  <span class="candidate-list-time order-1">
                      <asp:Button ID="btnDelete" OnClick="btnDelete_Click"  CommandArgument='<%# Eval("EMAIL")%>' CssClass="btn btn-dark btn-sm" runat="server" Text="Delete" />
                  </span>
                </td>
              </tr>
            <%--<span style="">EMAIL:
            <asp:Label ID="EMAILLabel" runat="server" Text='<%# Eval("EMAIL") %>' />
            <br />
            FIRSTNAME:
            <asp:Label ID="FIRSTNAMELabel" runat="server" Text='<%# Eval("FIRSTNAME") %>' />
            <br />
            LASTNAME:
            <asp:Label ID="LASTNAMELabel" runat="server" Text='<%# Eval("LASTNAME") %>' />
            <br />
            PERMANENTBAN:
            <asp:Label ID="PERMANENTBANLabel" runat="server" Text='<%# Eval("PERMANENTBAN") %>' />
            <br />
            BALANCE:
            <asp:Label ID="BALANCELabel" runat="server" Text='<%# Eval("BALANCE") %>' />
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
            <span style="">EMAIL:
            <asp:Label ID="EMAILLabel" runat="server" Text='<%# Eval("EMAIL") %>' />
            <br />
            FIRSTNAME:
            <asp:Label ID="FIRSTNAMELabel" runat="server" Text='<%# Eval("FIRSTNAME") %>' />
            <br />
            LASTNAME:
            <asp:Label ID="LASTNAMELabel" runat="server" Text='<%# Eval("LASTNAME") %>' />
            <br />
            PERMANENTBAN:
            <asp:Label ID="PERMANENTBANLabel" runat="server" Text='<%# Eval("PERMANENTBAN") %>' />
            <br />
            BALANCE:
            <asp:Label ID="BALANCELabel" runat="server" Text='<%# Eval("BALANCE") %>' />
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
    
</asp:Content>

