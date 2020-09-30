<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Delete Admin.aspx.cs" Inherits="EatiT.com.WebForm29" %>
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
                        <label>Admin ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name*" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" controltovalidate="TextBox1" ForeColor="red" ErrorMessage="Admin ID Required"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                  <div class="col-md-6">
                        <label>Full Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name*" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" controltovalidate="TextBox1" ForeColor="red" ErrorMessage="FullName Required"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                  </div>
            
                    <div class="row">
                     <div class="col">
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="Button2" runat="server" Text="Delete Admin" OnClick="Button2_Click" />
                        </div>
                     </div>
                  </div>
                
                   </div></div></div></div>
      
                  
    </div>
</asp:Content>
