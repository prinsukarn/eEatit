<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ItemDirectory.aspx.cs" Inherits="EatiT.com.WebForm14" %>
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
               width: 150px;
           }
           .auto-style3 {
               font-size: large;
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
                           <h4>Item Details</h4>
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
                      <div class="col-md-6">
                        <label>Item Name</label>
                        <div class="form-group">
                                      <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Item Name"></asp:TextBox>                         
                        </div>
                  </div>
                          </div>
                  <div class="row mx-auto">
                        <div class="col-md-6">
                            <div class="row">
                        <label>Restaurant Name</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                              <asp:ListItem Text="Restaurant 1" Value="Restaurant 1" />
                              <asp:ListItem Text="Restaurant 2" Value="Restaurant 2" />
                           </asp:DropDownList>
                        </div></div>
                            <div class="col-md-6">
                            <div class="row">
                        <label>Category </label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                              <asp:ListItem Text="Bakery" Value="Bakery" />
                              <asp:ListItem Text="Dairy" Value="Dairy" />
                               <asp:ListItem Text="Meat & Fish" Value="Meat & Fish" />
                               <asp:ListItem Text="Kirana Items" Value="Kirana Items" />
                               <asp:ListItem Text="Medicine" Value="Medicine" />
                               <asp:ListItem Text="Food" Value="Food" />
                               <asp:ListItem Text="Grocery" Value="Grocery" />
                               <asp:ListItem Text="Liquor" Value="Liquor" />
                          

                           </asp:DropDownList>
                        </div></div>
                     
                      <div class="row">                    
                        <label>Cost(per unit)</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Item Cost(per unit)" TextMode="Number"></asp:TextBox>
                        
                     </div>
                  </div>
                            </div>
                     <div class="col-md-6">
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
                   
                  <div class="row">
                     <div class="col-12">
                        <label>Item Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Item Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                </div>
                  <div class="row ">
                     <div class="col-3 mx-auto">
                        <asp:Button ID="Button1" class="btn  btn-block btn-success m-1" runat="server" Text="Add" OnClick="Button1_Click" />
                     </div>
                     <div class="col-3 mx-auto">
                        <asp:Button ID="Button3" class="btn  btn-block btn-warning m-1" runat="server" Text="Update" OnClick="Button3_Click" />
                     </div>
                     <div class="col-3 mx-auto">
                        <asp:Button ID="Button2" class="btn  btn-block btn-danger m-1" runat="server" Text="Delete" OnClick="Button2_Click" />
                     </div>
                  </div>
               </div>
            
            <a href="homepage.aspx"><< Back to Home</a><br>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Item List</h4>
                        </center>
                     </div>
                  
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                      </div>
           <div class="row">
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EaTiT-dbConnectionString %>" SelectCommand="SELECT * FROM [Item_List_table]"></asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Item_ID" DataSourceID="SqlDataSource1" Width="100%">
                           <Columns>
                              <asp:BoundField DataField="Item_ID" HeaderText="Item_ID" ReadOnly="True" SortExpression="Item_ID" >
                              </asp:BoundField>                      
                             
                               <asp:TemplateField>
                               
                                   <ItemTemplate>
                                        <table class="auto-style1">
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Image ID="Image1" runat="server" Height="120px" ImageAlign="Top" ImageUrl='<%# Eval("item_imagelink") %>' Width="150px" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" CssClass="auto-style3" Font-Bold="true" Text='<%# Eval("Item_Name") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Restaurant_Name") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Cuisine") %>'></asp:Label>
                                            <br />
                                            Rs. <asp:Label ID="Label5" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Item_desc") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                   </ItemTemplate>
                               </asp:TemplateField>
                             
                               </Columns>
                            
                                
                            </asp:GridView>
                  </div>
               </div>
            </div>
            </div>
         </div>

     </div>
     </div>
</asp:Content>
