<%@ Page Language="C#" MasterPageFile="~/MiniPageMaitre.Master" %>

<script runat="server">

    void Page_Load()
    {
        if (Request.Cookies["preferences"] != null)
        {
            tb_nom.Text = Request.Cookies["preferences"]["nom"];
            tb_mail.Text = Request.Cookies["preferences"]["mail"];
            lb_user.Text = "usager connecté : " + Request.Cookies["preferences"]["nom"];
        }

    }
    
    protected void btn_valider_Click(object sender, EventArgs e)
    {
        Response.Cookies["preferences"]["nom"] = tb_nom.Text;
        Response.Cookies["preferences"]["mail"] = tb_mail.Text;
        Response.Cookies["preferences"].Expires = DateTime.MaxValue; 
    }
</script>

<asp:Content ContentPlaceHolderID="mini_gauche" runat="server">
    <center>
        <fieldset style="width:45%; height:60%; float:left" id="FS_Ip">

            <legend>Connexion</legend> <br /><br />

            <asp:Label ID="lb_nom" Text="Votre nom :" AssociatedControlID="tb_nom" runat="server">
            </asp:Label> 
            <asp:TextBox ID ="tb_nom" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lb_mail" Text="Votre mail :" AssociatedControlID="tb_mail" runat="server">
            </asp:Label> 
            <asp:TextBox ID ="tb_mail" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btn_valider" OnClick="btn_valider_Click" Text="Valider" runat="server" />
            <br />
            <br />
            <asp:Label ID="lb_user" Text="usager connecté :" runat="server">
            </asp:Label> 
        </fieldset>
        
    </center>
</asp:Content>