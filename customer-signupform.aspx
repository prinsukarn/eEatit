<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="customer-signupform.aspx.cs" Inherits="EatiT.com.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container">
      <div class="row p-md-4">
         <div class="col-md-8 mx-auto">
            <div class="card" style="border:1.5px solid black;border-radius:8px;">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Create An Account</h4>
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
                        <label>Full Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name*" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" controltovalidate="TextBox1" ForeColor="red" ErrorMessage="FullName Required"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Date of Birth</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact No*" TextMode="Phone" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" controltovalidate="TextBox3" ForeColor="red" ErrorMessage="Contact Number Required"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Email ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Province</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                              <asp:ListItem Text="Select" Value="select" />
                              <asp:ListItem Text="1" Value="1" />
                              <asp:ListItem Text="2" Value="2" />
                              <asp:ListItem Text="Bagmati Pradesh" Value="Bagmati Pradesh" />
                              <asp:ListItem Text="Gandaki Pradesh" Value="Gandaki Pradesh" />
                              <asp:ListItem Text="5" Value="5" />
                              <asp:ListItem Text="Karnali Pradesh" Value="Karnali Pradesh" />
                              <asp:ListItem Text="Sudurpaschim" Value="Sudurpaschim" />

                           </asp:DropDownList>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>City</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="City"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <label>Full Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <span class="badge badge-pill badge-info">Login Credentials</span>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Username</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="Username*"></asp:TextBox> 
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" controltovalidate="TextBox8" ForeColor="red" ErrorMessage="Username Required"></asp:RequiredFieldValidator>    
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="Password*" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" controltovalidate="TextBox9" ForeColor="red" ErrorMessage="Password Required"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br><br>
         </div>
      </div>
   </div>
</asp:Content>
