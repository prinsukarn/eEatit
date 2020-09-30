<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddRestaurant.aspx.cs" Inherits="EatiT.com.WebForm3" %>
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
                width: 97%;
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
                           <h3>Add A Restaurant</h3>
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
                            <label>Restaurant Id</label>
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Restaurant_Id"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" controltovalidate="TextBox1" ErrorMessage="Restaurant Id Required"></asp:RequiredFieldValidator>
                       </div>
                        <label>Restaurant Name</label>
                        <div class="form-group">
                           <asp:TextBox Class="form-control" ID="TextBox2" runat="server" placeholder="Restaurant_Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" controltovalidate="TextBox2" ErrorMessage="Restaurant Name Required"></asp:RequiredFieldValidator>
                        </div>
                   <label>Contact Person</label>
                        <div class="form-group">
                           <asp:TextBox Class="form-control" ID="TextBox6" runat="server" placeholder="Contact PersonName"></asp:TextBox>
                        </div>
                   <label>Address</label>
                        <div class="form-group">
                           <asp:TextBox Class="form-control" ID="TextBox3" runat="server" placeholder="Address"></asp:TextBox>
                        </div>
                   <label>Contact</label>
                        <div class="form-group">
                           <asp:TextBox Class="form-control" ID="TextBox4" runat="server" placeholder="Contact Number"></asp:TextBox>
                        </div>
                    <label>Email ID</label>
                        <div class="form-group">
                           <asp:TextBox Class="form-control" ID="TextBox5" runat="server" placeholder="Email Address"></asp:TextBox>
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
         </div>
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
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EaTiT-dbConnectionString %>" SelectCommand="SELECT * FROM [Restaurant_master_tbl]"></asp:SqlDataSource>
                         <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Restaurant_ID" DataSourceID="SqlDataSource1">
                           <Columns>
                              <asp:BoundField DataField="Restaurant_ID" HeaderText="Restaurant_ID" ReadOnly="True" SortExpression="Restaurant_ID" >
                              </asp:BoundField>                      
                             
                               <asp:TemplateField>
                               
                                   <ItemTemplate>
                                        <table class="auto-style1">
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Image ID="Image1" runat="server" Height="118px" ImageAlign="Top" ImageUrl='<%# Eval("Restaurant_imagelink") %>' Width="150px" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" CssClass="auto-style3" Font-Bold="true" Text='<%# Eval("Restaurant_Name") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Contact_Person") %>'></asp:Label>
                                            <br />
                                            <a href="tel:'<%# Eval("Contact_no") %>'"><asp:Label ID="Label4" runat="server" ForeColor="blue" Text='<%# Eval("Contact_no") %>'></asp:Label></a>
                                            <br />
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Restaurant_Address") %>'></asp:Label>
                                            <br />
                                          <a href="mailto:'<%# Eval("Restaurant_Email") %>'" > <asp:Label ID="Label6" runat="server" ForeColor="Green" Text='<%# Eval("Restaurant_Email") %>'></asp:Label></a>
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
