<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Uipath_Registro_Usuario._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <hr />
    <div style="text-align:center;">
        <h1>Registro de Usuario</h1>
    </div>
    <hr />

    <div class="row">
        <div class="col-md-2">
        </div>

        <div class="col-md-4">
            <table>
                <tr>
                    <td>Cedula</td>
                    <td><asp:TextBox ID="txtCedula" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Nombre</td>
                    <td><asp:TextBox ID="txtNombre" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Apellido</td>
                    <td><asp:TextBox ID="txtApellido" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Estado Civil</td>
                    <td><asp:TextBox ID="txtEstado" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btn_Guardar" runat="server" Text="Guardar" OnClick="btn_Guardar_Click" />
                    </td>
                </tr>
            </table>
            
        </div>

        <div class="col-md-4">
            <asp:GridView ID="gv_Registro" runat="server" AutoGenerateColumns="False" DataKeyNames="Cedula" DataSourceID="sql_Usuario">
                <Columns>
                    <asp:BoundField DataField="Cedula" HeaderText="Cedula" ReadOnly="True" SortExpression="Cedula" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                    <asp:BoundField DataField="Estado_Civil" HeaderText="Estado_Civil" SortExpression="Estado_Civil" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sql_Usuario" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Vi_Usuario]"></asp:SqlDataSource>
        </div>

        <div class="col-md-2">
        </div>
    </div>

</asp:Content>
