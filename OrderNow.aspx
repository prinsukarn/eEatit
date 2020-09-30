<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OrderNow.aspx.cs" Inherits="EatiT.com.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid p-0">
        <div class="row pl-md-2 pr-md-2 " style="background-color:#CB202D;color:white;">
            <div class="col-6 ml-left">
                           Total Items in your cart: <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </div>
            <div class="col-6 text-right">
    
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddToCart.aspx" ForeColor="white">Continue Shopping</asp:HyperLink>   
        </div>
        </div>
    <div class="container mx-auto">
        <div class="row mx-auto m-md-4">        
            <div class="col-md-10 mx-auto">
                <div class="table-responsive">
    <asp:GridView ID="GridView1" runat="server" OnRowDeleting="GridView1_RowDeleting" AutoGenerateColumns="False" Height="83px"  ShowFooter="True" Width="765px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
       
        <Columns>
            <asp:BoundField DataField="sno" HeaderText="S.No" />
            <asp:BoundField DataField="Itemid" HeaderText="ItemID" />
            <asp:BoundField DataField="Itemname" HeaderText="ItemName" />
            <asp:BoundField DataField="Price" HeaderText="Price" />
            
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="Totalprice" HeaderText="Total Price" />
           
            <asp:CommandField DeleteText="Delete" ShowDeleteButton="True" />
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
                </div>
            </div>
        </div>
         <div class="container-fluid">
            <div class="row text-center  mx-auto m-2">
                <div class="col-4 mx-auto">
            <asp:Button ID="Button1" CssClass="btn btn-success btn-large" runat="server" Text="Checkout" OnClick="Button1_Click" />
                </div>
                </div>
        </div>
        </div>
</asp:Content>
