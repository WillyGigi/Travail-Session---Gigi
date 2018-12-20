<%@ Page Language="C#" MasterPageFile="~/MiniPageMaitre.Master" Title="Nos Clients" Culture="fr-CA" UICulture="Auto" %>

<script runat="server">

    protected void ib_nom_Click(object sender, ImageClickEventArgs e)
    {
        //SDS_Nom.InsertParameters["Id_Nom"].DefaultValue= ib_nom.
        SDS_Nom.InsertParameters["Nom"].DefaultValue = tb_nom.Text;
        SDS_Nom.Insert();
    }
</script>


<asp:Content runat="server" ID="c2" ContentPlaceHolderID="mini_gauche" >
   <center>
        <h2>Nos Clients</h2>

        <asp:GridView 
            ID="GV_Nom"  
            runat="server" AllowPaging="True"
            AutoGenerateColumns="False" 
            DataKeyNames="Id_Nom" 
            DataSourceID="SDS_Nom"  
            CssClass="GV_Style" 
            HeaderStyle-CssClass="tb_Entete" 
            RowStyle-CssClass="lgnTableau"
            AlternatingRowStyle-CssClass="alterne" PageSize="3" 
            PagerSettings-Mode="NextPreviousFirstLast" 
            PagerSettings-PreviousPageText="précédent" 
            PagerSettings-NextPageText="suivant" 
            PagerStyle-BackColor="#6699FF" 
            PagerStyle-ForeColor="#000099">
<AlternatingRowStyle CssClass="alterne"></AlternatingRowStyle>
            <Columns>
                <asp:TemplateField>
                     <ItemTemplate>
                         &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton 
                            runat="server" 
                            ID="IB_Modifier" 
                            imageUrl="Img/Modif.png" 
                            ToolTip="Modifier"
                            Width="25px" 
                            Height="25px"
                            CommandName="Edit" />

                         &nbsp;&nbsp;&nbsp;&nbsp;
                         
                         <asp:ImageButton 
                             runat="server" 
                             ID="IB_delete"
                             ImageUrl="Img/delete.png" 
                             ToolTip="Supprimer" 
                             Width="25px" 
                             Height="25px"
                             CommandName="Delete" />

                     </ItemTemplate>

                     <EditItemTemplate>
                         &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton 
                            runat="server" 
                            ID="imageButtonEnregistrer" 
                            imageUrl="Img/Valider.png"
                            ToolTip="Valider"
                            Width="25px" 
                            Height="25px"
                            CommandName="Update" />
                         &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton 
                            runat="server" 
                            ID="imageButtonAnnuler" 
                            imageUrl="Img/Annuler.png"
                            ToolTip="Annuler"
                            Width="25px" 
                            Height="25px"
                            CommandName="Cancel" />

                     </EditItemTemplate>

                  </asp:TemplateField>

                <asp:TemplateField HeaderText="Id" SortExpression="Id_Nom" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id_Nom") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id_Nom") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField 
                    DataField="Nom" 
                    HeaderText="Nom" 
                    SortExpression="Nom" />
            </Columns>

<HeaderStyle CssClass="tb_Entete"></HeaderStyle>

<PagerSettings Mode="NextPreviousFirstLast" NextPageText="suivant" PreviousPageText="pr&#233;c&#233;dent"></PagerSettings>

<PagerStyle BackColor="#6699FF" ForeColor="#000099"></PagerStyle>

<RowStyle CssClass="lgnTableau"></RowStyle>
        </asp:GridView>

        <asp:SqlDataSource 
            ID="SDS_Nom" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:CS_Nom %>" 
            SelectCommand="SELECT * FROM [Nom]" 
            UpdateCommand="UPDATE Nom SET Nom = @Nom Where Id_Nom = @Id_Nom" 
            DeleteCommand="DELETE FROM [Nom] Where Id_Nom = @Id_Nom" 
            InsertCommand="INSERT INTO [Nom] (Id_Nom, Nom) VALUES (@Nom)"  >
            <InsertParameters>
                <asp:Parameter Name="Id_Nom" Type = "String" />
                <asp:Parameter Name="Nom"  Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>


       </center>
        <br />
        <br />
</asp:Content>

<asp:Content ID="Content1" runat="server" contentplaceholderid="mini_droite">

    <br />
    <br />
    <fieldset style="width:30%; height:70%; float:left" id="FS_Ip">

    <legend>Nouveau client</legend> <br />

    <asp:Label  
        ID="lb_nom" 
        runat="server"  
        Text="Nom"
        AssociatedControlID="tb_nom">
    </asp:Label>
    <br />
    <asp:TextBox 
        ID="tb_nom" 
        runat="server" >
    </asp:TextBox>

    <asp:ImageButton runat="server" 
        ImageUrl="~/img/ajoute.png" 
        CommandName="Insert" 
        OnClick="ib_nom_Click" 
        BorderStyle="None" 
        ToolTip="Insérer personne" 
        Width="20px" ClientIDMode="AutoID" 
        ImageAlign="AbsBottom" ID="ib_nom" />

    </fieldset>

</asp:Content>
