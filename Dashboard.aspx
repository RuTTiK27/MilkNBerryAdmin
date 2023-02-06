<%@ Page Title="Milk And Berries - Dashboard" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            margin-top: 20px;
            background: #FAFAFA;
        }

        .order-card {
            color: #fff;
        }

        .bg-c-blue {
            background: linear-gradient(45deg,#4099ff,#73b4ff);
        }

        .bg-c-green {
            background: linear-gradient(45deg,#2ed8b6,#59e0c5);
        }

        .bg-c-yellow {
            background: linear-gradient(45deg,#FFB64D,#ffcb80);
        }

        .bg-c-pink {
            background: linear-gradient(45deg,#FF5370,#ff869a);
        }


        .card {
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
            box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
            border: none;
            margin-bottom: 30px;
            -webkit-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }

            .card .card-block {
                padding: 25px;
            }

        .order-card i {
            font-size: 26px;
        }

        .f-left {
            float: left;
        }

        .f-right {
            float: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Users</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex justify-content-center">
                    <asp:GridView CssClass="table table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="CUSTOMEREMAIL" HeaderText="CUSTOMEREMAIL" SortExpression="CUSTOMEREMAIL"></asp:BoundField>
                            <asp:BoundField DataField="PRODUCTNO" HeaderText="PRODUCTNO" SortExpression="PRODUCTNO"></asp:BoundField>
                            <asp:BoundField DataField="PRICE" HeaderText="PRICE" SortExpression="PRICE"></asp:BoundField>
                            <asp:BoundField DataField="QTY" HeaderText="QTY" SortExpression="QTY"></asp:BoundField>
                            <asp:BoundField DataField="SUBTOTAL" HeaderText="SUBTOTAL" SortExpression="SUBTOTAL"></asp:BoundField>
                            <asp:BoundField DataField="TOTALDISCOUNT" HeaderText="TOTALDISCOUNT" SortExpression="TOTALDISCOUNT"></asp:BoundField>
                            <asp:BoundField DataField="TOTALMRP" HeaderText="TOTALMRP" SortExpression="TOTALMRP"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select CUSTOMEREMAIL,PRODUCTNO,PRICE,QTY,SUBTOTAL,TOTALDISCOUNT,TOTALMRP from cart;"></asp:SqlDataSource>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Dashboard</h1>
    </div>

    <div class="row">
        <div class="col-lg-3 col-sm-6">
            <div class="card bg-c-blue order-card">
                <div class="card-block">
                    <h6 class="mb-2">Visited people</h6>
                    <h2 class="text-right">
                        <i class="fa fa-cart-plus"></i>
                        <asp:Label ID="lblVisitedPeople" Text="0" runat="server" />
                    </h2>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6">
            <div class="card bg-c-green order-card">
                <div class="card-block">
                    <h6 class="mb-2">Added to cart people</h6>
                    <h2 class="text-right"><i class="fa fa-rocket"></i>
                        <span>
                            <asp:Label ID="lblAddedToCart" Text="0" runat="server" />
                        </span>
                        <span>
                            <asp:Button ID="btnAtcPeople" OnClick="btnAtcPeople_Click" CssClass="btn btn-light" runat="server" Text="View" />
                        </span>
                    </h2>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6">
            <div class="card bg-c-yellow order-card">
                <div class="card-block">
                    <h6 class="mb-2">Total Number of registered users</h6>
                    <h2 class="text-right"><i class="fa fa-refresh"></i>
                        <span>
                            <asp:Label ID="lblRegisteredUseres" Text="0" runat="server" />
                        </span>
                    </h2>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6">
            <div class="card bg-c-pink order-card">
                <div class="card-block">
                    <h6 class="mb-2">Total Number of Products</h6>
                    <h2 class="text-right"><i class="fa fa-credit-card"></i>
                        <span>
                            <asp:Label ID="lblTotalProducts" Text="0" runat="server" />
                        </span>
                    </h2>
                </div>
            </div>
        </div>


        <div class="col-lg-3 col-sm-6">
            <div class="card bg-c-blue order-card">
                <div class="card-block">
                    <h6 class="mb-2">Active Promocodes</h6>
                    <h2 class="text-right"><i class="fa fa-cart-plus"></i>
                        <span>
                            <asp:Label ID="lblActivePromocode" Text="0" runat="server" />
                        </span></h2>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6">
            <div class="card bg-c-green order-card">
                <div class="card-block">
                    <h6 class="mb-2">Active Cashbackcodes</h6>
                    <h2 class="text-right"><i class="fa fa-rocket"></i>
                        <span>
                            <asp:Label ID="lblActiveCashbackCodes" Text="0" runat="server" /></span>
                    </h2>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6">
            <div class="card bg-c-yellow order-card">
                <div class="card-block">
                    <h6 class="mb-2">completed oreders</h6>
                    <h2 class="text-right"><i class="fa fa-refresh"></i>
                        <span>
                            <asp:Label ID="lblCompletedOrders" Text="0" runat="server" /></span>
                    </h2>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6">
            <div class="card bg-c-pink order-card">
                <div class="card-block">
                    <h6 class="mb-2">Pending orders</h6>
                    <h2 class="text-right"><i class="fa fa-credit-card"></i>
                        <span>
                            <asp:Label ID="lblPendingOrders" Text="0" runat="server" /></span>
                    </h2>
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


