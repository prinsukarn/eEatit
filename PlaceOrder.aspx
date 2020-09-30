<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="EatiT.com.WebForm19" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid p-0">
        <div class="row pl-md-2 pr-md-2 " style="background-color:#CB202D;color:white;">
            <div class="col-6 ml-left">
    Total Items in your cart: <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </div>
            <div class="col-6 text-right">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddToCart.aspx" ForeColor="White">Continue Shopping</asp:HyperLink>
</div>
     </div>
        </div>
    <div class="container-fluid p-0">     
        <div class="row pl-md-2 pr-md-2 " style="background-color:#CB202D;color:white;">
            
            <div class="col-6 ml-left">    
                Order ID: <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></div>
            <div class="col-6 text-right">
                Order Date: <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </div>
            </div>
         
            </div>
     <div class="container mx-auto">
        <div class="row mx-auto m-md-4">        
            <div class="col-lg-8 mx-auto">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" CellPadding="4" HorizontalAlign="Center" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                <Columns>
                   <asp:BoundField DataField="sno" HeaderText="S.No" />
            <asp:BoundField DataField="Itemid" HeaderText="ItemID" />
            <asp:BoundField DataField="Itemname" HeaderText="ItemName" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="Totalprice" HeaderText="Total Price" />

              
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
                </div>

                     <div class="col-lg-4" style="background-color:white;">
                        <label>FullName</label>
                        <div class="form-group m-0">
                        <asp:TextBox ID="TextBox3" runat="server" BackColor="White" BorderColor="#999999"  Width="274px"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" controltovalidate="TextBox3" ErrorMessage="Full Name Required"></asp:RequiredFieldValidator>
                        </div>
                         <label>Contact Number</label>
                        <div class="form-group m-0">
                       
                        <asp:TextBox ID="TextBox2" runat="server" BackColor="White" BorderColor="#999999"  Width="274px"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" controltovalidate="TextBox2" ErrorMessage="Contact Number Required"></asp:RequiredFieldValidator>
                        </div>
                         <label>Full Address</label>
                         <div class="form-group m-0">
                             
                          <asp:TextBox ID="TextBox1" runat="server" BackColor="White" BorderColor="Gray" Width="271px"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" controltovalidate="TextBox1" ErrorMessage="Full Address Required"></asp:RequiredFieldValidator>
                       
                         </div>
                        <div class="form-group mx-auto">
                           <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Place Order"  BackColor="#339933" ForeColor="White" />            
         </div>
                
                     </div>
                  </div>
    </div>
</asp:Content>
