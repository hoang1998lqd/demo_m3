<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Regalite
  Date: 7/27/2022
  Time: 9:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        .product .add-to-cart .add-to-cart-btn{
            height: 45px;
        }
        .dropbtn {
            background-color: #1E1F29;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
        }

        .dropdownAccount {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: #D10024;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {background-color: #ddd;}

        .dropdownAccount:hover .dropdown-content {display: block;}

        .dropdownAccount:hover .dropbtn {background-color: #1E1F29;}
    </style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <link rel='shortcut icon' href='/web/electro-master/img/favicon.ico' />
    <title>Electronic Store</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="../css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="../css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="../css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="../css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="../css/style.css"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i> email@email.com</a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
            </ul>
            <ul class="header-links pull-right">
                <c:if test="${sessionScope.customer != null}">
                    <a href="customer-detail.jsp" class="dropbtn">Xin ch??o ${sessionScope.customer.getName()} </a>
                </c:if>
                <div class="dropdownAccount">
                    <button class="dropbtn">T??i kho???n</button>
                    <div class="dropdown-content">
                        <c:if test="${sessionScope.customer == null}">
                            <a href="login-2.jsp">????ng nh???p</a>
                        </c:if>
                        <c:if test="${sessionScope.customer != null}">
                            <a href="customer-detail.jsp">Th??ng tin t??i kho???n</a>
                            <a href="<c:url value="/web/electro-master/theme/logout"/>"> ????ng xu???t</a>
                        </c:if>
                    </div>
                </div>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="index.jsp" class="logo">
                            <img src="../img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form>
                            <select class="input-select">
                                <option value="0">Danh m???c</option>
                                <option value="1">Laptop</option>
                                <option value="2">??i???n tho???i</option>
                                <option value="2">M??y ???nh</option>
                                <option value="2">Ph??? ki???n</option>
                            </select>
                            <input class="input" placeholder="T??m ki???m">
                            <button class="search-btn">Search</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- /Wishlist -->

                        <!-- Cart -->
                        <c:set var="size" value = "${sessionScope.size}"/>
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Gi??? h??ng</span>
                                <div class="qty">${size}</div>
                            </a>
                            <div class="cart-dropdown">
                                <div class="cart-list">
                                    <c:forEach items="${cart.getItems()}" var="item">
                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="${item.getProduct().getImg()}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="#">${item.getProduct().getName()}</a></h3>
                                                <h4 class="product-price"><span class="qty">${item.getQuantity()}x</span>${item.getProduct().getPrice()}</h4>
                                            </div>
                                            <form action="/web/electro-master/theme/item?Pid=${item.getProduct().getId()}" method="post">
                                                <button class="delete" name="id" value ="${item.getProduct().getId()}"><i class="fa fa-close" ></i></button>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="cart-summary">
                                    <c:set var="cart" value = "${sessionScope.cart}"/>
                                    <small>${size}</small>
                                    <h5>SUBTOTAL: ${cart.getTotalMoney()} VN??</h5>
                                </div>
                                <div class="cart-btns">
                                    <a href="/web/electro-master/theme/check-out">Thanh to??n  <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- /Cart -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->

<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li class="active"><a href="/web/electro-master/theme/home">Trang ch???</a></li>
                <li><a href="product.jsp">Hot Deals</a></li>
                <li><a href="/web/electro-master/theme/store">S???n ph???m</a></li>
                <li><a href="laptop.jsp">M??y t??nh</a></li>
                <li><a href="smart-phone.jsp">??i???n tho???i</a></li>
                <li><a href="camera.jsp">M??y ???nh</a></li>
                <li><a href="accessories.jsp">Ph??? ki???n</a></li>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">Th??ng tin c?? nh??n</h3>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <div class="col-md-7">
                <!-- Billing Details -->
                <c:set var="customer" value = "${sessionScope.customer}"/>
                <div class="billing-details">
                    <form action="/web/electro-master/theme/CustomerServlet" method="get">
                    <div class="section-title">
                        <h3 class="title">Thay ?????i m???t kh???u</h3>
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="old-pass"   placeholder="M???t kh???u c??">
                        <p style="color: red;font-size: 13px"> ${mess}</p>
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="new-pass"  placeholder="M???t kh???u m???i">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="repeat-pass" placeholder="Nh???p l???i m???t kh???u m???i">
                        <p style="color: red;font-size: 13px"> ${messRepeat}</p>
                    </div>
                        <c:if test="${sessionScope.customer != null}">
                                <input type="submit" class="primary-btn order-submit" value="C???p nh???t">
                        </c:if>
                        <c:if test="${sessionScope.customer == null}">
                            <form action="/web/electro-master/theme/login" method="post">
                                <a href="/web/electro-master/theme/login-2.jsp" class="primary-btn order-submit">B???n c???n ph???i ????ng nh???p</a>
                            </form>
                        </c:if>
                    </form>
                    <br>
                    <div class="section-title">
                        <h3 class="title">Th??ng tin c?? nh??n</h3>
                    </div>
                    <form action="/web/electro-master/theme/CustomerServlet" method="post">
                    <div class="form-group">
                        <input class="input" type="text" name="name" value="${customer.getName()}" placeholder="H??? v?? t??n">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="phone" value="${customer.getPhone()}" placeholder="S??? ??i???n tho???i">
                    </div>
                    <div class="form-group">
                        <input class="input" type="email" name="email" value="${customer.getEmail()}" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <input class="input" type="text" name="address" value="${customer.getAddress()}" placeholder="?????a ch???">
                    </div>
                    <c:if test="${sessionScope.customer != null}">
                            <input type="submit" class="primary-btn order-submit" value="C???p nh???t">
                    </c:if>
                    <c:if test="${sessionScope.customer == null}">
                        <form action="/web/electro-master/theme/login" method="post">
                            <a href="/web/electro-master/theme/login-2.jsp" class="primary-btn order-submit">B???n c???n ph???i ????ng nh???p</a>
                        </form>
                    </c:if>
                    </form>
                    <div class="form-group">
                        <div class="input-checkbox">
                            <input type="checkbox" id="create-account">
                            <div class="caption">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>
                                <input class="input" type="password" name="password" placeholder="Enter Your Password">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Billing Details -->
            </div>

            <!-- Order Details -->
            <c:set var="size" value = "${sessionScope.size}"/>
            <div class="col-md-5 order-details">
                <div class="section-title text-center">
                    <h3 class="title">H??nh ???nh</h3>
                    <br>
                    <br>
                    <br>
                    <h3 class="title">Comming Soon</h3>
                </div>
                <c:if test="${sessionScope.customer != null}">
                    <form action="/web/electro-master/theme/check-out" method="post">
                        <input type="submit" class="primary-btn order-submit" value="C???p nh???t" style="margin-left: 150px"></input>
                    </form>
                </c:if>
                <c:if test="${sessionScope.customer == null}">
                    <form action="/web/electro-master/theme/login" method="post">
                        <a href="/web/electro-master/theme/login-2.jsp" class="primary-btn order-submit">B???n c???n ph???i ????ng nh???p</a>
                    </form>
                </c:if>
            </div>
            <!-- /Order Details -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- NEWSLETTER -->
<div id="newsletter" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="newsletter">
                    <p>????ng k?? ????? nh???n <strong>Th??ng tin m???i nh???t</strong></p>
                    <form>
                        <input class="input" type="email" placeholder="Enter Your Email">
                        <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                    </form>
                    <ul class="newsletter-follow">
                        <li>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /NEWSLETTER -->

<!-- FOOTER -->
<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Gi???i thi???u</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Danh m???c</h3>
                        <ul class="footer-links">
                            <li><a href="#">Hot deals</a></li>
                            <li><a href="laptop.jsp">M??y t??nh</a></li>
                            <li><a href="smart-phone.jsp">??i???n tho???i</a></li>
                            <li><a href="camera.jsp">M??y ???nh</a></li>
                            <li><a href="accessories.jsp">Ph??? ki???n</a></li>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Th??ng tin</h3>
                        <ul class="footer-links">
                            <li><a href="#">Gi???i thi???u</a></li>
                            <li><a href="#">K???t n???i</a></li>
                            <li><a href="#">Ch??nh s??ch b???o m???t</a></li>
                            <%--                            <li><a href="#">Orders and Returns</a></li>--%>
                            <li><a href="#">??i???u kho???n</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">D???ch v???</h3>
                        <ul class="footer-links">
                            <%--                            <li><a href="#">My Account</a></li>--%>
                            <%--                            <div class="dropdownAccount">--%>
                            <%--                                <button class="dropbtn">T??n ng?????i d??ng ho???c Admin (Ph???n x??? l?? back)</button>--%>
                            <%--                                <div class="dropdown-content">--%>
                            <%--                                    <a href="customer-detail.jsp">T??i kho???n c???a t??i</a>--%>
                            <%--                                    <a href="#">L???ch s??? mua h??ng</a>--%>
                            <%--                                    <a href="#">????ng xu???t</a>--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>
                            <li><a href="#">Gi??? h??ng</a></li>
                            <%--                            <li><a href="#">Wishlist</a></li>--%>
                            <%--                            <li><a href="#">Track My Order</a></li>--%>
                            <li><a href="#">H??? tr???</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->

    <!-- bottom footer -->
    <div id="bottom-footer" class="section">
        <div class="container">
            <!-- row -->
            <div class="row">

                <div class="col-md-12 text-center">
                    <h3 class="footer-title" style="color: #FFFFFF">H??nh th???c thanh to??n</h3>
                    <ul class="footer-payments">
                        <li><a href="#" style="color: #B9BABC"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#" style="color: #B9BABC"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#" style="color: #B9BABC"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#" style="color: #B9BABC"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#" style="color: #B9BABC"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#" style="color: #B9BABC"><i class="fa fa-cc-amex"></i></a></li>
                    </ul>
                    <span class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This Store is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" style="color: #B9BABC">C0422H1</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/slick.min.js"></script>
<script src="../js/nouislider.min.js"></script>
<script src="../js/jquery.zoom.min.js"></script>
<script src="../js/main.js"></script>

</body>
</html>
