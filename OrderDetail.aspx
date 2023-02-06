<%@ Page Title="Milk And Berries - Order Details" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="Admin_OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body{
        background:#eee;
        }
        .card {
            box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
        }
        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0 solid rgba(0,0,0,.125);
            border-radius: 1rem;
        }
        .text-reset {
            --bs-text-opacity: 1;
            color: inherit!important;
        }
        a {
            color: #5465ff;
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container-fluid">

<div class="container">
    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
      <!-- Title -->
      <div class="d-flex justify-content-between align-items-center py-3">
        <h2 class="h5 mb-0"><a href="#" class="text-muted"></a> Order #<asp:Label ID="lblOrderId" runat="server" Text=""></asp:Label></h2>
      </div>

      <!-- Main content -->
      <div class="row">
        <div class="col-lg-8">
          <!-- Details -->
          <div class="card mb-4">
            <div class="card-body">
              <div class="mb-3 d-flex justify-content-between">
                <div>
                  <span class="me-3">
                      <asp:Label ID="lblOrderDate" CssClass="me-3" runat="server" Text=""></asp:Label></span>
                    <asp:Label ID="lblDeliveryDate" CssClass="me-3" runat="server" Text=""></asp:Label>
                  <span class="me-3">Visa -1234</span>
                    <asp:Label ID="lblOrderStatus" CssClass="badge rounded-pill bg-info" runat="server" Text=""></asp:Label>
                </div>
                <div class="d-flex">
                    <asp:Button ID="btnGetInvoice" OnClick="btnGetInvoice_Click1" CssClass="btn btn-link p-0 me-3 d-none d-lg-block btn-icon-text" runat="server" Text="Invoice" />
                  <div class="dropdown">
                    <button class="btn btn-link p-0 text-muted" type="button" data-bs-toggle="dropdown">
                      <i class="bi bi-three-dots-vertical"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                      <li><a class="dropdown-item" href="#"><i class="bi bi-pencil"></i> Edit</a></li>
                      <li><a class="dropdown-item" href="#"><i class="bi bi-printer"></i> Print</a></li>
                    </ul>
                  </div>
                </div>
              </div>
                
              <table class="table table-borderless">
                <tbody>
                    <asp:ListView ID="ListView1" runat="server">
                    <AlternatingItemTemplate>
                        <tr>
                            <td>
                              <div class="d-flex mb-2">
                                <div class="flex-shrink-0">
                                  <img src="https://via.placeholder.com/280x280/87CEFA/000000" alt="" width="35" class="img-fluid">
                                </div>
                                <div class="flex-lg-grow-1 ms-3">
                                  <h6 class="small mb-0"><a href="#" class="text-reset"><%# Eval("NAME") %></a></h6>
                                  <span class="small"><%# Eval("TITLE") %></span>
                                </div>
                              </div>
                            </td>
                            <td><%# Eval("QTY") %></td>
                            <td class="text-end">₹<%# Eval("ITEMTOTAL") %></td>
                          </tr>
                        <%--<span style="">NAME:
                        <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
                        <br />
                        TITLE:
                        <asp:Label ID="TITLELabel" runat="server" Text='<%# Eval("TITLE") %>' />
                        <br />
                        QTY:
                        <asp:Label ID="QTYLabel" runat="server" Text='<%# Eval("QTY") %>' />
                        <br />
                        ITEMTOTAL:
                        <asp:Label ID="ITEMTOTALLabel" runat="server" Text='<%# Eval("ITEMTOTAL") %>' />
                        <br />
                        <br /></span>--%>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <span style="">NAME:
                        <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
                        <br />
                        TITLE:
                        <asp:TextBox ID="TITLETextBox" runat="server" Text='<%# Bind("TITLE") %>' />
                        <br />
                        QTY:
                        <asp:TextBox ID="QTYTextBox" runat="server" Text='<%# Bind("QTY") %>' />
                        <br />
                        ITEMTOTAL:
                        <asp:TextBox ID="ITEMTOTALTextBox" runat="server" Text='<%# Bind("ITEMTOTAL") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        <br /><br /></span>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <span>No data was returned.</span>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <span style="">NAME:
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NAME") %>' />
                        <br />TITLE:
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TITLE") %>' />
                        <br />QTY:
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("QTY") %>' />
                        <br />ITEMTOTAL:
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ITEMTOTAL") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="Button1" runat="server" CommandName="Cancel" Text="Clear" />
                        <br /><br /></span>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                              <div class="d-flex mb-2">
                                <div class="flex-shrink-0">
                                  <img src="https://via.placeholder.com/280x280/87CEFA/000000" alt="" width="35" class="img-fluid">
                                </div>
                                <div class="flex-lg-grow-1 ms-3">
                                  <h6 class="small mb-0"><a href="#" class="text-reset"><%# Eval("NAME") %></a></h6>
                                  <span class="small"><%# Eval("TITLE") %></span>
                                </div>
                              </div>
                            </td>
                            <td><%# Eval("QTY") %></td>
                            <td class="text-end">₹<%# Eval("ITEMTOTAL") %></td>
                          </tr>
                        <%--<span style="">NAME:
                        <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
                        <br />
                        TITLE:
                        <asp:Label ID="TITLELabel" runat="server" Text='<%# Eval("TITLE") %>' />
                        <br />
                        QTY:
                        <asp:Label ID="QTYLabel" runat="server" Text='<%# Eval("QTY") %>' />
                        <br />
                        ITEMTOTAL:
                        <asp:Label ID="ITEMTOTALLabel" runat="server" Text='<%# Eval("ITEMTOTAL") %>' />
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
                        <span style="">NAME:
                        <asp:Label ID="NAMELabel" runat="server" Text='<%# Eval("NAME") %>' />
                        <br />
                        TITLE:
                        <asp:Label ID="TITLELabel" runat="server" Text='<%# Eval("TITLE") %>' />
                        <br />
                        QTY:
                        <asp:Label ID="QTYLabel" runat="server" Text='<%# Eval("QTY") %>' />
                        <br />
                        ITEMTOTAL:
                        <asp:Label ID="ITEMTOTALLabel" runat="server" Text='<%# Eval("ITEMTOTAL") %>' />
                        <br />
<br /></span>
                    </SelectedItemTemplate>
                </asp:ListView>
                  
                </tbody>
                <tfoot>
                  <tr>
                    <td colspan="2">GST</td>
                    <td class="text-end">₹<asp:Label ID="lblTotalGst" runat="server" Text=""></asp:Label> </td>
                  </tr>
                  <tr>
                    <td colspan="2">Shipping</td>
                    <td class="text-end">₹<asp:Label ID="lblDeliveryCharge" runat="server" Text=""></asp:Label></td>
                  </tr>
                  <tr>
                    <td colspan="2">Total Discount<%--(Code: NEWYEAR)--%></td>
                    <td class="text-success text-end">-₹<asp:Label ID="lblTotalDiscount" runat="server" Text=""></asp:Label></td>
                  </tr>
                  <tr class="fw-bold">
                    <td colspan="2">TOTAL</td>
                    <td class="text-end">₹<asp:Label ID="lblGrandTotal" runat="server" Text=""></asp:Label></td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
          <!-- Payment -->
          <div class="card mb-4">
            <div class="card-body">
              <div class="row">
                <div class="col-lg-6">
                  <h3 class="h6">Payment Method</h3>
                  <p>Visa -1234 <br>
                  Total: ₹<asp:Label ID="lblGrandTotalAgain" runat="server" Text=""></asp:Label> <span class="badge bg-success rounded-pill">PAID</span></p>
                </div>
                <div class="col-lg-6">
                  <h3 class="h6">Billing address</h3>
                  <address>
                    <strong>
                        <asp:Label ID="lblFullName" runat="server" Text=""></asp:Label></strong><br>
                      <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                        <%--1355 Market St, Suite 900<br>
                        San Francisco, CA 94103<br>--%><br />
                    <abbr title="Phone">P:</abbr> <asp:Label ID="lblMobileNumber" runat="server" Text=""></asp:Label>
                  </address>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <!-- Customer Notes -->
          <%--<div class="card mb-4">
            <div class="card-body">
              <h3 class="h6">Customer Notes</h3>
              <p>Sed enim, faucibus litora velit vestibulum habitasse. Cras lobortis cum sem aliquet mauris rutrum. Sollicitudin. Morbi, sem tellus vestibulum porttitor.</p>
            </div>
          </div>--%>
          <div class="card mb-4">
            <!-- Shipping information -->
            <div class="card-body">
              <h3 class="h6">Shipping Information</h3>
                <hr />
              <h3 class="h6">Address</h3>
              <address>
                  <strong>
                    <asp:Label ID="lblFullNameAgain" runat="server" Text=""></asp:Label></strong><br>
                      <asp:Label ID="lblAddressAgain" runat="server" Text=""></asp:Label>
                        <%--1355 Market St, Suite 900<br>
                        San Francisco, CA 94103<br>--%><br />
                    <abbr title="Phone">P:</abbr> <asp:Label ID="lblMobileNumberAgain" runat="server" Text=""></asp:Label>
              </address>
            </div>
          </div>
        </div>
      </div>
    </div>
</div>

</asp:Content>

