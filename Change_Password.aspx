<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Change_Password.aspx.cs" Inherits="EatiT.com.WebForm27" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container mx-auto">
         <div class="row mx-auto">
        <table  style="border: thin solid #008080;background-color:white;padding:5px;margin:5px;">
            <tr>
                <td colspan="3">
                    <center>
                    <h2>Change Password Form</h2>
                        <center>
 
                </td>
            </tr>
            <br />
            <tr>
                <td>Enter Admin ID :
                </td>
                <td>
                    <asp:TextBox TextMode="Password" ID="TextBox1" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ControlToValidate="txtcurrentpass" ErrorMessage="!!" ForeColor="Red"
                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Enter Current Password :
                </td>
                <td>
                    <asp:TextBox TextMode="Password" ID="txtcurrentpass" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="txtcurrentpass" ErrorMessage="!!" ForeColor="Red"
                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Enter New Password :</td>
                <td>
                    <asp:TextBox TextMode="Password" ID="txtnewpass" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="txtnewpass" ErrorMessage="!!" ForeColor="Red"
                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Confirm Password : </td>
                <td>
                    <asp:TextBox TextMode="Password" ID="txtconfirmpass" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ControlToValidate="txtconfirmpass" ErrorMessage="!!" ForeColor="Red"
                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server"
                        ControlToCompare="txtnewpass" ControlToValidate="txtconfirmpass"
                        ErrorMessage="passwordnot same !!" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnchangepass" CssClass="btn btn-block btn-success" runat="server" Text="Change Password"
                        OnClick="btnchangepass_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td  colspan="2">
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
        </table>
             </div>
         </div>
 
</asp:Content>
