<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="News And Events.aspx.cs" Inherits="EatiT.com.WebForm31" %>
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
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-3 p-md-2">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>News And Events</h4>
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
                     <div class="col-md-12">
                        <label>Notice Number</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Notice Number"></asp:TextBox>
                          </div>
                        </div>
                     </div></div>
                  <div class="row">
                     <div class="col-md-12">
                        <label>Notice Heading</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Notice Heading"></asp:TextBox>
                          </div>
                        </div>
                     </div>
                      <div class="col-md-12">
                        <label>Notice Body</label>
                        <div class="form-group">
                                      <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" TextMode="MultiLine" placeholder="Notice Body" ></asp:TextBox>                         
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
             </div>
         <div class="col-md-9 p-md-2">
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
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EaTiT-dbConnectionString %>" SelectCommand="SELECT * FROM [Notice_Board_Table]"></asp:SqlDataSource>
               <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Notice_Number" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Justify" Width="100%">
                   <AlternatingRowStyle BackColor="#CCCCCC" />
                   <Columns>
                       <asp:BoundField DataField="Notice_Number" HeaderText="Notice_Number" SortExpression="Notice_Number" />
                       <asp:TemplateField HeaderText="Notice">
                           <ItemTemplate>
                               &nbsp;<asp:Image ID="Image1" runat="server" Height="150px" ImageAlign="AbsMiddle" ImageUrl='<%# Eval("Notice_imglink") %>' Width="800px" />
                               <br />
                               <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                               <asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text='<%# Eval("Notice_Head") %>'></asp:Label>
                               <br />
                               </strong>
                               <asp:Label ID="Label2" runat="server" Text='<%# Eval("Notice_Body") %>'></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                   </Columns>
                   <FooterStyle BackColor="#CCCCCC" />
                   <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                   <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                   <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                   <SortedAscendingCellStyle BackColor="#F1F1F1" />
                   <SortedAscendingHeaderStyle BackColor="#808080" />
                   <SortedDescendingCellStyle BackColor="#CAC9C9" />
                   <SortedDescendingHeaderStyle BackColor="#383838" />
               </asp:GridView>
               </div>
                   </div>
                </div></div>
             </div>
          </div>
    </div>
</asp:Content>
