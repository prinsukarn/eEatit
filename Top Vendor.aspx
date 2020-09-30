<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Top Vendor.aspx.cs" Inherits="EatiT.com.WebForm30" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">
      $(document).ready(function () {     
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
      </script>
        <style type="text/css">
            .auto-style1 {
                width: 100%;
            }
            .auto-style2 {
                width: 152px;
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid" >
      <div class="row p-md-4">
         <div class="col-md-4"  >
            <div class="card" style="border:1.5px solid black;border-radius:8px;">
               <div class="card-body" > 
                 <div class="row">
                     <div class="col">
                        <center>
                           <h3>Add A Top Vendor</h3>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  
                     <div class="form-group">
                         <label>Upload image/document</label>
                         <asp:FileUpload onchange="readURL(this);" ID="FileUpload1" class="form-control" runat="server" />
                     </div>
                  
            
                        <div class="form-group">
                            <label>Vendor Id</label>
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Vendor Id"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" controltovalidate="TextBox1" ErrorMessage="Vendor Id Required"></asp:RequiredFieldValidator>
                       </div>

                        <div class="form-group">
                             <label>Vendor Name</label>
                           <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                              <asp:ListItem Text="Restaurant 1" Value="Restaurant 1" />
                              <asp:ListItem Text="Restaurant 2" Value="Restaurant 2" />
                              
                           </asp:DropDownList></div>
                   <label>Contact Person</label>
                        <div class="form-group">
                           <asp:TextBox Class="form-control" ID="TextBox6" runat="server" placeholder="Contact PersonName"></asp:TextBox>
                        </div>
                   <label>Vendor Address</label>
                        <div class="form-group">
                           <asp:TextBox Class="form-control" ID="TextBox3" runat="server" placeholder="Vendor Address"></asp:TextBox>
                        </div>
                   <label>Contact</label>
                        <div class="form-group">
                           <asp:TextBox Class="form-control" ID="TextBox4" runat="server" placeholder="Contact Number"></asp:TextBox>
                        </div>
                    <label>Vendor Email ID</label>
                        <div class="form-group">
                           <asp:TextBox Class="form-control" ID="TextBox5" runat="server" placeholder="Vendor Email Address"></asp:TextBox>
                        </div>
                         <div class="row">
                        <div class="form-group col-md-4">
                           <asp:Button class="btn btn-success btn-block" ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
                        </div>
                          <div class="form-group col-md-4">
                           <asp:Button class="btn btn-primary btn-block" ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" />
                        </div>
                         <div class="form-group col-md-4">
                           <asp:Button class="btn btn-danger btn-block" ID="Button3" runat="server" Text="Delete" OnClick="Button3_Click" />
                        </div>
                             </div>
                     </div>
                  </div>
              
            <a href="homepage.aspx"><< Back to Home</a><br><br>
         </div></div>
           <div class="col-md-8"  >
            <div class="card" style="border:1.5px solid black;border-radius:8px;">
               <div class="card-body" > 
                 <div class="row">
                     <div class="col">
                        <center>
                           <h3>Add A Restaurant</h3>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EaTiT-dbConnectionString %>" SelectCommand="SELECT * FROM [Top_Vendor_Table]"></asp:SqlDataSource>
                         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" Width="772px">
                             <AlternatingRowStyle BackColor="PaleGoldenrod" />
                             <Columns>
                                 <asp:BoundField DataField="TopVendor_ID" HeaderText="TopVendor_ID" SortExpression="TopVendor_ID" />
                                 <asp:TemplateField>
                                      <ItemTemplate>
                                        <table class="auto-style1 table">
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Image ID="Image1" runat="server" Height="118px" ImageAlign="Top" ImageUrl='<%# Eval("Vendor_ImageLink") %>' Width="150px" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" CssClass="auto-style3" Font-Bold="True" Text='<%# Eval("Vendor_Name") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Contact_Person") %>'></asp:Label>
                                            <br />
                                            <a href="tel:'<%# Eval("Contact_Number") %>'"><asp:Label ID="Label4" runat="server" ForeColor="Blue" Text='<%# Eval("Contact_Number") %>'></asp:Label></a>
                                            <br />
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Vendor_Address") %>'></asp:Label>
                                            <br />
                                          <a href="mailto:'<%# Eval("Vendor_Email") %>'" > <asp:Label ID="Label6" runat="server" ForeColor="Green" Text='<%# Eval("Vendor_Email") %>'></asp:Label></a>
                                        </td>
                                    </tr>
                                </table>
                                   </ItemTemplate>
                                 </asp:TemplateField>
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
                      </div>
                   </div>
                </div>
               </div>
          </div>
        </div>
</asp:Content>
