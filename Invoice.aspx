<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="EatiT.com.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style type="text/css">
        .auto-style6 {
            margin-left: 40px;
        }
        .auto-style13 {
            font-size: xx-large;
            height: 59px;
               width: 900px;
           }
        .auto-style14 {
            font-size: large;
        }
        .auto-style15 {
            width: 461px;
        }
        .auto-style16 {
            height: 301px;
               width: 900px;
           }
        .auto-style17 {
            width: 100%;
            height: 89px;
        }
           .auto-style18 {
               color: #ffc107;
               border-color: #ffc107;
               font-size: x-small;
           }
           .auto-style19 {
               height: 39px;
           }
           .auto-style20 {
               height: 4px;
               width: 900px;
           }
           .auto-style21 {
               width: 453px;
           }
           .auto-style22 {
               width: 100%;
               margin-left: 0px;
           }
           .auto-style23 {
               width: 900px;
           }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container w-75">
        <div class="row">
            <div class="col text-center">
         <asp:Label ID="Label1" runat="server" Style="font-size:50px;" Text="Invoice"></asp:Label></div><div class="row">
         <asp:Button ID="Button1" runat="server" height="40px"  OnClick="Button1_Click" Text="Download Invoice" BackColor="#CCCCCC" BorderStyle="Solid" ForeColor="#009933" />
   </div>
        </div>
    </div>
 
    <!----------------------------------------------------------------------------------------->
    <div class="container mx-auto w-75">
        <div class="row" style="background-color:white;border:2px solid black;">
        <asp:Panel ID="Panel1" runat="server"  HorizontalAlign="Center" Width="100%" BackColor="White" align="center">
  
           <table class="auto-style22" border="1" >
               <tr>
                   
                   <td class="auto-style13">
                       <p class="auto-style19">
                           <strong><span class="btn-outline-danger">eEatiT.com</span></strong></p>
                       <h6 style="font-size: small"><span class="col-sm-1">Inaruwa-2,Sunsari</span></h6>
                       <p style="font-size: small">
                         9867993298</p>
                   
                       <h3><span class="auto-style18">&nbsp;</span><strong><span class="auto-style14">Invoice Receipt</span></strong></h3>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style23">Order ID:<asp:Label ID="Label12" runat="server"></asp:Label>
                       <br />
                       &nbsp; Order Date:<asp:Label ID="Label9" runat="server"></asp:Label>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style23">
                       <table class="auto-style17">
                           <tr>
                               <td class="auto-style15"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Customer Address</strong>&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   <asp:Label ID="Label10" runat="server"></asp:Label>
                                   <br />
                                   Full Name:<asp:Label ID="Label13" runat="server"></asp:Label>
                                   <br />
                                   Contact Number:<asp:Label ID="Label14" runat="server"></asp:Label>
                               </td>
                               <td class="auto-style21">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Seller Address</strong>
                                   <br />
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EatiT.com&nbsp;</td>
                           </tr>
                       </table>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style16">

                       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style6" Width="811px" Height="163px">
                           <Columns>
                               <asp:BoundField DataField="sno" HeaderText="S.No" />
                               <asp:BoundField DataField="Itemid" HeaderText="Item ID" />
                               <asp:BoundField DataField="Itemname" HeaderText="Item Name" />
                               <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                               <asp:BoundField DataField="price" HeaderText="Price" />
                           </Columns>
                       </asp:GridView>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style23">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Grand Total:<asp:Label ID="Label11" runat="server"></asp:Label>
                       &nbsp;</td>
               </tr>
               <tr>
                   <td class="auto-style20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>This is a computer generated invoice.</strong> &nbsp;</td>
               </tr>
           </table>
               
          </asp:Panel>
 </div>
  </div>
</asp:Content>
