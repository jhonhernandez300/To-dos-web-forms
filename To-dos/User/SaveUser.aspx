<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveUser.aspx.cs" Inherits="To_dos.User.SaveUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
        <br />

        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
        <br /><br />

        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
        <br /><br />

        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
        <br /><br />

        <asp:Button ID="btnSave" runat="server" Text="Guardar Usuario" CssClass="btn btn-primary" OnClick="btnSave_Click" />   
    </div>
    </form>
</body>
</html>
