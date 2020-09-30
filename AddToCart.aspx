<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="AddToCart.aspx.cs" Inherits="EatiT.com.WebForm26" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
         .auto-style2 {
             width: 100%;
             margin-top: 0px;
         }
         .auto-style3 {
             width: 179px;
         }
         .auto-style4 {
             height: 38px;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container-fluid p-0">
        <div class="row" style="background-color:#CB202D;color:white;"> 
      <!------------------------------------------------------------------------------------------------------------------->
           <div class="col-md-4">
                <div class="row ml-md-3">
                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="White" NavigateUrl="~/OrderNow.aspx">Total Items in Cart:</asp:HyperLink>
                    <asp:Label ID="Label7" runat="server"></asp:Label>
                </div>     </div>                 
                    <div class="col-md-8">
                <div class="row">
                     <div class="col-md-1 btn btn-block"></div>     
                  <div class="col-md-1 btn btn-block">
                    <asp:LinkButton ID="LinkButton1" ForeColor="White" runat="server" OnClick="LinkButton1_Click">Food</asp:LinkButton> </div>
                   <div class="col-md-1 btn btn-block">
                    <asp:LinkButton ID="LinkButton3" ForeColor="White" runat="server" OnClick="LinkButton3_Click">Grocery</asp:LinkButton> </div>
                <div class="col-md-1 btn btn-block">
                    <asp:LinkButton ID="LinkButton4" ForeColor="White" runat="server" OnClick="LinkButton4_Click">Dairy</asp:LinkButton> </div>
               <div class="col-md-1 btn btn-block">
                    <asp:LinkButton ID="LinkButton5" ForeColor="White" runat="server" OnClick="LinkButton5_Click" >Kirana</asp:LinkButton> </div>
               <div class="col-md-1 btn btn-block">
                    <asp:LinkButton ID="LinkButton6" ForeColor="White" runat="server" OnClick="LinkButton6_Click">Bakery</asp:LinkButton> </div>
              <div class="col-md-2 btn btn-block">
                    <asp:LinkButton ID="LinkButton7" ForeColor="White" runat="server" OnClick="LinkButton7_Click" >Meat & Fish</asp:LinkButton> </div>
              <div class="col-md-1 btn btn-block">
                    <asp:LinkButton ID="LinkButton8" ForeColor="White" runat="server" OnClick="LinkButton8_Click" >Liquors</asp:LinkButton> </div>
                    <div class="col-md-1 btn btn-block">
                     <asp:LinkButton ID="LinkButton9" ForeColor="White" runat="server" OnClick="LinkButton9_Click">Medicine</asp:LinkButton>   </div>
                 <div class="col-md-2 btn btn-block">
                     <asp:LinkButton ID="LinkButton2" ForeColor="White" runat="server" OnClick="LinkButton2_Click">View All</asp:LinkButton>   </div>
               
                
</div></div>
            </div></div><!---------------------------------------------------------------------------------------------->
           <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EaTiT-dbConnectionString %>" SelectCommand="SELECT * FROM [Item_List_table] WHERE (([Item_Name] LIKE '%' + @Item_Name + '%') OR ([Restaurant_Name] LIKE '%' +@Restaurant_Name+'%') OR ([Item_Category] LIKE '%' +@Item_Category+'%') OR ([Cuisine] LIKE '%' +@Cuisine+'%'))">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Item_Name" QueryStringField="Iname" Type="String" />
                    <asp:QueryStringParameter Name="Restaurant_Name" QueryStringField="Iname" Type="String" />
                    <asp:QueryStringParameter Name="Item_Category" QueryStringField="Iname" Type="String" />
                     <asp:QueryStringParameter Name="Cuisine" QueryStringField="Iname" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource> 
    
    
              <asp:DataList ID="DataList3" runat="server"  DataKeyField="Item_ID" DataSourceID="SqlDataSource3" OnItemCommand="DataList3_ItemCommand" cssClass="row" RepeatLayout="Flow" RepeatDirection="Horizontal" >
            <ItemTemplate>
               <div class="container mx-auto">
                <div class="col-12 p-lg-3 mx-auto">
            <table class="w-80">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" style="width:250px;height:150px;" ImageAlign="Middle" ImageUrl='<%# Eval("item_imagelink") %>'/>
                    </td>
                </tr>
                <tr>
                    <td><center>
                        <asp:Label ID="Label2" runat="server" style="font-weight:700;font-family:Questrial;" Text='<%# Eval("Item_Name") %>' CssClass="auto-style1"></asp:Label>
                        <strong>&nbsp;&nbsp;&nbsp; </strong>
                        </center>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                        <center>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Restaurant_Name") %>'></asp:Label>
                            <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rs.<asp:Label ID="Label5" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </strong></center>
                            </center>
                    </td>
                </tr>
                
                                          
        <div class="input-group ">
                <tr>
                    <td>
                        <center>
                            <div class="row">
                                 <div class="col-6 mx-auto p-0">
                        <asp:Button ID="Button1" runat="server" CssClass="btn-block" CommandArgument='<%# Eval("Item_ID") %>'  Style="background-color:#CB202D;color:white;box-sizing:border-box;border:0px;border-radius:4px;" CommandName="OrderNow" Text="Order" />
                            </div>
                            <div class="col-4 p-0">
                        <asp:DropDownList ID="DropDownList1" runat="server" BackColor="#CB202D" CssClass="offset-sm-0" ForeColor="White">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                                </div>
                       
                            </div>
                            </div>
                    </center></td>
                </tr>
            </table>
                </div></div>
        </ItemTemplate>

    </asp:DataList>   
   
   
   <!---------------------------------------------------------------------------------------------------------------------------->
             
    <!----------------------------------------------------------------------------------------------------------------------->
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EaTiT-dbConnectionString %>" SelectCommand="SELECT * FROM [Item_List_table] WHERE ([Item_Category] = @Item_Category)">
                     <SelectParameters>
                <asp:QueryStringParameter Name="Item_Category" QueryStringField="Category" Type="String" />                      
            </SelectParameters>
                </asp:SqlDataSource>

              <asp:DataList ID="DataList2" runat="server" DataKeyField="Item_ID" DataSourceID="SqlDataSource2" OnItemCommand="DataList2_ItemCommand" cssClass="row" RepeatLayout="Flow" RepeatDirection="Horizontal" >
            <ItemTemplate>
               <div class="container mx-auto">
                <div class="col-12 p-lg-3 mx-auto">
            <table class="w-80">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" style="width:250px;height:150px;" ImageAlign="Middle" ImageUrl='<%# Eval("item_imagelink") %>'/>
                    </td>
                </tr>
                <tr>
                    <td><center>
                        <asp:Label ID="Label2" runat="server" style="font-weight:700;font-family:Questrial;" Text='<%# Eval("Item_Name") %>' CssClass="auto-style1"></asp:Label>
                        <strong>&nbsp;&nbsp;&nbsp; </strong>
                        </center>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                        <center>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Restaurant_Name") %>'></asp:Label>
                            <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rs.<asp:Label ID="Label5" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </strong></center>
                            </center>
                    </td>
                </tr>
                
                                          
        <div class="input-group ">
                <tr>
                    <td>
                        <center>
                            <div class="row">
                                 <div class="col-6 mx-auto p-0">
                        <asp:Button ID="Button1" runat="server" CssClass="btn-block" CommandArgument='<%# Eval("Item_ID") %>'  Style="background-color:#CB202D;color:white;box-sizing:border-box;border:0px;border-radius:4px;" CommandName="OrderNow" Text="Order" />
                            </div>
                            <div class="col-4 p-0">
                        <asp:DropDownList ID="DropDownList1" runat="server" BackColor="#CB202D" CssClass="offset-sm-0" ForeColor="White">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                                </div>
                       
                            </div>
                            </div>
                    </center></td>
                </tr>
            </table>
                </div></div>
        </ItemTemplate>

    </asp:DataList>   
    <div class="row" style="border-bottom:1px solid green;">
        <hr />
    </div>
  <!--_---------------------------------------------------------------------------------------------------------------------------------------------------->
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EaTiT-dbConnectionString %>" SelectCommand="SELECT * FROM [Item_List_table]"></asp:SqlDataSource>
           
        
                   <asp:DataList ID="DataList1" runat="server" DataKeyField="Item_ID" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand" RepeatColums="4" cssClass="row" RepeatLayout="Flow" RepeatDirection="Horizontal" >
            <ItemTemplate>
               <div class="container mx-auto">
                <div class="col-12 p-lg-3 mx-auto">
            <table class="w-80">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" style="width:250px;height:150px;" ImageAlign="Middle" ImageUrl='<%# Eval("item_imagelink") %>'/>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4"><center>
                        <asp:Label ID="Label2" runat="server" style="font-weight:700;font-family:Questrial;" Text='<%# Eval("Item_Name") %>' CssClass="auto-style1"></asp:Label>
                        <strong>&nbsp;&nbsp;&nbsp; </strong>
                        </center>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                        <center>
                            <table class="auto-style2">
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("Restaurant_Name") %>'></asp:Label>
                                    </td>
                                    <td>&nbsp; Rs:
                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </center>
                            </center>
                    </td>
                </tr>
                
                                          
        <div class="input-group ">
                <tr>
                    <td>
                        <center>
                            <div class="row">
                                 <div class="col-6 mx-auto p-0">
                        <asp:Button ID="Button1" runat="server" CssClass="btn-block" CommandArgument='<%# Eval("Item_ID") %>'  Style="background-color:#CB202D;color:white;box-sizing:border-box;border:0px;border-radius:4px;" CommandName="OrderNow" Text="Order" />
                            </div>
                            <div class="col-4 p-0">
                        <asp:DropDownList ID="DropDownList1" runat="server" BackColor="#CB202D" CssClass="offset-sm-0" ForeColor="White">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                                </div>
                       
                            </div>
                            </div>
                    </center></td>
                </tr>
            </table>
                </div></div>
        </ItemTemplate>

    </asp:DataList> 
  <!-------------------------------------------------------------------------------------------->
               
                   </div>
            </div>
            </div>
</asp:Content>
