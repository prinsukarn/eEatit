<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="EatiT.com.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
           <script type="text/javascript">
      $(document).ready(function () {     
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
           </script>
       <style type="text/css">
           .auto-style1 {
               font-size: medium;
           }
           .auto-style2 {
               font-size: large;
           }
           .auto-style3 {
               text-decoration: underline;
           }
       </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <!-------   <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Customer Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="imgs/generaluser.png" />
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
                        <label>Customer ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" Width="56px"><i class="fas fa-check-circle"></i></asp:LinkButton>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Full Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-3">
                        <label>DOB</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="DOB" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     
                     <div class="col-md-8">
                        <label>Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                      <div class="col-md-4">
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact No" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>State</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="State" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>

                     <div class="col-md-4">
                        <label>City</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label>Full  Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Full Postal Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-8 mx-auto">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete User Permanently" OnClick="Button2_Click" />
                     </div>
                  </div>
               </div>
            </div>---->
            <a href="homepage.aspx"><< Back to Home</a><br>
            <br>
         </div>
         <div class="col-md-8 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Customer Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EaTiT-dbConnectionString %>" SelectCommand="SELECT * FROM [customer_master_tbl]"></asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="username" AllowSorting="true"  DataSourceID="SqlDataSource1">
                           <Columns>

                               <asp:TemplateField>
                                   <ItemTemplate>
                                       <strong>
                                           
                                       <asp:Label ID="Label1" runat="server" CssClass="auto-style2" Text='<%# Eval("full_name") %>'></asp:Label>
                                       <br />
                                       </strong>Username:<asp:Label ID="Label2" runat="server" CssClass="auto-style1" Text='<%# Eval("username") %>'></asp:Label>
                                       &nbsp;DOB:<strong><asp:Label ID="Label3" runat="server" Text='<%# Eval("dob") %>'></asp:Label>
                                       </strong>
                                       <br />
                                       State:<asp:Label ID="Label5" runat="server" Text='<%# Eval("state") %>'></asp:Label>
                                       &nbsp;City:<asp:Label ID="Label6" runat="server" Text='<%# Eval("city") %>'></asp:Label>
                                       <br />
                                       Full Address:<asp:Label ID="Label7" runat="server" Text='<%# Eval("full_address") %>'></asp:Label>
                                       <br />
                                       Email:<a href="mailto:'<%# Eval("email") %>'"><asp:Label ID="Label9" runat="server" ForeColor="Green"  Text='<%# Eval("email") %>'></asp:Label></a>
                                       <br />
                                       Contact No:<a href="tel:'<%# Eval("contact_no") %>'"><asp:Label ID="Label8" runat="server" CssClass="auto-style3" ForeColor="Blue" Text='<%# Eval("contact_no") %>'></asp:Label>
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
