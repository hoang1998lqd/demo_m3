<%--
  Created by IntelliJ IDEA.
  User: Regalite
  Date: 7/27/2022
  Time: 9:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<%--    <title>Store Electro - Cửa hàng bán đồ điện tử</title>--%>
    <!-- Các thẻ khác trong head -->
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
    <link rel="stylesheet" href="../css/drop-down-account.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .product .add-to-cart .add-to-cart-btn{
            height: 45px;
        }

        .dropbtn-category {
            background-color: #FFFFFF;
            color: #2B2D42;
            padding: 20px 0 31px 0;
            font-size: 14px;
            border: none;
            text-align: center;

        }

        .dropdown-category {
            position: relative;
            display: inline-block;
        }

        .dropdown-content-category {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content-category a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        .dropdown-content-category a:hover {background-color: rgba(127, 159, 182, 0.96);}

        .dropdown-category:hover .dropdown-content-category {display: block;}

        .dropdown-category:hover .dropbtn {background-color: #2B2D42;}
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
                        <div>
<%--                            <a href="#">--%>
<%--                                <i class="fa fa-heart-o"></i>--%>
<%--                                <span>Your Wishlist</span>--%>
<%--                                <div class="qty">2</div>--%>
<%--                            </a>--%>
                        </div>
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
                                    <a href="#">Xem giỏ hàng</a>
                                    <a href="check-out.jsp">Thanh toán  <i class="fa fa-arrow-circle-right"></i></a>
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
<%--                <li>--%>
<%--                    <div class="dropdown-category">--%>
<%--                        <button class="dropbtn-category" style="height: 2px;font-weight: 500; text-align: center">Danh mục </button>--%>
<%--                        <div class="dropdown-content-category">--%>
<%--                            <a href="#" style="font-size: 14px">Máy tính</a>--%>
<%--                            <a href="#" style="font-size: 14px">Điện thoại</a>--%>
<%--                            <a href="#" style="font-size: 14px">Máy ảnh</a>--%>
<%--                            <a href="#" style="font-size: 14px">Phụ kiện</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </li>--%>
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

<!-- SECTION -->
<div class="section" style="margin-top: 30px">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="../img/shop01.png" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>Bộ sưu tập <br>Máy tính</h3>
                        <a href="laptop.jsp" class="cta-btn">Mua ngay <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->

            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="../img/shop03.png" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>Bộ sưu tập<br>Phụ kiện</h3>
                        <a href="accessories.jsp" class="cta-btn">Mua ngay <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->

            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="../img/shop02.png" alt="">
                    </div>
                    <div class="shop-body">
                        <h3>Bộ sưu tập<br>Máy ảnh</h3>
                        <a href="camera.jsp" class="cta-btn">Mua ngay <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">Sản phẩm mới</h3>
                    <div class="section-nav">
                        <ul class="section-tab-nav tab-nav">
                            <li class="active"><a data-toggle="tab" href="#tab1">Máy tính</a></li>
                            <li><a data-toggle="tab" href="#tab1">Điện thoại</a></li>
                            <li><a data-toggle="tab" href="#tab1">Máy ảnh</a></li>
                            <li><a data-toggle="tab" href="#tab1">Phụ kiện</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab1" class="tab-pane active">
                            <div class="products-slick" data-nav="#slick-nav-1">
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="../img/product01.png" alt="">
                                        <div class="product-label">
                                            <span class="sale">-30%</span>
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">Category</p>
                                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
<%--                                        <div class="product-rating">--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                        </div>--%>
<%--                                        <div class="product-btns">--%>
<%--                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>--%>
<%--                                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>--%>
<%--                                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="../img/product02.png" alt="">
                                        <div class="product-label">
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">Category</p>
                                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
<%--                                        <div class="product-rating">--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star-o"></i>--%>
<%--                                        </div>--%>
<%--                                        <div class="product-btns">--%>
<%--                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>--%>
<%--                                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>--%>
<%--                                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="../img/product03.png" alt="">
                                        <div class="product-label">
                                            <span class="sale">-30%</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">Category</p>
                                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
<%--                                        <div class="product-rating">--%>
<%--                                        </div>--%>
<%--                                        <div class="product-btns">--%>
<%--                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>--%>
<%--                                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>--%>
<%--                                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="../img/product04.png" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">Category</p>
                                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
<%--                                        <div class="product-rating">--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                        </div>--%>
<%--                                        <div class="product-btns">--%>
<%--                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>--%>
<%--                                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>--%>
<%--                                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="../img/product05.png" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">Category</p>
                                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
<%--                                        <div class="product-rating">--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                        </div>--%>
<%--                                        <div class="product-btns">--%>
<%--                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>--%>
<%--                                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>--%>
<%--                                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                            </div>
                            <div id="slick-nav-1" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- HOT DEAL SECTION -->
<div id="hot-deal" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="hot-deal">
                    <ul class="hot-deal-countdown">
                        <li>
                            <div>
                                <h3>02</h3>
                                <span>Days</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3>10</h3>
                                <span>Hours</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3>34</h3>
                                <span>Mins</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3>60</h3>
                                <span>Secs</span>
                            </div>
                        </li>
                    </ul>
                    <h2 class="text-uppercase">Hot deal this week</h2>
                    <p>Ưu đã lên tới 50 %</p>
                    <a class="primary-btn cta-btn" href="#">Mua ngay</a>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /HOT DEAL SECTION -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">Top bán chạy</h3>
                    <div class="section-nav">
                        <ul class="section-tab-nav tab-nav">
                            <li class="active"><a data-toggle="tab" href="#tab2">Máy tính</a></li>
                            <li><a data-toggle="tab" href="#tab2">Điện thoại</a></li>
                            <li><a data-toggle="tab" href="#tab2">Máy ảnh</a></li>
                            <li><a data-toggle="tab" href="#tab2">Phụ kiện</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab2" class="tab-pane fade in active">
                            <div class="products-slick" data-nav="#slick-nav-2">
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="../img/product06.png" alt="">
                                        <div class="product-label">
                                            <span class="sale">-30%</span>
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">Category</p>
                                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
<%--                                        <div class="product-rating">--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                        </div>--%>
<%--                                        <div class="product-btns">--%>
<%--                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>--%>
<%--                                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>--%>
<%--                                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="../img/product07.png" alt="">
                                        <div class="product-label">
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">Category</p>
                                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
<%--                                        <div class="product-rating">--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star-o"></i>--%>
<%--                                        </div>--%>
<%--                                        <div class="product-btns">--%>
<%--                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>--%>
<%--                                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>--%>
<%--                                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="../img/product08.png" alt="">
                                        <div class="product-label">
                                            <span class="sale">-30%</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">Category</p>
                                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
<%--                                        <div class="product-rating">--%>
<%--                                        </div>--%>
<%--                                        <div class="product-btns">--%>
<%--                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>--%>
<%--                                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>--%>
<%--                                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="../img/product09.png" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">Category</p>
                                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
<%--                                        <div class="product-rating">--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                        </div>--%>
<%--                                        <div class="product-btns">--%>
<%--                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>--%>
<%--                                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>--%>
<%--                                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->

                                <!-- product -->
                                <div class="product">
                                    <div class="product-img">
                                        <img src="../img/product01.png" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">Category</p>
                                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
<%--                                        <div class="product-rating">--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                            <i class="fa fa-star"></i>--%>
<%--                                        </div>--%>
<%--                                        <div class="product-btns">--%>
<%--                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>--%>
<%--                                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>--%>
<%--                                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                    </div>
                                </div>
                                <!-- /product -->
                            </div>
                            <div id="slick-nav-2" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- /Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Top Bán chạy</h4>
                    <div class="section-nav">
                        <div id="slick-nav-3" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-3">
                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product07.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product08.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product09.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- product widget -->
                    </div>

                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product01.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product02.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product03.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- product widget -->
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Top Bán chạy</h4>
                    <div class="section-nav">
                        <div id="slick-nav-4" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-4">
                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product04.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product05.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product06.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- product widget -->
                    </div>

                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product07.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product08.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product09.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- product widget -->
                    </div>
                </div>
            </div>

            <div class="clearfix visible-sm visible-xs"></div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Top Bán chạy</h4>
                    <div class="section-nav">
                        <div id="slick-nav-5" class="products-slick-nav"></div>
                    </div>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-5">
                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product01.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product02.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product03.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- product widget -->
                    </div>

                    <div>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product04.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product05.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- /product widget -->

                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="../img/product06.png" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">Category</p>
                                <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                            </div>
                        </div>
                        <!-- product widget -->
                    </div>
                </div>
            </div>

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
                            <li><a href="laptop.jsp">Máy tính</a></li>
                            <li><a href="smart-phone.jsp">Điện thoại</a></li>
                            <li><a href="camera.jsp">Máy ảnh</a></li>
                            <li><a href="accessories.jsp">Phụ kiện</a></li>
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

