<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddAdmin.aspx.cs" Inherits="EatiT.com.WebForm28" %>
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
                           <h4>Create An Admin Account</h4>
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
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact No*" TextMode="Number" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" controltovalidate="TextBox3" ForeColor="red" ErrorMessage="Contact Number Required"></asp:RequiredFieldValidator>
                        </div>
                     </div>
             </div>
         <div class="row">
                     <div class="col-md-6">
                        <label>Admin ID</label>
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
                 
                   </div></div></div></div>
      
                  
    </div>
</asp:Content>
