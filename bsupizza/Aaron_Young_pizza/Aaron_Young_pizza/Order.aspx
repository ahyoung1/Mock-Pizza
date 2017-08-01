<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Aaron_Young_pizza.Order"%>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Order</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-drawer.css" />
    <link rel="stylesheet" href="css/bsuPizza.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/1.6.4/jquery.touchSwipe.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        form {
            color: white;
        }
        .Pizza {
            position:absolute;
            z-index:0;
            width:450px;
            top:-50px;
        }
        .GrilledChicken {
        position:absolute;
        z-index:1;
        width:350px;
        left:50px;
        }
        .Pepproni {
            position:absolute;
            z-index:2;
                    width:300px;
        left:100px;
        top:50px;
        }
        .Steak {
            position:absolute;
            z-index:3;
                    width:350px;
                    left:50px;
                    top:60px;
        }
    </style>

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

    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-6 hidden-sm hidden-xs">
        <asp:Image ID="ImagePizza" runat="server" ImageUrl="~/images/pizza.jpg" CssClass="Pizza" />
        <asp:Image ID="ImageChicken" runat="server" ImageUrl="~/images/GrilledChicken.png" CssClass="GrilledChicken" Visible="False" />
        <asp:Image ID="ImagePepperoni" runat="server" ImageUrl="~/images/Pepperoni.png" CssClass="Pepproni" Visible="False" />
        <asp:Image ID="ImageSteak" runat="server" ImageUrl="~/images/Steak.png" CssClass="Steak" Visible="False" />
                <asp:Label id="LabelPrice" runat="server" style="position:absolute; left:150px; top:350px" Font-Size="16pt" ForeColor="White"></asp:Label>
            </div>
            <div class="col-md-6">
                 <form runat="server" class="form-horizontal">
                     <div class="form-group">
        <asp:Label ID="Label1" runat="server" class="control-label col-sm-4" Text="Choose Pizza Size:"></asp:Label>
                     <div class="col-sm-8">
        <asp:DropDownList ID="DropDownListPizzaSize" runat="server" class="form-control" AutoPostBack="True" >
            <asp:ListItem Value="5" Selected="True">Small</asp:ListItem>
            <asp:ListItem Value="6">Medium</asp:ListItem>
            <asp:ListItem Value="7">Large</asp:ListItem>
            <asp:ListItem Value="8">Extra Large</asp:ListItem>
        </asp:DropDownList>
                         </div>
                         </div>
                       <div class="form-group">
        <asp:Label ID="Label2" runat="server" class="control-label col-sm-4" Text="Choose Pizza Style:"></asp:Label>
                            <div class="col-sm-8">
        <asp:DropDownList ID="DropDownListPizzaStyle" runat="server" class="form-control">
            <asp:ListItem Value="Sicilian">Sicilian</asp:ListItem>
            <asp:ListItem Value="Deep_Dish">Deep_Dish</asp:ListItem>
            <asp:ListItem Value="Tomato-Pie">Tomato-Pie</asp:ListItem>
            <asp:ListItem Value="Stuffed Crust">Stuffed Crust</asp:ListItem>
        </asp:DropDownList>
    </div>
                         </div>
        <asp:Label ID="Label3" runat="server" class="control-label col-sm-4" Text="Choose Toppings:"></asp:Label>
        <asp:CheckBoxList ID="CheckBoxListToppings" runat="server" AutoPostBack="True"  ForeColor="White" OnSelectedIndexChanged="CheckBoxListToppings_SelectedIndexChanged">
            <asp:ListItem Value="1">Grilled Chicken</asp:ListItem>
            <asp:ListItem Value="1">Pepperoni</asp:ListItem>
            <asp:ListItem Value="1">Steak</asp:ListItem>
        </asp:CheckBoxList>
        <asp:Button ID="ButtonNext" runat="server" Text="Order"  class="btn btn-lg btn-primary col-sm-offset-4" OnClick="ButtonNext_Click" />
    </form>
            </div>
        </div>
    </div>
    <script src="js/drawer.js"></script>
    <script src="js/bsuPizza.js"></script>
    <script src="js/jquery.localize.min.js"></script>
</body>
</html>