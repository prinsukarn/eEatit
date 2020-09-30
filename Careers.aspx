<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Careers.aspx.cs" Inherits="EatiT.com.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
      <div class="row p-md-4">
         <div class="col-md-8 mx-auto" style="border:2px solid black;border-radius:8px;background-color:white;">
                  <div class="row">
                     <div class="col p-md-2">
                        <center>
                           <h4> Career Form</h4>
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
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name*"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ForeColor="Red" ErrorMessage="Full Name Required"></asp:RequiredFieldValidator></div>
                     </div>
                      <div class="col-md-6">
                        <label>Date of Birth</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server"  TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                     
                  <div class="row">
                     <div class="col-md-4">
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact No*" TextMode="Number"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" ForeColor="Red" ErrorMessage="Contact Number Required"></asp:RequiredFieldValidator>
                        
                        </div>
                     </div>

      
                     <div class="col-md-6">
                        <label>Email</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Email*" TextMode="Email"></asp:TextBox>
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
                       <div class="col-md-6">
                        <label>Post</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Post*"></asp:TextBox>
                        </div>
                     </div>
                     </div>
                         <div class="row">
                     <div class="col">
                        <label>Permanent Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Permanent Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5" ForeColor="Red" ErrorMessage="Address Required"></asp:RequiredFieldValidator>
                        
                        </div>
                     </div>
                             <div class="col">
                        <label>Temporary Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Temporary Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>
             <div class="row">
                     
                
                     <div class="col-md-6">
                        <label>Upload CV/Resume</label>
                        <div class="form-group">
                            <asp:FileUpload ID="FileUpload1" onchange="readURL(this);"  CssClass="form-control" runat="server" />
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="FileUpload1" ForeColor="Red" ErrorMessage="CV/Resume Required"></asp:RequiredFieldValidator>
                        
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Send Details"  OnClick="Button1_Click" />
                         
                        </div>
                     </div>
                  </div>
           
         </div>
          </div>
          <div class="row">
              <div class="col-md-2 mx-auto">
           <a href="Homepage.aspx"><< Back to Home</a><br><br>
                  </div>
              </div>
                         
   </div>
</asp:Content>
