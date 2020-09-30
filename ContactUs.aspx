<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="EatiT.com.WebForm8" %>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
      <div class="row p-md-4">
         <div class="col-md-6 mx-auto" style="border:2px solid black;border-radius:8px;background-color:white;">
                  <div class="row">
                     <div class="col p-md-2">
                        <center>
                           <h4> Enquiry Form</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-12">
                        <label>Full Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name*"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact No*" TextMode="Number"></asp:TextBox>
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
             <div class="col-md-6">
               <label for="exampleFormControlTextarea1">Enquiry</label>
                 <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Description"></asp:TextBox>
                        </div>
              </div>
                 </div>
             <br>
                  <div class="row">
                     <div class="col">
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Send Enquiry" onclick="Button1_Click" />
                        </div>
                     </div>
                  </div>
           
         </div>
          </div>
          <div class="row">
              <div class="col-md-6 mx-auto">
           <a href="Homepage.aspx"><< Back to Home</a><br><br>
                  </div>
              </div>
                         
   </div>
</asp:Content>
