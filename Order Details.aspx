<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Order Details.aspx.cs" Inherits="EatiT.com.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
      $(document).ready(function () {     
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
     </script>
     </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid">  
                    <div class="row" style="background-color:white;color:#CB202D;">
                        <a href="AdminControl.aspx">>>Back To Control Panel</a>
                        <div class="col-12 text-center">
                            <h3>Placed Orders</h3>
                           <!--- <asp:Button ID="Button2" runat="server" Text="Update Status"  />--->
                        </div>
                    </div>

                        <div class="row" style="background-color:white;color"> 
                            <div class="col-12  m-2">
                                <div class="table-responsive"> 
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EaTiT-dbConnectionString %>" SelectCommand="SELECT orderdetails.datefororder,orderdetails.orderid,orderdetails.Itemid,orderdetails.Itemname,orderdetails.Price,orderdetails.Quantity,orderdetails.TotalPrice,Orderaddress.mobilenumber,Orderaddress.fullname,Orderaddress.address,Orderaddress.orderstatus from orderdetails,orderaddress where orderdetails.orderid=orderaddress.orderid ORDER BY [datefororder] DESC "></asp:SqlDataSource> 
             
       <asp:GridView ID="GridView1" class="table table-striped table-bordered"   runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
      
           <AlternatingRowStyle BackColor="White" />
      
<Columns>
                               <asp:BoundField DataField="datefororder" HeaderText="datefororder"  ApplyFormatInEditMode="False"   >
                               </asp:BoundField>
                               <asp:BoundField DataField="orderid" HeaderText="orderid" SortExpression="orderid" >
                               </asp:BoundField>
                               <asp:BoundField DataField="Itemid" HeaderText="Itemid" SortExpression="Itemid" >
                               </asp:BoundField>
                               <asp:BoundField DataField="Itemname" HeaderText="Itemname" SortExpression="Itemname" >

                               </asp:BoundField>
  

                               <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
  

                               <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                
                               <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" SortExpression="TotalPrice" />
                              

                               <asp:BoundField DataField="mobilenumber" HeaderText="mobilenumber" SortExpression="mobilenumber"  />
                               <asp:BoundField DataField="fullname" HeaderText="fullname" SortExpression="fullname"/>
                               <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
    
  

                              <asp:TemplateField HeaderText="Order Status">
                                   <ItemTemplate>
                                       <!--<asp:RadioButton ID="RadioButton1" runat="server" ForeColor="Red" Text="Pending" />-->
                                       <asp:LinkButton ID="LinkButton17" runat="server" OnClick="LinkButton17_Click">Approve</asp:LinkButton>
                                       <br />
                                       Status: <asp:Label ID="Label1" runat="server" Text='<%# Eval("orderstatus") %>' ForeColor="Green"></asp:Label>
                                   </ItemTemplate>
                               </asp:TemplateField>
    
  

                               
    
  

                         </Columns>
                        <FooterStyle BackColor="#CCCC99" />
           <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
           <RowStyle BackColor="#F7F7DE" />
           <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
           <SortedAscendingCellStyle BackColor="#FBFBF2" />
           <SortedAscendingHeaderStyle BackColor="#848384" />
           <SortedDescendingCellStyle BackColor="#EAEAD3" />
           <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>
                </div>
                </div>
                              <div class="col-12 text-right">
                                    <asp:Button ID="Button1" runat="server" Text="Export To Excel" OnClick="Button1_Click" /></div>
                        
</div></div>
</asp:Content>
