<%@ Page Language="C#" MasterPageFile="~/MiniPageMaitre.Master" CodeBehind="Calendrier.aspx.cs" Inherits="Travaile_de_Session___Gigi.Calendrier" %>


<asp:Content ContentPlaceHolderID="mini_gauche" runat="server" >

    <asp:Calendar 
        id="Calendar1"  
        runat="server" 
        Height="130px" 
        Width="304px"  
        OnDayRender="Calendar1_DayRender"
        BackColor="#99CCFF" 
        TitleStyle-BackColor="#0099FF"  
        DayStyle-BorderStyle="Inset" 
        DayStyle-BorderColor="#0099FF" 
        OtherMonthDayStyle-ForeColor="#0099FF">
    </asp:Calendar>

</asp:Content>