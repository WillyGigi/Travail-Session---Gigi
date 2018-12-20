<%@ Page Language="C#" MasterPageFile="~/PageMaitre.Master" Title="Accueil" Culture="fr-CA" UICulture="Auto" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.PreviousPage != null)
        {
            Label id = (Label)Page.PreviousPage.FindControl("lb_id");
            Label prenom = (Label)Page.PreviousPage.FindControl("lb_Nom");
                
            if (!IsPostBack)
            {
                SDS_Voiture.SelectCommand = "SELECT [Marque], [Model], [Couleur] FROM [Voiture] WHERE [Id_Nom] = '" + id.Text + "'";
                GV_Voiture.DataBind(); //met à jour le tableau 
                Lb_Info.Text = prenom.Text + "posséde " + GV_Voiture.Rows.Count.ToString() + " voiture(s).";
            }
        }
    }

</script>

        
<asp:Content 
    ID="c3" 
    ContentPlaceHolderID="cph_contenu"
    runat="server">

    <asp:Label ID="Lb_Info" runat="server" Font-Size="Large" ></asp:Label>

        <br />
        <br />
        <asp:GridView 
            ID="GV_Voiture" 
            runat="server" 
            AutoGenerateColumns="False" 
            DataSourceID="SDS_Voiture"
            CssClass="GV_Style" 
            HeaderStyle-CssClass="Entete"  
            RowStyle-CssClass="lgnTableau"
            AlternatingRowStyle-CssClass="alterne">
            <Columns>
                <asp:BoundField
                     DataField="Marque" 
                    HeaderText="Marque" 
                    SortExpression="Marque" />
                <asp:BoundField 
                    DataField="Model" 
                    HeaderText="Model" 
                    SortExpression="Model" />
                <asp:BoundField 
                    DataField="Couleur" 
                    HeaderText="Couleur" 
                    SortExpression="Couleur" />
            </Columns>
        </asp:GridView>

    <asp:SqlDataSource 
        ID="SDS_Voiture" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:CS_Nom %>">
    </asp:SqlDataSource>


</asp:Content>
