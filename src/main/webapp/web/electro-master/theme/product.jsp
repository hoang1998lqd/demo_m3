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
                <div class="dropdownAccount">
                    <button class="dropbtn">T??i kho???n</button>
                    <div class="dropdown-content">
                        <c:if test="${sessionScope.customer == null}">
                            <a href="login-2.jsp">????ng nh???p</a>
                        </c:if>
                        <c:if test="${sessionScope.customer != null}">
                            <a href="customer-detail.jsp">Th??ng tin t??i kho???n</a>
                            <a href="<c:url value="/web/electro-master/theme/logout"/>">????ng xu???t</a>
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
                                <span>Gi??? h??ng</span>
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
                                        <button class="delete" type="submit" ><i class="fa fa-close"></i></button>
                                    </div>

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="../img/product02.png" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                            <h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
                                        </div>
                                        <button class="delete" type="submit"><i class="fa fa-close"></i></button>
                                    </div>
                                </div>
                                <div class="cart-summary">
                                    <small>3 Item(s) selected</small>
                                    <h5>SUBTOTAL: $2940.00</h5>
                                </div>
                                <div class="cart-btns">
                                    <a href="#">Gi??? h??ng</a>
                                    <a href="check-out.jsp">Thanh to??n  <i class="fa fa-arrow-circle-right"></i></a>
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
                <li class="active"><a href="index.jsp">Trang ch???</a></li>
                <li><a href="#">Hot Deals</a></li>
<%--                <li><a href="#">Categories</a></li>--%>
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
<%--    <div class="container">--%>
<%--        <!-- row -->--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-12">--%>
<%--                <ul class="breadcrumb-tree">--%>
<%--                    <li><a href="/web/electro-master/theme/home">Trang ch???</a></li>--%>
<%--                    <li><a href="#">All Categories</a></li>--%>
<%--                    <li><a href="#">Accessories</a></li>--%>
<%--                    <li><a href="#">Headphones</a></li>--%>
<%--                    <li class="active">Product name goes here</li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <!-- /row -->--%>
<%--    </div>--%>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- Product main img -->
            <c:set var="product" value = "${requestScope.product}"/>
            <div class="col-md-5 col-md-push-2">
                <div id="product-main-img">
                    <div class="product-preview">
                        <img src="${product.getImg()}" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="${product.getImg()}" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="${product.getImg()}" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="${product.getImg()}" alt="">
                    </div>
                </div>
            </div>
            <!-- /Product main img -->

            <!-- Product thumb imgs -->
            <div class="col-md-2  col-md-pull-5">
                <div id="product-imgs">
                    <div class="product-preview">
                        <img src="${product.getImg()}" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="${product.getImg()}" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="${product.getImg()}" alt="">
                    </div>

                    <div class="product-preview">
                        <img src="${product.getImg()}" alt="">
                    </div>
                </div>
            </div>
            <!-- /Product thumb imgs -->

            <!-- Product details -->
            <div class="col-md-5">
                <div class="product-details">
                    <h2 class="product-name">${product.getName()}</h2>

<%--                    L???y d??? li???u product theo id--%>
                    <div>
                        <h3 class="product-price">${product.getPrice() - product.getPrice() * product.getDiscount()/100 } <del class="product-old-price">${p.getPrice()}</del></h3>
                        <c:if test="${product.getAmount() > 0}">
                            <h3 class="product-name">C??n h??ng</h3>
                        </c:if>
                        <c:if test="${product.getAmount() == 0}">
                        <h3 class="product-name">T???m th???i h???t h??ng</h3>
                    </c:if>

                    </div>
                    <p>${product.getDescription()}</p>

                    <div class="product-options">
