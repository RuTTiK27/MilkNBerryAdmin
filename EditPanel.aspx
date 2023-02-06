<%@ Page Title="Milk And Berries - Edit Panel" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditPanel.aspx.cs" Inherits="Admin_EditPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /*body{
    background: #edf1f5;
    margin-top:20px;
    }*/
    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 0 solid transparent;
        border-radius: 0;
    }
    /*.btn-circle.btn-lg, .btn-group-lg>.btn-circle.btn {
        width: 50px;
        height: 50px;
        padding: 14px 15px;
        font-size: 18px;
        line-height: 23px;
    }*/
    .text-muted {
        color: #8898aa!important;
    }
    /*[type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled), button:not(:disabled) {
        cursor: pointer;
    }
    .btn-circle {
        border-radius: 100%;
        width: 40px;
        height: 40px;
        padding: 10px;
    }*/
    .user-table tbody tr .category-select {
        max-width: 150px;
        border-radius: 20px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <asp:Label ID="lblMsg" runat="server"></asp:Label>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title text-uppercase mb-0">Panel</h5>
                </div>
                <div class="table-responsive">
                    <table class="table no-wrap user-table mb-0" style="width:100%;">
                      <%--<thead>
                        <tr>
                          <th scope="col" class="border-0 text-uppercase font-medium pl-4">#</th>
                          <th scope="col" class="border-0 text-uppercase font-medium">Title</th>
                          <th scope="col" class="border-0 text-uppercase font-medium">Sub title</th>
                          <th scope="col" class="border-0 text-uppercase font-medium">Button Text</th>
                          <th scope="col" class="border-0 text-uppercase font-medium">Button Link</th>
                          <th scope="col" class="border-0 text-uppercase font-medium">Edit</th>
                          <th scope="col" class="border-0 text-uppercase font-medium">Image</th>
                        </tr>
                      </thead>--%>
                      <tbody>
                            
                          <asp:ListView ID="ListView1" runat="server" OnItemDataBound="ListView1_ItemDataBound" DataKeyNames="ID">
                                <AlternatingItemTemplate>

                                    <div class="container-fluid">
                                        <div class="row mt-3 mb-3 p-1 border border-dark rounded">
	                                        <div class="col-10">
                                                <asp:Label ID="lblPanelId" CssClass="mt-5" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                <br />
                                                <div class="mb-3">
                                                    <label for="txtTitle" class="form-label">Title</label>
                                                    <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" Text='<%# Eval("TITLE") %>'></asp:TextBox>
                                                </div>
                                                
                                                <div class="mb-3">
                                                    <label for="txtSubTitle" class="form-label">Sub title</label>
                                                    <asp:TextBox ID="txtSubTitle" CssClass="form-control" runat="server" Text='<%# Eval("SUBTITLE") %>'></asp:TextBox>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="txtButtonText" class="form-label">Button Text</label>
                                                    <asp:TextBox ID="txtButtonText" CssClass="form-control" runat="server" Text='<%# Eval("BUTTONTEXT") %>'></asp:TextBox>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="txtButtonText" class="form-label">Button Link</label>
                                                    <asp:TextBox ID="txtButtonLink" CssClass="form-control" runat="server" Text='<%# Eval("BUTTONLINK") %>'></asp:TextBox>
                                                </div>
                                                
                                                <asp:Button ID="btnUpdate" OnClick="btnUpdate_Click" CssClass="btn btn-dark mt-2" runat="server" Text="Update" />

                                                <asp:FileUpload ID="FileUpload1"  runat="server" />
                                                <asp:Button ID="btnUpload" OnClick="btnUpload_Click" CssClass="btn btn-primary" runat="server" Text="Upload Image" />
	                                        </div>

	                                        <div class="col-2">
                                                <asp:Image ID="img" runat="server" AlternateText='<%# Eval("IMAGELINK") %>' />
	                                        </div>
                                        </div>
                                    </div>
                                    
                                    

                                    <%--<span style="">ID:
                                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    <br />
                                    TITLE:
                                    <asp:Label ID="TITLELabel" runat="server" Text='<%# Eval("TITLE") %>' />
                                    <br />
                                    SUBTITLE:
                                    <asp:Label ID="SUBTITLELabel" runat="server" Text='<%# Eval("SUBTITLE") %>' />
                                    <br />
                                    BUTTONTEXT:
                                    <asp:Label ID="BUTTONTEXTLabel" runat="server" Text='<%# Eval("BUTTONTEXT") %>' />
                                    <br />
                                    BUTTONLINK:
                                    <asp:Label ID="BUTTONLINKLabel" runat="server" Text='<%# Eval("BUTTONLINK") %>' />
                                    <br />
                                    IMAGELINK:
                                    <asp:Label ID="IMAGELINKLabel" runat="server" Text='<%# Eval("IMAGELINK") %>' />
                                    <br />
                        <br /></span>--%>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <span style="">ID:
                                    <asp:Label ID="lblPanelId" runat="server" Text='<%# Eval("ID") %>' />
                                    <br />
                                    TITLE:
                                    <asp:TextBox ID="TITLETextBox" runat="server" Text='<%# Bind("TITLE") %>' />
                                    <br />
                                    SUBTITLE:
                                    <asp:TextBox ID="SUBTITLETextBox" runat="server" Text='<%# Bind("SUBTITLE") %>' />
                                    <br />
                                    BUTTONTEXT:
                                    <asp:TextBox ID="BUTTONTEXTTextBox" runat="server" Text='<%# Bind("BUTTONTEXT") %>' />
                                    <br />
                                    BUTTONLINK:
                                    <asp:TextBox ID="BUTTONLINKTextBox" runat="server" Text='<%# Bind("BUTTONLINK") %>' />
                                    <br />
                                    IMAGELINK:
                                    <asp:TextBox ID="IMAGELINKTextBox" runat="server" Text='<%# Bind("IMAGELINK") %>' />
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
                                    <br />TITLE:
                                    <asp:TextBox ID="TITLETextBox" runat="server" Text='<%# Bind("TITLE") %>' />
                                    <br />SUBTITLE:
                                    <asp:TextBox ID="SUBTITLETextBox" runat="server" Text='<%# Bind("SUBTITLE") %>' />
                                    <br />BUTTONTEXT:
                                    <asp:TextBox ID="BUTTONTEXTTextBox" runat="server" Text='<%# Bind("BUTTONTEXT") %>' />
                                    <br />BUTTONLINK:
                                    <asp:TextBox ID="BUTTONLINKTextBox" runat="server" Text='<%# Bind("BUTTONLINK") %>' />
                                    <br />IMAGELINK:
                                    <asp:TextBox ID="IMAGELINKTextBox" runat="server" Text='<%# Bind("IMAGELINK") %>' />
                                    <br />
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                    <br /><br /></span>
                                </InsertItemTemplate>
                                <ItemTemplate>

                                    <div class="container-fluid">
                                        <div class="row mt-3 mb-3 p-1 border border-dark rounded">
	                                        <div class="col-10">
                                                <asp:Label ID="lblPanelId" CssClass="mt-5" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                <br />
                                                <div class="mb-3">
                                                    <label for="txtTitle" class="form-label">Title</label>
                                                    <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" Text='<%# Eval("TITLE") %>'></asp:TextBox>
                                                </div>
                                                
                                                <div class="mb-3">
                                                    <label for="txtSubTitle" class="form-label">Sub title</label>
                                                    <asp:TextBox ID="txtSubTitle" CssClass="form-control" runat="server" Text='<%# Eval("SUBTITLE") %>'></asp:TextBox>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="txtButtonText" class="form-label">Button Text</label>
                                                    <asp:TextBox ID="txtButtonText" CssClass="form-control" runat="server" Text='<%# Eval("BUTTONTEXT") %>'></asp:TextBox>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="txtButtonText" class="form-label">Button Link</label>
                                                    <asp:TextBox ID="txtButtonLink" CssClass="form-control" runat="server" Text='<%# Eval("BUTTONLINK") %>'></asp:TextBox>
                                                </div>
                                                
                                                <asp:Button ID="btnUpdate" OnClick="btnUpdate_Click" CssClass="btn btn-dark mt-2" runat="server" Text="Update" />

                                                <asp:FileUpload ID="FileUpload1"  runat="server" />
                                                <asp:Button ID="btnUpload" OnClick="btnUpload_Click" CssClass="btn btn-primary" runat="server" Text="Upload Image" />
	                                        </div>

	                                        <div class="col-2">
                                                <asp:Image ID="img" runat="server" AlternateText='<%# Eval("IMAGELINK") %>' />
	                                        </div>
                                        </div>
                                    </div>

                                    <%--<span style="">ID:
                                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    <br />
                                    TITLE:
                                    <asp:Label ID="TITLELabel" runat="server" Text='<%# Eval("TITLE") %>' />
                                    <br />
                                    SUBTITLE:
                                    <asp:Label ID="SUBTITLELabel" runat="server" Text='<%# Eval("SUBTITLE") %>' />
                                    <br />
                                    BUTTONTEXT:
                                    <asp:Label ID="BUTTONTEXTLabel" runat="server" Text='<%# Eval("BUTTONTEXT") %>' />
                                    <br />
                                    BUTTONLINK:
                                    <asp:Label ID="BUTTONLINKLabel" runat="server" Text='<%# Eval("BUTTONLINK") %>' />
                                    <br />
                                    IMAGELINK:
                                    <asp:Label ID="IMAGELINKLabel" runat="server" Text='<%# Eval("IMAGELINK") %>' />
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
                                    TITLE:
                                    <asp:Label ID="TITLELabel" runat="server" Text='<%# Eval("TITLE") %>' />
                                    <br />
                                    SUBTITLE:
                                    <asp:Label ID="SUBTITLELabel" runat="server" Text='<%# Eval("SUBTITLE") %>' />
                                    <br />
                                    BUTTONTEXT:
                                    <asp:Label ID="BUTTONTEXTLabel" runat="server" Text='<%# Eval("BUTTONTEXT") %>' />
                                    <br />
                                    BUTTONLINK:
                                    <asp:Label ID="BUTTONLINKLabel" runat="server" Text='<%# Eval("BUTTONLINK") %>' />
                                    <br />
                                    IMAGELINK:
                                    <asp:Label ID="IMAGELINKLabel" runat="server" Text='<%# Eval("IMAGELINK") %>' />
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
</asp:Content>

