<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="EatiT.com.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Notifications</h4>
                           <asp:Label class="badge badge-pill badge-info" ID="Label2" runat="server" Text="Latest"></asp:Label>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                         <marquee direction="right" bgcolor="white">
                               <a href="Careers.aspx"><strong>Apply Now To Join Our Team</strong></a></marquee>
                                  
                        <hr>
                     </div>
                  </div>
                   <div class="card-body">
                 <div class="row">
                     
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EaTiT-dbConnectionString %>" SelectCommand="SELECT * FROM [Notice_Board_Table]"></asp:SqlDataSource>
              <div class="col-8 mx-auto" > <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Notice_Number" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Justify" Width="100%">
                   <AlternatingRowStyle BackColor="White" />
                   <Columns> <asp:TemplateField>
              <HeaderTemplate>
                        Serial No.
              </HeaderTemplate>
              <ItemTemplate>
                  <%# Container.DataItemIndex + 1 %>
              </ItemTemplate>
              <ItemStyle Width="50px" />
          </asp:TemplateField>
                       <asp:TemplateField>
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
                   <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                   <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                   <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                   <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                   <SelectedRowStyle BackColor="#FFCC66" ForeColor="Navy" Font-Bold="True" />
                   <SortedAscendingCellStyle BackColor="#FDF5AC" />
                   <SortedAscendingHeaderStyle BackColor="#4D0000" />
                   <SortedDescendingCellStyle BackColor="#FCF6C0" />
                   <SortedDescendingHeaderStyle BackColor="#820000" />
               </asp:GridView>
               </div>
               </div></div>
            </div>
</div>
</asp:Content>
