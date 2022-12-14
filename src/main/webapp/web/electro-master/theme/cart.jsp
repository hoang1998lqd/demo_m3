<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Regalite
  Date: 7/27/2022
  Time: 9:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
    <style>
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
        .product .add-to-cart .add-to-cart-btn{
            height: 45px;
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
                    <a href="customer-detail.jsp" class="dropbtn">Xin chào ${sessionScope.customer.getName()} </a>
                </c:if>
                <div class="dropdownAccount">
                    <button class="dropbtn">Tài khoản</button>
                    <div class="dropdown-content">
                        <c:if test="${sessionScope.customer == null}">
                            <a href="login-2.jsp">Đăng nhập</a>
                        </c:if>
                        <c:if test="${sessionScope.customer != null}">
                            <a href="customer-detail.jsp">Thông tin tài khoản</a>
                            <a href="<c:url value="/web/electro-master/theme/logout"/>">Đăng xuất</a>
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
                                <option value="0">Danh mục</option>
                                <option value="1">Máy tính</option>
                                <option value="2">Điện thoại</option>
                                <option value="2">Máy ảnh</option>
                                <option value="2">Phụ kiện</option>
                            </select>
                            <input class="input" placeholder="Tìm kiếm">
                            <button class="search-btn">Search</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->
                        <%--                        <div>--%>
                        <%--                            <a href="#">--%>
                        <%--                                <i class="fa fa-heart-o"></i>--%>
                        <%--                                <span>Your Wishlist</span>--%>
                        <%--                                <div class="qty">2</div>--%>
                        <%--                            </a>--%>
                        <%--                        </div>--%>
                        <!-- /Wishlist -->

                        <!-- Cart -->
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Giỏ hàng</span>
                                <div class="qty">3</div>
                            </a>
                            <div class="cart-dropdown">
                                <div class="cart-list">
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="../img/product01.png" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                            <h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
                                        </div>
                                        <button class="delete"><i class="fa fa-close"></i></button>
                                    </div>

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="../img/product02.png" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                            <h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
                                        </div>
                                        <button class="delete"><i class="fa fa-close"></i></button>
                                    </div>
                                </div>
                                <div class="cart-summary">
                                    <small>3 Item(s) selected</small>
                                    <h5>SUBTOTAL: $2940.00</h5>
                                </div>
                                <div class="cart-btns">
                                    <a href="#">Giỏ hàng</a>
                                    <a href="#">Thanh toán  <i class="fa fa-arrow-circle-right"></i></a>
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
                <li class="active"><a href="index.jsp">Trang chủ</a></li>
                <li><a href="product.jsp">Hot Deals</a></li>
                <li><a href="store.jsp">Sản phẩm</a></li>
                <li><a href="laptop.jsp">Máy tính</a></li>
                <li><a href="smart-phone.jsp">Điện thoại</a></li>
                <li><a href="camera.jsp">Máy ảnh</a></li>
                <li><a href="accessories.jsp">Phụ kiện</a></li>
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
                <h3 class="breadcrumb-header">Regular Page</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="index.jsp">Trang chủ</a></li>
                    <li class="active">Blank</li>
                </ul>
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
            <h2>Thông tin giỏ hàng:</h2>
            <table border="1">
                <tr>
                    <td>Tên sản phẩm</td>
                    <td>Ảnh</td>
                    <td>Số lượng</td>
                    <td>Giá</td>
                    <td>Tổng tiền</td>
                    <td>Lựa chọn</td>
                </tr>
                <c:forEach items="${sessionScope.cart}" var="entry">
                    <tr>
                        <td>${entry.key }</td>
                        <td>${entry.value.product.name }</td>
                        <td><img src="/finalweb10/download?image=${entry.value.product.image }" width="100" /></td>
                        <td>${entry.value.quantity }</td>
                        <td>${entry.value.unitPrice }</td>
                        <td>${entry.value.quantity * entry.value.unitPrice}</td>
                        <td><a href="/finalweb10/delete-from-cart?key=${entry.key }">Xoa</a></td>
                    </tr>
                </c:forEach>
            </table>
            <a href="/finalweb10/member/add-order">Thanh toan</a>
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
                    <p>Đăng ký để nhận <strong>Thông tin mới nhất</strong></p>
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
                        <h3 class="footer-title">Giới thiệu</h3>
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
                        <h3 class="footer-title">Danh mục</h3>
                        <ul class="footer-links">
                            <li><a href="#">Hot deals</a></li>
                            <li><a href="#">Máy tính</a></li>
                            <li><a href="#">Điện thoại</a></li>
                            <li><a href="#">Máy ảnh</a></li>
                            <li><a href="#">Phụ kiện</a></li>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Thông tin</h3>
                        <ul class="footer-links">
                            <li><a href="#">Giới thiệu</a></li>
                            <li><a href="#">Kết nối</a></li>
                            <li><a href="#">Chính sách bảo mật</a></li>
                            <%--                            <li><a href="#">Orders and Returns</a></li>--%>
                            <li><a href="#">Điều khoản</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Dịch vụ</h3>
                        <ul class="footer-links">
                            <%--                            <li><a href="#">My Account</a></li>--%>
                            <%--                            <div class="dropdownAccount">--%>
                            <%--                                <button class="dropbtn">Tên người dùng hoặc Admin (Phần xử lý back)</button>--%>
                            <%--                                <div class="dropdown-content">--%>
                            <%--                                    <a href="customer-detail.jsp">Tài khoản của tôi</a>--%>
                            <%--                                    <a href="#">Lịch sử mua hàng</a>--%>
                            <%--                                    <a href="#">Đăng xuất</a>--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>
                            <li><a href="#">Giỏ hàng</a></li>
                            <%--                            <li><a href="#">Wishlist</a></li>--%>
                            <%--                            <li><a href="#">Track My Order</a></li>--%>
                            <li><a href="#">Hỗ trợ</a></li>
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
                    <h3 class="footer-title" style="color: #FFFFFF">Hình thức thanh toán</h3>
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

