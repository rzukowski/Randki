<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" CodeFile="edytujprofil.aspx.cs" Inherits="edytujprofil" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxControlToolkit" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 class="ulubieni">Edytuj profil</h2>
<p align="center">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="userid" DataSourceID="SqlDataSource1" DefaultMode="Edit" 
        Height="179px" Width="307px" style="margin-right: 82px" BorderColor="#66FF66" CellPadding="2" CellSpacing="3" CaptionAlign="Bottom" >
        <AlternatingRowStyle BackColor="#FFFFCC" />
        <CommandRowStyle Height="50px" />
        <EmptyDataRowStyle HorizontalAlign="Left" />
        <Fields>
            <asp:BoundField DataField="userid" HeaderText="userid" ReadOnly="True" 
                SortExpression="userid" Visible="False" />          
             <asp:BoundField DataField="Opis" HeaderText="Opis" 
                SortExpression="opis" ControlStyle-Height="50px" ControlStyle-Width="323px" >   

<ControlStyle Height="50px" Width="300px"></ControlStyle>
            </asp:BoundField>

            <asp:TemplateField HeaderText="Data Urodzin">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%#  Bind("birthdate") %>' Height="22px" Width="300px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Format daty urodzin: yyyy-MM-dd (np. 1977-12-20)" ValidationExpression="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$" Display="Dynamic" Font-Size="13px"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("birthdate") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("birthdate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Płeć">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="plec" DataValueField="plec" SelectedValue='<%# Bind("plec") %>' Width="100px">
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("plec") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("plec") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowEditButton="True" />
            
        </Fields>
        <PagerStyle BackColor="#660066" />
        <RowStyle Height="60px" HorizontalAlign="Left" VerticalAlign="Top" />
    </asp:DetailsView>
</p>
<p>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FriendsConnectionString %>" SelectCommand="SELECT DISTINCT [plec] FROM [user_profile]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FriendsConnectionString %>" 
        SelectCommand="SELECT userid,fullname,opis,plec,birthdate=(SUBSTRING(CAST(birthdate AS VARCHAR),0,11)) FROM [user_profile] WHERE ([userid] = @userid)"
        DeleteCommand="DELETE FROM [user_profile] WHERE [userid] = @userid" 
        InsertCommand="INSERT INTO [user_profile] ([userid], [fullname],[plec],[opis],[birthdate]) VALUES (@userid, @fullname, @plec, @opis, @birthdate)" 
        UpdateCommand="UPDATE [user_profile] SET [fullname] = @fullname, [plec] = @plec, [opis]=@opis, [birthdate]=@birthdate WHERE [userid] = @userid">
    <SelectParameters>
            <asp:SessionParameter Name="userid" SessionField="userid" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="userid" Type="Object" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="fullname" Type="String" />
            <asp:Parameter Name="opis" Type="String" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="birthdate" Type="DateTime" />
            <asp:Parameter Name="userid" Type="Object" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="userid" Type="Object" />
            <asp:Parameter Name="fullname" Type="String" />
            <asp:Parameter Name="opis" Type="String" />
            <asp:Parameter Name="plec" Type="String" />
            <asp:Parameter Name="birthdate" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
</p>
     <script type="text/javascript">
         function uploadComplete(sender, args) {
             alert("Zdjęcie wrzucone!");
             var imgDisplay = $get("photo");
             window.location.reload()
             // var img = new Image();
             // img.src = "/photos/" + args.get_fileName();
             // imgDisplay.src = img.src;
         }
</script>
    <h3 class="ulubieni" dir="rtl">Zmień zdjęcie</h3>
Wybierz plik : 
    <asp:ScriptManager   
            ID="ScriptManager1"  
            runat="server"  
            >  
        </asp:ScriptManager>  
    <cc1:asyncfileupload ID="AsyncFileUpload1" runat="server" UploadingBackColor="Yellow" OnClientUploadComplete="uploadComplete"
            OnUploadedComplete="ProcessUpload" ThrobberID="spanUploading" />
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
   <asp:Label runat="server" Text=" " ID="uploadResult" />

<p align="center">
    <a href="javascript: history.go(-1)">Powrót</a></p>

</asp:Content>

