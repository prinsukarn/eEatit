 <%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="customer-loginform.aspx.cs" Inherits="EatiT.com.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" >
      <div class="row p-md-4">
         <div class="col-md-6 mx-auto"  >
            <div class="card" style="border:1.5px solid black;border-radius:8px;">
               <div class="card-body" > 
                 <div class="row">
                     <div class="col">
                        <center>
                           <h3>Customer Login</h3>
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
                        <label>Username</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Username*"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" controltovalidate="TextBox1" ForeColor="red" ErrorMessage="Username Required*"></asp:RequiredFieldValidator>
                        </div>
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox Class="form-control" ID="TextBox2" runat="server" placeholder="Password*" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" controltovalidate="TextBox2" ForeColor="red" ErrorMessage="Password Required*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                        </div>
                        
                        <div class="form-group">
                            <label>If you do not have an account , Click an to create an account. </label>
                           <a href="customer-signupform.aspx"><input class="btn btn-info btn-block btn-lg" id="Button2" type="button" value="Create An Account"/></a>
                        </div>
                         <div class="form-group">
                          <a href="AdminLogin.aspx"><input class="btn btn-success btn-block btn-lg" id="Button3" type="button" value="Login As Admin"/></a>
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
