<%@ Page Title="Milk And Berries - Orders" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Admin_Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .content {
            margin: 0;
            padding: 20px 30px 66px;
            position: relative;
            background: #F1F4F5;
            -webkit-transition: margin, .4s;
            transition: margin, .4s;
        }

        .email-container, .contacts-search, .projects-search {
            position: relative;
        }

        .inbox-head, .contacts-search, .projects-search {
            min-height: 80px;
            padding: 20px 0;
        }

            .email-container .search-input, .contacts-search .search-input, .projects-search .search-input {
                width: -webkit-calc(100% - 60px);
                width: calc(100% - 60px);
            }

            .inbox-head .search-input, .contacts-search .search-input, .projects-search .search-input {
                border: 1px solid #E7EBEC;
                -webkit-border-radius: 3px 0 0 3px;
                border-radius: 3px 0 0 3px;
                -webkit-box-shadow: none;
                box-shadow: none;
                color: #8a8a8a;
                float: left;
                height: 40px;
                padding: 0 10px;
            }

            .email-container .search-btn, .contacts-search .search-btn, .projects-search .search-btn {
                width: 60px;
            }

            .inbox-head .search-btn, .contacts-search .search-btn, .projects-search .search-btn {
                background: #63A8EB;
                border: none;
                -webkit-border-radius: 0 3px 3px 0;
                border-radius: 0 3px 3px 0;
                color: #fff;
                height: 40px;
                padding: 0 20px;
                -webkit-box-shadow: none;
                box-shadow: none;
            }

        .project-wrapper {
            background: transparent !important;
        }

        .content-box {
            position: relative;
            background: #fff;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            margin-bottom: 30px;
            overflow: hidden;
            -webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.05);
            box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.05);
        }

        .project-item {
            margin-bottom: 12px;
            display: inline-block;
            width: 100%;
            position: relative;
        }

            .project-item .status-desktop, .project-item .status-mobile {
                margin-top: 20px;
                font-weight: 400;
                width: 100px;
            }

        .project-box {
            -webkit-border-radius: 3px;
            border-radius: 3px;
            padding: 10px;
            width: -webkit-calc(100% - 100px);
            width: calc(100% - 100px);
        }

        .white-bg {
            background: #fff !important;
        }

        .project-item .status-desktop .active:before, .project-item .status-mobile .active:before {
            background: #42b382;
        }

        .project-item .status-desktop span:before, .project-item .status-mobile span:before {
            content: "";
            display: inline-block;
            width: 15px;
            height: 15px;
            -webkit-border-radius: 50%;
            border-radius: 50%;
            margin-right: 8px;
            vertical-align: middle;
        }

        .project-item .status-desktop .unactive:before, .project-item .status-mobile .unactive:before {
            background: #E9585B;
        }

        .project-item .status-mobile {
            position: absolute;
            top: -5px;
            left: 10px;
            display: none;
            background: #fff;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            color: #76828E;
            padding: 5px;
        }

        .project-item .status-desktop, .project-item .status-mobile {
            margin-top: 20px;
            font-weight: 400;
            width: 100px;
        }

        .project-box .mobile-tools {
            display: none;
        }

        .project-box .project-tools {
            margin-top: 5px;
        }

        .project-box > div {
            width: 25%;
        }

        .project-box .project-tools a {
            font-size: 20px;
            margin-right: 12px;
            color: #76828E;
        }

        .project-box .project-progress {
            margin-top: 4px;
        }

        .project-box > div {
            width: 25%;
        }

        .project-box .project-progress .progress {
            -webkit-border-radius: 3px;
            border-radius: 3px;
            margin-bottom: 0;
        }

        .project-box .project-tools {
            margin-top: 5px;
        }

            .project-box .project-tools a {
                font-size: 20px;
                margin-right: 12px;
                color: #76828E;
            }

        .resp-avatars img {
            width: 40px;
            height: 40px;
        }

        .ib:hover {
            background-color: #adb5bd;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <div class="container">
        <div id="content" class="content" style="min-height: 682px;">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            <div class="row">
                <div class="col-lg-12">
                    <div class="page-header">
                        <h2>Orders</h2>
                    </div>
                </div>
            </div>

            <div class="projects-search">
                <input type="text" class="search-input" placeholder="Search order">
                <button class="btn search-btn waves waves-effect waves-float" type="button"><i class="fa fa-search"></i></button>
            </div>
            <div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="content-box project-wrapper">

                        <asp:ListView ID="ListView1" OnItemDataBound="ListView1_ItemDataBound" runat="server" DataKeyNames="ORDERID">
                            <AlternatingItemTemplate>
                                <div class="project-item">
                                    <asp:Label ID="lblIsSeen" runat="server" CssClass="d-none" Text='<%# Eval("ISSEEN") %>'></asp:Label>
                                    <asp:Label ID="lblOrderStatus" runat="server" CssClass="d-none" Text='<%# Eval("ORDERSTATUS") %>'></asp:Label>

                                    <div class="status-desktop pull-left">
                                        <asp:Label ID="colorIsseen" runat="server" Text="Seen"></asp:Label>
                                        <asp:Label ID="colorIsNotSeen" runat="server" Text="Not seen"></asp:Label>

                                        <%--<span class="active">Seen</span>
                  <span class="unactive">Not seen</span>--%>
                                    </div>

                                    <div class="project-box white-bg pull-left">

                                        <div class="project-tools mobile-tools text-right pull-left">
                                            <a href="#"><i class="fa fa-eye"></i></a>
                                            <a href="#"><i class="fa fa-pencil"></i></a>
                                            <a href="#"><i class="fa fa-close"></i></a>
                                        </div>

                                        <div class="project-name pull-left">
                                            <div class="name"><%# Eval("ORDERID") %></div>
                                            <div class="created">Created : <span><%# Eval("ORDERDATE") %> </span></div>
                                            <div class="created">Delivery : <span><%# Eval("DELIVERYDATE") %> </span></div>
                                        </div>
                                        <div class="project-progress pull-left">
                                            <div class="">
                                                <div class="fw-bold"><%# Eval("FIRSTNAME") %> <%# Eval("LASTNAME") %></div>
                                            </div>
                                            <span class="task-title"><%# Eval("CUSTOMEREMAIL") %> </span>

                                        </div>

                                        <div class="pull-left text-center">
                                            <div class="resp-avatars">
                                                <asp:Label ID="lblOrderStatusText" runat="server" Text="Label"></asp:Label>
                                                <%--<span>Order Status</span>--%>
                                            </div>
                                        </div>
                                        <div class="project-tools desktop-tools text-right pull-left">
                                            <asp:ImageButton ID="ibtnProcessed" CommandArgument='<%# Eval("ORDERID") %>' OnClick="ibtnProcessed_Click" Width="15%" ImageUrl="https://i.imgur.com/9nnc9Et.png" runat="server" />
                                            <asp:ImageButton ID="ibtnShipped" CommandArgument='<%# Eval("ORDERID") %>' OnClick="ibtnShipped_Click" Width="15%" ImageUrl="https://i.imgur.com/u1AzR7w.png" runat="server" />
                                            <asp:ImageButton ID="ibtnEnRoute" CommandArgument='<%# Eval("ORDERID") %>' OnClick="ibtnEnRoute_Click" Width="15%" ImageUrl="https://i.imgur.com/TkPm63y.png" runat="server" />
                                            <asp:ImageButton ID="ibtnArrived" CommandArgument='<%# Eval("ORDERID") %>' OnClick="ibtnArrived_Click" Width="15%" ImageUrl="https://i.imgur.com/HdsziHP.png" runat="server" />

                                            <asp:Button ID="btnView" OnClick="btnView_Click" CommandArgument='<%# Eval("ORDERID") %>' CssClass="btn btn-dark float-end" runat="server" Text="View" />
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                </div>

                                <%--<span style="">ORDERID:
                      <asp:Label ID="ORDERIDLabel" runat="server" Text='<%# Eval("ORDERID") %>' />
                      <br />
                      ORDERDATE:
                      <asp:Label ID="ORDERDATELabel" runat="server" Text='<%# Eval("ORDERDATE") %>' />
                      <br />
                      DELIVERYDATE:
                      <asp:Label ID="DELIVERYDATELabel" runat="server" Text='<%# Eval("DELIVERYDATE") %>' />
                      <br />
                      ORDERSTATUS:
                      <asp:Label ID="ORDERSTATUSLabel" runat="server" Text='<%# Eval("ORDERSTATUS") %>' />
                      <br />
                      CUSTOMEREMAIL:
                      <asp:Label ID="CUSTOMEREMAILLabel" runat="server" Text='<%# Eval("CUSTOMEREMAIL") %>' />
                      <br />
                      ISSEEN:
                      <asp:Label ID="ISSEENLabel" runat="server" Text='<%# Eval("ISSEEN") %>' />
                      <br />
<br /></span>--%>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <span style="">ORDERID:
                      <asp:Label ID="ORDERIDLabel1" runat="server" Text='<%# Eval("ORDERID") %>' />
                                    <br />
                                    ORDERDATE:
                      <asp:TextBox ID="ORDERDATETextBox" runat="server" Text='<%# Bind("ORDERDATE") %>' />
                                    <br />
                                    DELIVERYDATE:
                      <asp:TextBox ID="DELIVERYDATETextBox" runat="server" Text='<%# Bind("DELIVERYDATE") %>' />
                                    <br />
                                    ORDERSTATUS:
                      <asp:TextBox ID="ORDERSTATUSTextBox" runat="server" Text='<%# Bind("ORDERSTATUS") %>' />
                                    <br />
                                    CUSTOMEREMAIL:
                      <asp:TextBox ID="CUSTOMEREMAILTextBox" runat="server" Text='<%# Bind("CUSTOMEREMAIL") %>' />
                                    <br />
                                    ISSEEN:
                      <asp:TextBox ID="ISSEENTextBox" runat="server" Text='<%# Bind("ISSEEN") %>' />
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
                                <span style="">ORDERID:
                      <asp:TextBox ID="ORDERIDTextBox" runat="server" Text='<%# Bind("ORDERID") %>' />
                                    <br />
                                    ORDERDATE:
                      <asp:TextBox ID="ORDERDATETextBox" runat="server" Text='<%# Bind("ORDERDATE") %>' />
                                    <br />
                                    DELIVERYDATE:
                      <asp:TextBox ID="DELIVERYDATETextBox" runat="server" Text='<%# Bind("DELIVERYDATE") %>' />
                                    <br />
                                    ORDERSTATUS:
                      <asp:TextBox ID="ORDERSTATUSTextBox" runat="server" Text='<%# Bind("ORDERSTATUS") %>' />
                                    <br />
                                    CUSTOMEREMAIL:
                      <asp:TextBox ID="CUSTOMEREMAILTextBox" runat="server" Text='<%# Bind("CUSTOMEREMAIL") %>' />
                                    <br />
                                    ISSEEN:
                      <asp:TextBox ID="ISSEENTextBox" runat="server" Text='<%# Bind("ISSEEN") %>' />
                                    <br />
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                    <br />
                                    <br />
                                </span>
                            </InsertItemTemplate>
                            <ItemTemplate>

                                <div class="project-item">
                                    <asp:Label ID="lblIsSeen" runat="server" CssClass="d-none" Text='<%# Eval("ISSEEN") %>'></asp:Label>
                                    <asp:Label ID="lblOrderStatus" runat="server" CssClass="d-none" Text='<%# Eval("ORDERSTATUS") %>'></asp:Label>

                                    <div class="status-desktop pull-left">
                                        <asp:Label ID="colorIsseen" runat="server" Text="Seen"></asp:Label>
                                        <asp:Label ID="colorIsNotSeen" runat="server" Text="Not seen"></asp:Label>

                                        <%--<span class="active">Seen</span>
                  <span class="unactive">Not seen</span>--%>
                                    </div>

                                    <div class="project-box white-bg pull-left">

                                        <div class="project-tools mobile-tools text-right pull-left">
                                            <a href="#"><i class="fa fa-eye"></i></a>
                                            <a href="#"><i class="fa fa-pencil"></i></a>
                                            <a href="#"><i class="fa fa-close"></i></a>
                                        </div>

                                        <div class="project-name pull-left">
                                            <div class="name"><%# Eval("ORDERID") %></div>
                                            <div class="created">Created : <span><%# Eval("ORDERDATE") %> </span></div>
                                            <div class="created">Delivery : <span><%# Eval("DELIVERYDATE") %> </span></div>
                                        </div>
                                        <div class="project-progress pull-left">
                                            <div class="">
                                                <div class="fw-bold"><%# Eval("FIRSTNAME") %> <%# Eval("LASTNAME") %></div>
                                            </div>
                                            <span class="task-title"><%# Eval("CUSTOMEREMAIL") %> </span>

                                        </div>

                                        <div class="pull-left text-center">
                                            <div class="resp-avatars">
                                                <asp:Label ID="lblOrderStatusText" runat="server" Text="Label"></asp:Label>
                                                <%--<span>Order Status</span>--%>
                                            </div>
                                        </div>
                                        <div class="project-tools desktop-tools text-right pull-left">
                                            <asp:ImageButton ID="ibtnProcessed" CommandArgument='<%# Eval("ORDERID") %>' OnClick="ibtnProcessed_Click" Width="15%" ImageUrl="https://i.imgur.com/9nnc9Et.png" runat="server" />
                                            <asp:ImageButton ID="ibtnShipped" CommandArgument='<%# Eval("ORDERID") %>' OnClick="ibtnShipped_Click" Width="15%" ImageUrl="https://i.imgur.com/u1AzR7w.png" runat="server" />
                                            <asp:ImageButton ID="ibtnEnRoute" CommandArgument='<%# Eval("ORDERID") %>' OnClick="ibtnEnRoute_Click" Width="15%" ImageUrl="https://i.imgur.com/TkPm63y.png" runat="server" />
                                            <asp:ImageButton ID="ibtnArrived" CommandArgument='<%# Eval("ORDERID") %>' OnClick="ibtnArrived_Click" Width="15%" ImageUrl="https://i.imgur.com/HdsziHP.png" runat="server" />

                                            <asp:Button ID="btnView" OnClick="btnView_Click" CommandArgument='<%# Eval("ORDERID") %>' CssClass="btn btn-dark float-end" runat="server" Text="View" />
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                </div>

                                <%--<span style="">ORDERID:
                      <asp:Label ID="ORDERIDLabel" runat="server" Text='<%# Eval("ORDERID") %>' />
                      <br />
                      ORDERDATE:
                      <asp:Label ID="ORDERDATELabel" runat="server" Text='<%# Eval("ORDERDATE") %>' />
                      <br />
                      DELIVERYDATE:
                      <asp:Label ID="DELIVERYDATELabel" runat="server" Text='<%# Eval("DELIVERYDATE") %>' />
                      <br />
                      ORDERSTATUS:
                      <asp:Label ID="ORDERSTATUSLabel" runat="server" Text='<%# Eval("ORDERSTATUS") %>' />
                      <br />
                      CUSTOMEREMAIL:
                      <asp:Label ID="CUSTOMEREMAILLabel" runat="server" Text='<%# Eval("CUSTOMEREMAIL") %>' />
                      <br />
                      ISSEEN:
                      <asp:Label ID="ISSEENLabel" runat="server" Text='<%# Eval("ISSEEN") %>' />
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
                                <span style="">ORDERID:
                      <asp:Label ID="ORDERIDLabel" runat="server" Text='<%# Eval("ORDERID") %>' />
                                    <br />
                                    ORDERDATE:
                      <asp:Label ID="ORDERDATELabel" runat="server" Text='<%# Eval("ORDERDATE") %>' />
                                    <br />
                                    DELIVERYDATE:
                      <asp:Label ID="DELIVERYDATELabel" runat="server" Text='<%# Eval("DELIVERYDATE") %>' />
                                    <br />
                                    ORDERSTATUS:
                      <asp:Label ID="ORDERSTATUSLabel" runat="server" Text='<%# Eval("ORDERSTATUS") %>' />
                                    <br />
                                    CUSTOMEREMAIL:
                      <asp:Label ID="CUSTOMEREMAILLabel" runat="server" Text='<%# Eval("CUSTOMEREMAIL") %>' />
                                    <br />
                                    ISSEEN:
                      <asp:Label ID="ISSEENLabel" runat="server" Text='<%# Eval("ISSEEN") %>' />
                                    <br />
                                    <br />
                                </span>
                            </SelectedItemTemplate>
                        </asp:ListView>

                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>

