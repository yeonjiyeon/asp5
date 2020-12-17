<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmDataList.aspx.cs" Inherits="DevDataControl.FrmDataList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>데이터리스트 컨트롤</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:DataList ID="ctlMemoList" runat="server" DataSourceID="sdsMemoList" BorderWidth="1px"
            RepeatColumns="3"  RepeatDirection="Horizontal" DataKeyField="Num">
            <HeaderTemplate>
                <span>이름</span>
            </HeaderTemplate>
            <HeaderStyle Font-Bold="true"/>
            <ItemTemplate>
                <%# Eval("Name")%>
            </ItemTemplate>
            <ItemStyle ForeColor="Green" />
            <AlternatingItemStyle ForeColor="Blue" />
        </asp:DataList>
        <asp:SqlDataSource ID="sdsMemoList" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DevADONETConnectionString %>" 
            SelectCommand="SELECT * FROM Memos ORDER BY Num DESC"></asp:SqlDataSource>
    </form>
</body>
</html>
