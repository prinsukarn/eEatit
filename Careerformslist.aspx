<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Careerformslist.aspx.cs" Inherits="EatiT.com.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EaTiT-dbConnectionString %>" SelectCommand="SELECT * FROM [Career_Master_table]"></asp:SqlDataSource>
     <div class="col">
         <asp:GridView ID="GridView1" class="table table-striped table-bordered" RepeatDirection="Horizontal" RepeatColumns="4" runat="server" AutoGenerateColumns="False" DataKeyNames="Name" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
      
             <AlternatingRowStyle BackColor="#CCCCCC" />
<Columns>
     <asp:TemplateField>
              <HeaderTemplate>
                        Serial No.
              </HeaderTemplate>
              <ItemTemplate>
                  <%# Container.DataItemIndex + 1 %>
              </ItemTemplate>
              <ItemStyle Width="50px" />
          </asp:TemplateField>
                               <asp:TemplateField HeaderText="Vacancy Details">
                                   <ItemTemplate>
                                       <strong>
                                       <asp:Label ID="Label1" runat="server" CssClass="auto-style2" Text='<%# Eval("Name") %>'></asp:Label>
                                       </strong>&nbsp;<strong><br />DOB:<asp:Label ID="Label5" runat="server" Text='<%# Eval("Date_Of_Birth") %>'></asp:Label>
                                       <br /> Contact No:<a href="tel:'<%# Eval("Contact_No") %>'"><asp:Label ID="Label3" runat="server" Text='<%# Eval("Contact_No") %>'></asp:Label></a>
                                       <br />
                                       Email ID:<a href="mailto:'<%# Eval("Email") %>'"><asp:Label ID="Label4" runat="server" ForeColor="Green" Text='<%# Eval("Email") %>'></asp:Label></a>
                                       <br />
                                       Applied Post:<asp:Label ID="Label6" runat="server" Text='<%# Eval("Post") %>'></asp:Label>
                                       <br />
                                       Province:<asp:Label ID="Label9" runat="server" Text='<%# Eval("Province") %>'></asp:Label>
                                       <br />
                                       Permanent Address:<asp:Label ID="Label7" runat="server" Text='<%# Eval("Permanent_Address") %>'></asp:Label>
                                       <br />
                                       Temporary Address:<asp:Label ID="Label8" runat="server" Text='<%# Eval("Temporary_Address") %>'></asp:Label>
                                       <br />
                                       <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("CV") %>'>View CV/Resume</asp:HyperLink>
                                       </strong>
                                       <br />
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
</asp:Content>
