<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveUser.aspx.cs" Inherits="To_dos.User.SaveUser" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registro de Usuario</title>

    <%-- CSS --%>
    <link href="~/Content/SaveUser.css" rel="stylesheet" type="text/css" />

    <%-- JavaScript --%>
    <script type="text/javascript">
        function showPasswordRequirements() {
            document.getElementById("passwordRequirements").style.display = "block";
        }

        function hidePasswordRequirements() {
            document.getElementById("passwordRequirements").style.display = "none";
        }

        function validatePasswordRequirements() {
            const password = document.getElementById('<%= txtPassword.ClientID %>').value;

            const upper = /[A-Z]/.test(password);
            const lower = /[a-z]/.test(password);
            const number = /[0-9]/.test(password);
            const length = password.length >= 8;

            document.getElementById("reqUpper").className = upper ? "valid" : "invalid";
            document.getElementById("reqLower").className = lower ? "valid" : "invalid";
            document.getElementById("reqNumber").className = number ? "valid" : "invalid";
            document.getElementById("reqLength").className = length ? "valid" : "invalid";
        }
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
            <br />

            <div class="input-icon" data-icon="👤">
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Nombre de Usuario" />
            </div>
            <br /><br />

            <div class="input-icon" data-icon="📧">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Correo Electrónico" />
            </div>
            <br /><br />

            <div class="input-icon" data-icon="🔒">
                <asp:TextBox 
                    ID="txtPassword" 
                    runat="server" 
                    CssClass="form-control"
                    TextMode="Password"
                    placeholder="Contraseña"
                    onfocus="showPasswordRequirements()" 
                    onblur="hidePasswordRequirements()" 
                    onkeyup="validatePasswordRequirements()" />
            </div>

            <div id="passwordRequirements" style="display:none; font-size: 0.9em; color: #555; padding: 8px 0;">
                <ul style="margin: 0; padding-left: 20px;">
                    <li id="reqUpper">Al menos 1 mayúscula</li>
                    <li id="reqLower">Al menos 1 minúscula</li>
                    <li id="reqNumber">Al menos 1 número</li>
                    <li id="reqLength">Mínimo 8 caracteres</li>
                </ul>
            </div>
            <br /><br />

            <asp:Button ID="btnSave" runat="server" Text="Guardar Usuario" CssClass="btn btn-primary" OnClick="btnSave_Click" />   
        </div>
    </form>
</body>
</html>
