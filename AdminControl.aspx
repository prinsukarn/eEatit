<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminControl.aspx.cs" Inherits="EatiT.com.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
   <div class="container">
      <div class="row p-md-4">
          
         <div class="col-md-5 mx-auto">
              <h2>Admin Details</h2>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EaTiT-dbConnectionString %>" SelectCommand="SELECT [fullname], [contact_number] FROM [admin_master_table]"></asp:SqlDataSource>
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None">
                 <AlternatingRowStyle BackColor="PaleGoldenrod" />
                 <Columns>
                     <asp:BoundField DataField="fullname" HeaderText="Full Name" SortExpression="fullname" />
                     <asp:BoundField DataField="contact_number" HeaderText="Contact Number" SortExpression="contact_number" />
                 </Columns>
                 <FooterStyle BackColor="Tan" />
                 <HeaderStyle BackColor="Tan" Font-Bold="True" />
                 <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                 <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                 <SortedAscendingCellStyle BackColor="#FAFAE7" />
                 <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                 <SortedDescendingCellStyle BackColor="#E1DB9C" />
                 <SortedDescendingHeaderStyle BackColor="#C2A47B" />
             </asp:GridView>
         </div>
           <div class="col-md-7 mx-auto">
            <div class="card" style="border:1.5px solid black;border-radius:8px;">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Hi Admin, Have a Good Day!</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
    
    <asp:Button ID="Button2" CssClass="btn-block m-md-2" runat="server" Text="Add Restaurant" OnClick="Button2_Click" BackColor="#000040" ForeColor="White" />
                         </div><div class="col-md-6">
    <asp:Button ID="Button3"  CssClass="btn-block m-md-2" runat="server" Text="Customers" OnClick="Button3_Click" BackColor="#000040" ForeColor="White" /></div><div class="col-md-6">
        
    <asp:Button ID="Button4"  CssClass="btn-block m-md-2" runat="server" Text="List Directory" OnClick="Button4_Click" BackColor="#000040" ForeColor="White" /></div><div class="col-md-6">
    
    <asp:Button ID="Button5"  CssClass="btn-block m-md-2" runat="server" Text="Career Forms List" OnClick="Button5_Click" BackColor="#000040" ForeColor="White" />  </div><div class="col-md-6">    
    
    <asp:Button ID="Button6"  CssClass="btn-block m-md-2" runat="server" Text="Special Items" OnClick="Button6_Click" BackColor="#000040" ForeColor="White" /></div><div class="col-md-6">
  
   <asp:Button ID="Button8"  CssClass="btn-block m-md-2" runat="server" Text="Top Vendor" OnClick="Button8_Click" BackColor="#000040" ForeColor="White"/></div><div class="col-md-6">
    

    <asp:Button ID="Button10"  CssClass="btn-block m-md-2" runat="server" Text="Order Details" OnClick="Button10_Click" BackColor="#000040" ForeColor="White"/></div><div class="col-md-6">
        <asp:Button ID="Button1"  CssClass="btn-block m-md-2" runat="server" Text="Change Password" OnClick="Button1_Click" BackColor="#000040" ForeColor="White"/></div><div class="col-md-6">
        <asp:Button ID="Button11"  CssClass="btn-block m-md-2" runat="server" Text="Add Admin" OnClick="Button11_Click" BackColor="#000040" ForeColor="White" /></div>
        
                      <div class="col-md-6">
        <asp:Button ID="Button13"  CssClass="btn-block m-md-2" runat="server" Text="Delete Admin" OnClick="Button13_Click" BackColor="#000040" ForeColor="White" /></div>
                               <div class="col-md-6">
        <asp:Button ID="Button7"  CssClass="btn-block m-md-2" runat="server" Text="Carousel Upload" OnClick="Button7_Click" BackColor="#000040" ForeColor="White" /></div>
                                <div class="col-md-6">
        <asp:Button ID="Button9"  CssClass="btn-block m-md-2" runat="server" Text="Add News/Events" OnClick="Button9_Click" BackColor="#000040" ForeColor="White" /></div>
        
                      <!-- <div class="col-md-12">
                       <div class="row" style="background-color:blanchedalmond;">
                       <asp:FileUpload onchange="readURL(this);" ID="FileUpload1"  runat="server" />
                           <asp:Button ID="Button12" runat="server" Text="Upload" CssClass="btn-success" />

                           </div>
                   </div>-->
       </div>
                   </div></div></div>
        
     </div>
</asp:Content>