<%--&lt;%&ndash;                        <label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            Size&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <select class="input-select">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <option value="0">X</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </select>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </label>&ndash;%&gt;--%>
<%--                        <label>--%>
<%--                            M??u s???c--%>
<%--                            <select class="input-select" style="padding-right: 0;padding-left: 0" >--%>
<%--                                <option value="0">M??u ?????</option>--%>
<%--                            </select>--%>
<%--                        </label>--%>
                    </div>

                    <div class="add-to-cart">
                        <div class="qty-label">
                            ${product.getAmount()}
                            <div class="input-number">
                                <input type="number" value="1">
                                <span class="qty-up">+</span>
                                <span class="qty-down">-</span>
                            </div>
                        </div>
                        <div class="add-to-cart">
                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart" ></i> Th??m v??o gi??? h??ng</button>
                        </div>
                    </div>
                    <ul class="product-links">
                        <li>Danh m???c:</li>
                        <li><a href="laptop.jsp">${product.getCategory()}</a></li>
                    </ul>

                    <ul class="product-links">
                        <li>Share:</li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                    </ul>

                </div>
            </div>
            <!-- /Product details -->

            <!-- Product tab -->
            <div class="col-md-12">
                <div id="product-tab">
                    <!-- product tab nav -->
                    <ul class="tab-nav">
                        <li class="active"><a data-toggle="tab" href="#tab1">M?? t??? s???n ph???m</a></li>
                        <li><a data-toggle="tab" href="#tab2">Chi ti???t s???n ph???m</a></li>
                    </ul>
                    <!-- /product tab nav -->

                    <!-- product tab content -->
                    <div class="tab-content">
                        <!-- tab1  -->
                        <div id="tab1" class="tab-pane fade in active">
                            <div class="row">
                                <div class="col-md-12">
                                    <p>${product.getDescription()}</p>
                                </div>
                            </div>
                        </div>
                        <!-- /tab1  -->

                        <!-- tab2  -->
                        <div id="tab2" class="tab-pane fade in">
                            <div class="row">
                                <div class="col-md-12">
                                    <p>${product.getDescription()}</p>
                                </div>
                            </div>
                        </div>
                        <!-- /tab2  -->

                        <!-- tab3  -->
                        <div id="tab3" class="tab-pane fade in">
                            <div class="row">
                                <!-- Rating -->
                                <div class="col-md-3">
                                    <div id="rating">
                                        <div class="rating-avg">
                                            <span>4.5</span>
                                            <div class="rating-stars">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>
                                        </div>
                                        <ul class="rating">
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 80%;"></div>
                                                </div>
                                                <span class="sum">3</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 60%;"></div>
                                                </div>
                                                <span class="sum">2</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">0</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">0</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">0</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Rating -->

                                <!-- Reviews -->
<%--                                <div class="col-md-6">--%>
<%--                                    <div id="reviews">--%>
<%--                                        <ul class="reviews">--%>
<%--                                            <li>--%>
<%--                                                <div class="review-heading">--%>
<%--                                                    <h5 class="name">John</h5>--%>
<%--                                                    <p class="date">27 DEC 2018, 8:0 PM</p>--%>
<%--                                                    <div class="review-rating">--%>
<%--                                                        <i class="fa fa-star"></i>--%>
<%--                                                        <i class="fa fa-star"></i>--%>
<%--                                                        <i class="fa fa-star"></i>--%>
<%--                                                        <i class="fa fa-star"></i>--%>
<%--                                                        <i class="fa fa-star-o empty"></i>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                                <div class="review-body">--%>
<%--                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>--%>
<%--                                                </div>--%>
<%--                                            </li>--%>
<%--                                            <li>--%>
<%--                                                <div class="review-heading">--%>
<%--                                                    <h5 class="name">John</h5>--%>
<%--                                                    <p class="date">27 DEC 2018, 8:0 PM</p>--%>
<%--                                                    <div class="review-rating">--%>
<%--                                                        <i class="fa fa-star"></i>--%>
<%--                                                        <i class="fa fa-star"></i>--%>
<%--                                                        <i class="fa fa-star"></i>--%>
<%--                                                        <i class="fa fa-star"></i>--%>
<%--                                                        <i class="fa fa-star-o empty"></i>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                                <div class="review-body">--%>
<%--                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>--%>
<%--                                                </div>--%>
<%--                                            </li>--%>
<%--                                            <li>--%>
<%--                                                <div class="review-heading">--%>
<%--                                                    <h5 class="name">John</h5>--%>
<%--                                                    <p class="date">27 DEC 2018, 8:0 PM</p>--%>
<%--                                                    <div class="review-rating">--%>
<%--                                                        <i class="fa fa-star"></i>--%>
<%--                                                        <i class="fa fa-star"></i>--%>
<%--                                                        <i class="fa fa-star"></i>--%>
<%--                                                        <i class="fa fa-star"></i>--%>
<%--                                                        <i class="fa fa-star-o empty"></i>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                                <div class="review-body">--%>
<%--                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>--%>
<%--                                                </div>--%>
<%--                                            </li>--%>
<%--                                        </ul>--%>
<%--                                        <ul class="reviews-pagination">--%>
<%--                                            <li class="active">1</li>--%>
<%--                                            <li><a href="#">2</a></li>--%>
<%--                                            <li><a href="#">3</a></li>--%>
<%--                                            <li><a href="#">4</a></li>--%>
<%--                                            <li><a href="#"><i class="fa fa-angle-right"></i></a></li>--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <!-- /Reviews -->

                                <!-- Review Form -->
