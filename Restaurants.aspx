<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Restaurants.aspx.cs" Inherits="EatiT.com.WebForm21" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mx-auto">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EaTiT-dbConnectionString %>" SelectCommand="SELECT * FROM [Restaurant_master_tbl]"></asp:SqlDataSource>        
        <asp:DataList ID="DataList1" runat="server" DataKeyField="Restaurant_ID" DataSourceID="SqlDataSource1"  cssClass="row" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" >
            <ItemTemplate>
                 <div class="container mx-auto">
                
                <div class="col-lg-12 m-lg-3 p-lg-2 mx-auto" style="width:250px;height:270px;">
                <asp:Image ID="Image1" runat="server" Height="150px" ImageAlign="Middle" ImageUrl='<%# Eval("Restaurant_imagelink") %>' Width="250px"  />
                <br />
                <strong>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Restaurant_Name") %>'></asp:Label>
                </strong>
                <br />
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Restaurant_Address") %>'></asp:Label>
                <br />
                                                 <div class="col-6 mx-auto p-0">
                        <asp:Button ID="Button1" runat="server" CssClass="btn-block" CommandArgument='<%# Eval("Restaurant_Name") %>'  Style="background-color:#CB202D;color:white;box-sizing:border-box;border:0px;border-radius:4px;" CommandName="View Menu" Text="View Menu" />
                            </div>
                    </div>
                    </div>        
            </ItemTemplate>
        </asp:DataList>
        
     </div>
</asp:Content>
