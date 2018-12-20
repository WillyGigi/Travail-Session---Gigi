<%@ Page Language="C#" MasterPageFile="~/MiniPageMaitre.Master" Inherits="Travaile_de_Session___Gigi.Image_Retouche" %>

<asp:Content 
    ContentPlaceHolderID="mini_gauche" 
    runat="server" >

    <h1>Cougard avant le lifting</h1>

    <asp:Image 
        runat="server" 
        ImageUrl="~/img/Cougard.jpg"
         Width="90%" />

</asp:Content>

<asp:Content 
    ContentPlaceHolderID="mini_droite" 
    runat="server" >

    <h1>Cougard après le lifting</h1>

    <asp:Image 
        runat="server" 
        ImageUrl="~/img/Cougard2.jpg" 
        Width="90%" />

</asp:Content>