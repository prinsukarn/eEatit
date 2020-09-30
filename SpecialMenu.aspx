<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SpecialMenu.aspx.cs" Inherits="EatiT.com.WebForm22" %>
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
                      width: 99%;
                  }
                  .auto-style2 {
                      width: 161px;
                  }
              </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Special Item Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img id="imgview" Height="100px" Width="100px" src="image/food12.jpg" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                         <asp:FileUpload onchange="readURL(this);" ID="FileUpload1" class="form-control" runat="server" />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Item ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Item ID"></asp:TextBox>
                           </div>
                        </div>
                     </div>
                      <div class="col-md-4">
                        <label>Item Name</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
                              <asp:ListItem Text="A1" Value="a1" />
                              <asp:ListItem Text="a2" Value="a2" />
                           </asp:DropDownList>
                        </div>
                  </div>
                                           <div class="col-md-4">
                        <label>Price</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Item Cost(per unit)" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                      </div>
                  <div class="row">
                      <div class="col-md-8">
                          <div class="row">
                              <div class="col-12">
                        <label>Restaurant Name</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                              <asp:ListItem Text="Restaurant 1" Value="Restaurant 1" />
                              <asp:ListItem Text="Restaurant 2" Value="Restaurant 2" />
                           </asp:DropDownList>
                        </div>
                              </div>
                              <div class="row">
                          <div class="col-12 m-2">
                        <label>Item Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Item Description" TextMode="MultiLine" Rows="1"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                              </div>
                     </div>
                     
                     <div class="col-md-4">
                        <label>Cuisine</label>
                        <div class="form-group">
                            <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                              <asp:ListItem Text="Nepali" Value="Nepali" />
                              <asp:ListItem Text="Indian" Value="Indian" />
                              <asp:ListItem Text="Chinese" Value="Chinese" />
                              <asp:ListItem Text="French" Value="French" />
                              <asp:ListItem Text="Italian" Value="Italian" />
                              <asp:ListItem Text="Mexican" Value="Mexican" />
                               <asp:ListItem Text="SeaFood" Value="SeaFood" />
                           </asp:ListBox>
                        </div>
                         </div>
                         
                       
                     </div>                   
                  </div>

                 
                  
                  <div class="row">
                     <div class="col-3 mx-auto">
                        <asp:Button ID="Button1" class="btn btn-block btn-success" runat="server" Text="Add" OnClick="Button1_Click" />
                     </div>
                     <div class="col-3 mx-auto">
                        <asp:Button ID="Button3" class="btn btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                     </div>
                     <div class="col-3 mx-auto">
                        <asp:Button ID="Button2" class="btn btn-block btn-danger" runat="server" Text="Delete" OnClick="Button2_Click" />
                     </div>
                  </div>
                         </div>
            <a href="homepage.aspx"><< Back to Home</a><br>
             </div>  
            <br>
         
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Special Item List</h4>
                        </center>
                     </div>
                  
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                      </div>
           <div class="row">
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EaTiT-dbConnectionString %>" SelectCommand="SELECT * FROM [Specialitem_Master_table]"></asp:SqlDataSource>
                     <div class="col-12 mx-auto">
                         <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SItem_ID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                             <AlternatingRowStyle BackColor="White" />
                           <Columns>
                              <asp:BoundField DataField="SItem_ID" HeaderText="Item_ID" ReadOnly="True" SortExpression="SItem_ID" >
                              </asp:BoundField>                      
                             
                               <asp:TemplateField>
                               
                                   <ItemTemplate>
                                        <table class="auto-style1">
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Image ID="Image1" runat="server" Height="118px" ImageAlign="Top" ImageUrl='<%# Eval("Sitem_imagelink") %>' Width="150px" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" CssClass="auto-style3" Text='<%# Eval("SItem_Name") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("SRestaurant_Name") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("SCuisine") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("SPrice") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("SItem_desc") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
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
            </div>
            </div>
         </div>
      </div>
    </div>
</asp:Content>
