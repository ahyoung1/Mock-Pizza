<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Aaron_Young_pizza.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Registration</title>
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
    </div><!--Closed drawerMenu-->

    <form id="form1" runat="server" class="form-horizontal">
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="First Name" CssClass="control-label col-sm-4" for="TextBoxFName"></asp:Label>
                <div class="col-sm-4">
                    <asp:TextBox ID="TextBoxFName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="ReqFieldValidFName" runat="server" ControlToValidate="TextBoxFName" ErrorMessage="First Name is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <br />
            </div>

            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Last Name" CssClass="control-label col-sm-4" for="TextBoxLName"></asp:Label>
                <div class="col-sm-4">
                    <asp:TextBox ID="TextBoxLName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxLName" ErrorMessage="Last Name is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <br />
            </div>

            <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="User Name" CssClass="control-label col-sm-4" for="TextBoxUName"></asp:Label>
                <div class="col-sm-4">
                    <asp:TextBox ID="TextBoxUName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="User Name is required!" ControlToValidate="TextBoxUName" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <br />
            </div>

        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Email" CssClass="control-label col-sm-4" for="TextBoxEmail"></asp:Label>
            <div class="col-sm-4">
                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email is required!" ControlToValidate="TextBoxEmail" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="You must enter a valid email address!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label5" runat="server" Text="Country" CssClass="control-label col-sm-4" for="DDL_Country"></asp:Label>
            <div class="col-sm-4">
                <asp:DropDownList ID="DDL_Coutnry" runat="server" CssClass="form-control">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>United States</asp:ListItem>
                    <asp:ListItem>Mexico</asp:ListItem>
                    <asp:ListItem>Saudi Arabia</asp:ListItem>
                    <asp:ListItem>India</asp:ListItem>
                    <asp:ListItem>China</asp:ListItem>
                    <asp:ListItem>Turkey</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DDL_Coutnry" ErrorMessage="Coutnry is required!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <br />
        </div>

        <div class="form-group">
            <asp:Label ID="Label6" runat="server" Text="Password" CssClass="control-label col-sm-4" for="TB_Password"></asp:Label>
            <div class="col-sm-4">
                <asp:TextBox ID="TB_Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TB_Password" Display="Dynamic" ErrorMessage="Password is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TB_Password" Display="Dynamic" ErrorMessage="Password must be at least 6 characters without special characters!" ValidationExpression="[a-zA-Z0-9]{6,}" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <br />
        </div>

        <div class="form-group">
            <asp:Label ID="Label7" runat="server" Text="Confirm Password" CssClass="control-label col-sm-4" for="TB_Password_Confirm"></asp:Label>
            <div class="col-sm-4">
                <asp:TextBox ID="TB_Password_Confirm" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" display="Dynamic" runat="server" ErrorMessage="You must confirm your password!" ControlToValidate="TB_Password_Confirm" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" display="Dynamic" ControlToCompare="TB_Password" ControlToValidate="TB_Password_Confirm" ErrorMessage="Passwords do not match!" ForeColor="Red"></asp:CompareValidator>
            </div>
            <br />
        </div>

        <div class="form-group">
            <asp:Label ID="Label8" runat="server" Text="Age" CssClass="control-label col-sm-4" for="TB_Age"></asp:Label>
            <div class="col-sm-4">
                <asp:TextBox ID="TB_Age" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TB_Age" ErrorMessage="Age field is required!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TB_Age" ErrorMessage="You must be 18 or older!" MaximumValue="120" MinimumValue="18" Type="Integer" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
            </div>
            <br />
        </div>

        <div class="form-group">
            <asp:Label ID="Label9" runat="server" Text="Gender" CssClass="control-label col-sm-4" for="Gender"></asp:Label>
                <asp:RadioButton ID="RB_Male" runat="server" GroupName="Gender" Text="Male" />
                <asp:RadioButton ID="RB_Female" runat="server" Checked="True" GroupName="Gender" Text="Female" />
            <br />
        </div>

        <div class="form-group">
            <asp:Label ID="Label10" runat="server" Text="Welcome" CssClass="control-label col-sm-4"></asp:Label>
            <div class="col-sm-4">
                <asp:Button class="btn btn-primary" ID="BTN_Submit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" usesubmitbehavior="true"/>
                <asp:Button class="btn btn-warning" type="reset" ID="BTN_Reset" runat="server" Text="Reset" />
            </div>
        </div>
    </form>
    <script src="js/drawer.js"></script>
    <script>$("drawerMenu").drawer({ toggle: false });</script>
    <script src="js/jquery.localize.min.js"></script>
    <script src="js/bsuPizza.js"></script>
</body>
</html>
