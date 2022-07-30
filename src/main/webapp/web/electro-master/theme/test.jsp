<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Regalite
  Date: 7/30/2022
  Time: 4:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1" width="800px">
    <tr>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
<%--        <th>Img</th>--%>
        <th>Amount</th>
        <th>Discount</th>
    <c:forEach items="${products}" var="p">
        <tr>
            <td>${p.getName()}</td>
            <td>${p.getPrice()}</td>
            <td>${p.getDescription()}</td>
<%--            <td>${p.getImg()}</td>--%>
            <td>${p.getAmount()}</td>
            <td>${p.getDiscount()}</td>
        </tr>
    </c:forEach>


    <!-- product -->
    <c:forEach items="${products}" var="p">
        <div class="col-md-4 col-xs-6">
            <div class="product">
                <div class="product-img">
                    <img src="${p.getImg()}"   alt="">
                    <div class="product-label">
                        <span class="new">NEW</span>
                    </div>
                </div>
                <div class="product-body">
                    <p class="product-category">Category</p>
                    <h3 class="product-name"><a href="#">${p.getName()}</a></h3>
                    <h4 class="product-price">${p.getPrice()} <del class="product-old-price"><${p.getPrice() - p.getPrice()* p.getDiscount()/100 }/del></h4>
                </div>
                <div class="add-to-cart">
                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                </div>
            </div>
        </div>
        <!-- /product -->
        <div class="clearfix visible-sm visible-xs"></div>
    </c:forEach>





</table>
</body>
</html>
