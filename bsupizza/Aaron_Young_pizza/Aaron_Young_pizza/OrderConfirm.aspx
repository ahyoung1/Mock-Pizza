<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderConfirm.aspx.cs" Inherits="Aaron_Young_pizza.OrderConfirm" %>

<!DOCTYPE html>

<html>
    <head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Order Confirm</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-drawer.css" />
    <link rel="stylesheet" href="css/bsuPizza.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/1.6.4/jquery.touchSwipe.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>form {
        color:white;
        }</style>
</head>
<body class="has-drawer">
    <header class="container">
        <nav class="collapse navbar-collapse navbar-inverse">
            <img class="logo" src="images/bsulogo.jpg" alt="bsulogo" />
            <ul class="nav navbar-nav" id="navBar">
                <li><a href="Home.aspx" data-localize="nav.home">Home</a></li>
                <li><a href="Order.aspx" data-localize="nav.order">Order Pizza</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-localize="nav.user_info" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span>User Information</span><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="BasicUser.aspx" data-localize="nav.basic_info">Basic Information</a></li>
                        <li><a href="DeliveryInfo.aspx" data-localize="nav.deliv_info">Delivery Information</a></li>
                    </ul>
                </li>
                <li><a href="Login.aspx" data-localize="nav.login">Login</a></li>
                <li><a href="Registration.aspx" data-localize="nav.register">Become a Member</a></li>
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-localize="nav.options" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span>Options</span><span class="caret" /></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-submenu"><a href="#" data-localize="nav.languages">Languages</a>
                            <ul class="dropdown-menu">
                                <li><a href="#" id="en" data-localize="nav.english">English</a></li>
                                <li><a href="#" id="ch" data-localize="nav.chinese">Chinese</a></li>
                                <li><a href="#" id="sp" data-localize="nav.spanish">Spanish</a></li>
                            </ul>
                        </li>
                        <li><a href="#" id="help" onclick="startIntro();" data-localize="nav.tutorial">Tutorial</a></li>
                        <li><a href="AdminStuff.aspx" data-localize="nav.admin">Admin Login</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </header>
    <div id="drawerMenu" class="drawer dw-xs-8 fold">
        <div class="drawer-controls visible-xs-block">
            <a href="#drawerMenu" data-toggle="drawer" class="btn btn-primary btn-lg" style="font-size: 100px; padding: 0px 5px 0px 5px">≡</a>
        </div>
        <div class="drawer-contents">
            <div class="drawer-heading">
                <h2 class="drawer-title">Menu</h2>
            </div>
            <ul class="drawer-nav">
                <li role="presentation"><a href="Home.aspx">Home</a></li>
                <li role="presentation"><a href="Order.aspx">Order Pizza</a></li>
                <li role="presentation"><a href="BasicUser.aspx">User Info</a></li>
                <li role="presentation"><a href="DeliveryInfo.aspx">Delivery Info</a></li>
                <li role="presentation"><a href="Login.aspx">Login </a></li>
                <li role="presentation"><a href="Registration.aspx">Become a Member</a></li>
                <li role="presentation"><a href="AdminStuff.aspx">Admin Login</a></li>
            </ul>
            <div class="drawer-body">
                <p>
                    This page is for BSU Pizza store, you can order variety flavors of pizza on our website.
                    Also, this page is the sample for presentation.
                </p>
                <p><a href="#" onclick="en.click()">English</a></p>
                <p><a href="#" onclick="ch.click()">Chinese</a></p>
                <p><a href="#" onclick="sp.click()">Spanish</a></p>
                <p><a href="#" onclick="startIntro();">Help</a></p>
            </div>
            <div class="drawer-footer locked text-center">
                <small>&copy; Aaron Feng and Jeff Zhang</small>
            </div>
        </div>
    </div>
    <div class="container">
        <form id="form1" class="form-horizontal" runat="server">
            <br />
            <div class="row">
            <div class="col-sm-offset-3">
                <asp:Label ID="Label2" runat="server" Text="Your Shopping Cart is showing below:" Font-Size="X-Large"></asp:Label>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="PizzaOrder_dataSource">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                        <asp:BoundField DataField="PizzaSize" HeaderText="PizzaSize" SortExpression="PizzaSize" />
                        <asp:BoundField DataField="PizzaStyle" HeaderText="PizzaStyle" SortExpression="PizzaStyle" />
                        <asp:BoundField DataField="Toppings" HeaderText="Toppings" SortExpression="Toppings" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="PizzaOrder_dataSource" runat="server" ConnectionString="<%$ ConnectionStrings:pizzaDB %>" SelectCommand="SELECT * FROM [ShoppingCart] WHERE ([Id] = @Id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br /><br /><br />
                <asp:Label ID="AddressLabel" runat="server" Font-Size="X-Large" Text="Please input/select your address"></asp:Label>
            </div>
            </div>
            <br /><br />
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="AddressType:" CssClass="col-sm-4 control-label" for="TextBoxAddressType"></asp:Label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="TextBoxAddressType" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Address_Type" DataValueField="Delivery_ID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pizzaDB %>" SelectCommand="SELECT [Delivery_ID], [Address_Type] FROM [Delivery_Address] WHERE ([UserName] = @UserName)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="UserName" SessionField="user" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group"><asp:Label ID="Label3" runat="server" Text="AddressLine1:" CssClass="control-label col-sm-4" for="TextBoxAddressLine1"></asp:Label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="TextBoxAddressLine1" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                    <div class="form-group"><asp:Label ID="Label4" runat="server" Text="AddressLine2:" CssClass="control-label col-sm-4" for="TextBoxAddressLine2"></asp:Label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="TextBoxAddressLine2" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-sm-4">&nbsp;</div>
                    </div>
                    <div class="form-group"><asp:Label ID="Label5" runat="server" Text="ZipCode:" CssClass="control-label col-sm-4" for="TextBoxZipCode"></asp:Label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="TextBoxZipCode" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                        <div class="form-group"><asp:Label ID="Label6" runat="server" Text="Phone:" CssClass="control-label col-sm-4" for="TextBoxPhone"></asp:Label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="TextBoxPhone" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        <div class="col-sm-4"></div>
                    </div>
            <div class="col-sm-offset-3">
                <asp:Button ID="ButtonCheckOut" runat="server" class="btn btn-primary btn-lg" Text="CheckOut" OnClick="ButtonCheckOut_Click" />
            </div>
        </form>
    </div>
    <script src="js/drawer.js"></script>
    <script>$('#drawerMenu').drawer({ toggle: false });</script>
    <script src="js/jquery.localize.min.js"></script>
    <script src="js/bsuPizza.js"></script>
</body>
</html>
