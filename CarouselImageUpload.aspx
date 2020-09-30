<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CarouselImageUpload.aspx.cs" Inherits="EatiT.com.WebForm32" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
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
        <div class="form-group">
              <label>Image ID</label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
         <div class="form-group">
                         <label>Upload image</label>
                         <asp:FileUpload onchange="readURL(this);" ID="FileUpload1" class="form-control" runat="server" />

                     </div><div class="form-group">
        <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click" />
                         <asp:Button ID="Button2" runat="server" Text="Delete" OnClick="Button2_Click" /></div>
    </div>
</asp:Content>