<%--                                <div class="col-md-3">--%>
<%--                                    <div id="review-form">--%>
<%--                                        <form class="review-form">--%>
<%--                                            <input class="input" type="text" placeholder="Your Name">--%>
<%--                                            <input class="input" type="email" placeholder="Your Email">--%>
<%--                                            <textarea class="input" placeholder="Your Review"></textarea>--%>
<%--                                            <div class="input-rating">--%>
<%--                                                <span>Your Rating: </span>--%>
<%--                                                <div class="stars">--%>
<%--                                                    <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>--%>
<%--                                                    <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>--%>
<%--                                                    <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>--%>
<%--                                                    <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>--%>
<%--                                                    <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <button class="primary-btn">Submit</button>--%>
<%--                                        </form>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <!-- /Review Form -->
                            </div>
                        </div>
                        <!-- /tab3  -->
                    </div>
                    <!-- /product tab content  -->
                </div>
            </div>
            <!-- /product tab -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- Section -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <div class="col-md-12">
                <div class="section-title text-center">
                    <h3 class="title">S???n ph???m li??n quan</h3>
                </div>
            </div>

            <!-- product -->
            <div class="col-md-3 col-xs-6">
                <div class="product">
                    <div class="product-img">
                        <img src="../img/product01.png" alt="">
                        <div class="product-label">
                            <span class="sale">-30%</span>
                        </div>
                    </div>
                    <div class="product-body">
                        <p class="product-category">Category</p>
                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
<%--                        <div class="product-rating">--%>
<%--                        </div>--%>
<%--                        <div class="product-btns">--%>
<%--                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>--%>
<%--                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>--%>
<%--                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>--%>
<%--                        </div>--%>
                    </div>
                    <div class="add-to-cart">
                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Th??m v??o gi??? </button>
                    </div>
                </div>
            </div>
            <!-- /product -->

            <!-- product -->
            <div class="col-md-3 col-xs-6">
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
<%--                        <div class="product-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                        </div>--%>
<%--                        <div class="product-btns">--%>
<%--                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>--%>
<%--                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>--%>
<%--                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>--%>
<%--                        </div>--%>
                    </div>
                    <div class="add-to-cart">
                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Th??m v??o gi??? </button>
                    </div>
                </div>
            </div>
            <!-- /product -->

            <div class="clearfix visible-sm visible-xs"></div>

            <!-- product -->
            <div class="col-md-3 col-xs-6">
                <div class="product">
                    <div class="product-img">
                        <img src="../img/product03.png" alt="">
                    </div>
                    <div class="product-body">
                        <p class="product-category">Category</p>
                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
<%--                        <div class="product-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star-o"></i>--%>
<%--                        </div>--%>
<%--                        <div class="product-btns">--%>
<%--                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>--%>
<%--                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>--%>
<%--                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>--%>
<%--                        </div>--%>
                    </div>
                    <div class="add-to-cart">
                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Th??m v??o gi??? </button>
                    </div>
                </div>
            </div>
            <!-- /product -->

            <!-- product -->
            <div class="col-md-3 col-xs-6">
                <div class="product">
                    <div class="product-img">
                        <img src="../img/product04.png" alt="">
                    </div>
                    <div class="product-body">
                        <p class="product-category">Category</p>
                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
<%--                        <div class="product-rating">--%>
<%--                        </div>--%>
<%--                        <div class="product-btns">--%>
<%--                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>--%>
<%--                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>--%>
<%--                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>--%>
<%--                        </div>--%>
                    </div>
                    <div class="add-to-cart">
                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Th??m v??o gi??? </button>
                    </div>
                </div>
            </div>
            <!-- /product -->

        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /Section -->

<!-- NEWSLETTER -->
<div id="newsletter" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="newsletter">
                    <p>Sign Up for the <strong>NEWSLETTER</strong></p>
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
                            <li><a href="#">M??y t??nh</a></li>
                            <li><a href="#">??i???n tho???i</a></li>
                            <li><a href="#">M??y ???nh</a></li>
                            <li><a href="#">Ph??? ki???n</a></li>
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

