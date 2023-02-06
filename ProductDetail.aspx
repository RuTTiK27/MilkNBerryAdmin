<%@ Page Title="Milk And Berries - Product Detail" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="Admin_productDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .mainDiv {
            color: #1f1f1f;
            background-color: #FFF;
        }

        .avatar-xl .avatar-img {
            width: 100%;
        }

        .rounded-circle {
            border-radius: 50% !important;
        }

        img {
            vertical-align: middle;
            border-style: none;
        }

        .text-muted {
            color: #aeb0b4 !important;
        }

        .text-muted {
            font-weight: 300;
        }

        .form-control {
            display: block;
            width: 100%;
            height: calc(1.5em + 0.75rem + 2px);
            padding: 0.375rem 0.75rem;
            font-size: 0.875rem;
            font-weight: 400;
            line-height: 1.5;
            color: #4d5154;
            background-color: #ffffff;
            background-clip: padding-box;
            border: 1px solid #aeb0b4;
            border-radius: 0.25rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        .avatar-img:hover {
            background-color: #1f1f1f;
            border: 1px solid #1f1f1f;
            border-radius: 10px;
        }

        .ddl:hover {
            color: #1f1f1f;
            background-color: #FFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="mainDiv">

        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-10 col-xl-8 mx-auto">
                    <h2 class="h3 mb-4 page-title">Product</h2>

                    <div class="my-4">
                        <hr />
                        <div class="row mt-5 mb-5 align-items-center">

                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 d-flex flex-column justify-content-center">
                                <div class="avatar avatar-xl">
                                    <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" CssClass="avatar-img" ImageUrl="https://cdn-icons-png.flaticon.com/512/2496/2496844.png" runat="server" />
                                    <%--<img" src="https://cdn-icons-png.flaticon.com/512/2496/2496844.png" alt="..." class="avatar-img" />--%>
                                </div>
                                <asp:FileUpload ID="FileUpload1" CssClass="mt-2" runat="server" />
                            </div>
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 d-flex flex-column justify-content-center mt-2 mb-2">
                                <div class="avatar avatar-xl">
                                    <asp:ImageButton ID="ImageButton2" OnClick="ImageButton2_Click" CssClass="avatar-img" ImageUrl="https://cdn-icons-png.flaticon.com/512/2496/2496844.png" runat="server" />
                                    <%--<img src="https://cdn-icons-png.flaticon.com/512/2496/2496844.png" alt="..." class="avatar-img" />--%>
                                </div>
                                <asp:FileUpload ID="FileUpload2" CssClass="mt-2" runat="server" />
                            </div>
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 d-flex flex-column justify-content-center">
                                <div class="avatar avatar-xl">

                                    <asp:ImageButton ID="ImageButton3" OnClick="ImageButton3_Click" CssClass="avatar-img" ImageUrl="https://cdn-icons-png.flaticon.com/512/2496/2496844.png" runat="server" />
                                    <%--<img src="https://cdn-icons-png.flaticon.com/512/2496/2496844.png" alt="..." class="avatar-img" />--%>
                                </div>
                                <asp:FileUpload ID="FileUpload3" CssClass="mt-2" runat="server" />
                            </div>

                        </div>
                        <hr class="my-4" />

                        <div class="row mb-3">
                            <div class="form-group col-xl-4 col-lg-4 col-md-4">
                                <label for="txtProductNo">Product Number</label>
                                <asp:TextBox ID="txtProductNo" CssClass="form-control" placeholder="Product Number" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-xl-4 col-lg-4 col-md-4">
                                <label for="txtProductName">Product Name</label>
                                <asp:TextBox ID="txtProductName" CssClass="form-control" placeholder="Product Name" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-xl-4 col-lg-4 col-md-4">
                                <label for="txtHsnSac">HSN/SAC</label>
                                <asp:TextBox ID="txtHsnSac" Text="-" CssClass="form-control" placeholder="HSN/SAC" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group mb-3">
                            <label for="txtTitle">Title</label>
                            <asp:TextBox ID="txtTitle" CssClass="form-control" placeholder="Title" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtDescription">Description</label>
                            <asp:TextBox ID="txtDescription" CssClass="form-control" Rows="5" TextMode="MultiLine" placeholder="Description" runat="server"></asp:TextBox>
                        </div>


                        <div class="row mb-3 mt-3">
                            <div class="form-group col-md-2">
                                <label for="ddlCategories">Category</label>
                                <br />
                                <asp:DropDownList ID="ddlCategories" AutoPostBack="true" CssClass="ddl btn btn-outline-dark dropdown-toggle" OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged" runat="server"></asp:DropDownList>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="txtGstPercentage">GST(%)</label>
                                <asp:TextBox ID="txtGstPercentage" Enabled="false" CssClass="form-control disabled" placeholder="GST(%)" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="txtDiscount">Discount(%)</label>
                                <asp:TextBox ID="txtDiscount" CssClass="form-control" placeholder="Discount(%)" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="txtPrice">MRP(₹)</label>
                                <asp:TextBox ID="txtPrice" CssClass="form-control" placeholder="MRP(₹)" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-3 d-flex justify-content-center align-items-end">
                                <asp:Button ID="btnCalculate" OnClick="btnCalculate_Click" runat="server" CssClass="btn btn-warning" Text="Calculate" />
                            </div>
                        </div>
                        <hr class="my-4" />
                        <div class="row mb-4">
                            <div class="form-group col-md-4">
                                <label for="txtWithoutGstPrice">Without GST MRP(₹)</label>
                                <asp:TextBox ID="txtWithoutGstPrice" CssClass="form-control" placeholder="Without GST Price(₹)" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group col-md-2">
                                <label for="txtCgst">GST(₹)</label>
                                <asp:TextBox ID="txtCgst" CssClass="form-control" placeholder="CGST(₹)" runat="server"></asp:TextBox>
                            </div>


                            <div class="form-group col-md-2">
                                <label for="txtSgst">SGST(₹)</label>
                                <asp:TextBox ID="txtSgst" CssClass="form-control" placeholder="SGST(₹)" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="txtIgst">IGST(₹)</label>
                                <asp:TextBox ID="txtIgst" CssClass="form-control" placeholder="IGST(₹)" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="txtFinalPrice">After Discount Final Price(₹)</label>
                                <asp:TextBox ID="txtFinalPrice" CssClass="form-control" placeholder="Final Price(₹)" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="txtDiscountInRupees">After Discount Final Price(₹)</label>
                                <asp:TextBox ID="txtDiscountInRupees" CssClass="form-control" placeholder="Discount Rupees(₹)" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="d-flex justify-content-center">
                            <asp:Button ID="btn" CssClass="btn btn-primary w-100" OnClick="btn_Click" runat="server" Text="Button" />
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

