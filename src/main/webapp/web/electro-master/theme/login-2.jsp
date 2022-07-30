<%--@elvariable id="phone" type=""--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Regalite
  Date: 7/28/2022
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel='shortcut icon' href='/web/electro-master/img/favicon.ico' />
    <title>Electronic Store</title>
    <style>
        body{
            margin:0;
            color:#6a6f8c;
            background:#c8c8c8;
            font:600 16px/18px 'Open Sans',sans-serif;
        }

        .login-box{
            width:100%;
            margin:auto;
            max-width:525px;
            min-height:670px;
            position:relative;
            background:url(https://images.unsplash.com/photo-1507208773393-40d9fc670acf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1268&q=80) no-repeat center;
            box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
        }
        .login-snip{
            width:100%;
            height:600px;
            position:absolute;
            padding:90px 70px 50px 70px;
            background:rgba(0, 77, 77,.9);
        }
        .login-snip .login,
        .login-snip .sign-up-form{
            top:0;
            left:0;
            right:0;
            bottom:0;
            position:absolute;
            transform:rotateY(180deg);
            backface-visibility:hidden;
            transition:all .4s linear;
        }
        .login-snip .sign-in,
        .login-snip .sign-up,
        .login-space .group .check{
            display:none;
        }
        .login-snip .tab,
        .login-space .group .label,
        .login-space .group .button{
            text-transform:uppercase;
        }
        .login-snip .tab{
            font-size:22px;
            margin-right:15px;
            padding-bottom:5px;
            margin:0 15px 10px 0;
            display:inline-block;
            border-bottom:2px solid transparent;
        }
        .login-snip .sign-in:checked + .tab,
        .login-snip .sign-up:checked + .tab{
            color:#fff;
            border-color:#1161ee;
        }
        .login-space{
            min-height:345px;
            position:relative;
            perspective:1000px;
            transform-style:preserve-3d;
        }
        .login-space .group{
            margin-bottom:15px;
        }
        .login-space .group .label,
        .login-space .group .input,
        .login-space .group .button{
            width:100%;
            color:#fff;
            display:block;
        }
        .login-space .group .input,
        .login-space .group .button{
            border:none;
            padding:15px 20px;
            border-radius:25px;
            background:rgba(255,255,255,.1);
        }
        .login-space .group input[data-type="password"]{
            text-security:circle;
            -webkit-text-security:circle;
        }
        .login-space .group .label{
            color:#aaa;
            font-size:12px;
        }
        .login-space .group .button{
            background:#1161ee;
        }
        .login-space .group label .icon{
            width:15px;
            height:15px;
            border-radius:2px;
            position:relative;
            display:inline-block;
            background:rgba(255,255,255,.1);
        }
        .login-space .group label .icon:before,
        .login-space .group label .icon:after{
            content:'';
            width:10px;
            height:2px;
            background:#fff;
            position:absolute;
            transition:all .2s ease-in-out 0s;
        }
        .login-space .group label .icon:before{
            left:3px;
            width:5px;
            bottom:6px;
            transform:scale(0) rotate(0);
        }
        .login-space .group label .icon:after{
            top:6px;
            right:0;
            transform:scale(0) rotate(0);
        }
        .login-space .group .check:checked + label{
            color:#fff;
        }
        .login-space .group .check:checked + label .icon{
            background:#1161ee;
        }
        .login-space .group .check:checked + label .icon:before{
            transform:scale(1) rotate(45deg);
        }
        .login-space .group .check:checked + label .icon:after{
            transform:scale(1) rotate(-45deg);
        }
        .login-snip .sign-in:checked + .tab + .sign-up + .tab + .login-space .login{
            transform:rotate(0);
        }
        .login-snip .sign-up:checked + .tab + .login-space .sign-up-form{
            transform:rotate(0);
        }

        *,:after,:before{box-sizing:border-box}
        .clearfix:after,.clearfix:before{content:'';display:table}
        .clearfix:after{clear:both;display:block}
        a{color:inherit;text-decoration:none}


        .hr{
            height:2px;
            margin:60px 0 50px 0;
            background:rgba(255,255,255,.2);
        }
        .foot{
            text-align:center;
        }
        .card{
            width: 500px;
            left: 100px;
        }

        ::placeholder{
            color: #b3b3b3;
        }
    </style>
</head>
<body>
<div class ="row">
    <div class="col-md-6 mx-auto p-0">
        <div class="card">
            <div class="login-box" style="height: 800px; margin-left: 500px">
                <div class="login-snip" style="height: 800px">
                    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Đăng Nhập</label>
                    <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Đăng Ký</label>
                    <div class="login-space">
                        <c:if test="${messageSignIn != null}">
                        <form action="<c:url value="/web/electro-master/theme/login?action=sign-in"/>" method="post" style=" display: none">
                            </c:if>
                        <form action="<c:url value="/web/electro-master/theme/login?action=sign-in"/>" method="post">
                            <div class="login">
                                <div class="group">
                                    <label for="user" class="label">Tài khoản</label>
                                    <input id="user" type="text" class="input" name="Username" placeholder="Tên tài khoản hoặc Email">
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">Mật khẩu</label>
                                    <input id="pass" type="password" class="input" data-type="password" name="Password" placeholder="Nhập mật khẩu">
                                </div>
                                <div class="group">
                                    <input id="check" type="checkbox" class="check" checked>
                                    <label for="check"><span class="icon"></span> Keep me Signed in</label>
                                </div>
                                <div class="group">
                                    <input type="submit" class="button" value="Đăng nhập" style="font-weight: bold">
                                </div>
                                <p style="color: red;font-size: 13px"> ${mess}</p>
                                <div class="hr"></div>
                                <div class="foot">
                                    <a href="#">Quên mật khẩu?</a>
                                </div>
                            </div>
                        </form>
                               <c:if test="${messageSignUp = null}">
                                <form action="<c:url value="/web/electro-master/theme/login?action=sign-up"/>" method="post"  style="display: none">
                                    </c:if>
                        <form action="<c:url value="/web/electro-master/theme/login?action=sign-up"/>" method="post" >
                            <div class="sign-up-form">
                                <div class="group">
                                    <label for="user" class="label">Tài khoản</label>
                                    <input id="user" name="Username" type="text" class="input" placeholder="Tên tài khoản" value="${requestScope.c.getAccount()}"  >
                                    <p style="color: red; font-size: 12px"> ${username}</p>
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">Mật khẩu</label>
                                    <input id="pass" type="Password" name="Password" class="input" data-type="password" placeholder="Tạo mật khẩu">
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">Nhập lại mât khẩu</label>
                                    <input id="pass" type="Repeat" name="Repeat" class="input" data-type="password" placeholder="Nhập lại mật khẩu" >
                                    <p style="color: red; font-size: 12px"> ${messRepeat}</p>
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">Họ và tên</label>
                                    <input id="pass" type="text" class="input" name="Name" placeholder="Nguyễn Văn A" value="${requestScope.c.getName()}">
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">Địa chỉ Email</label>
                                    <input id="pass" type="text" class="input" name="Email" placeholder="abc@gmail.com"  value="${requestScope.c.getEmail()}">
                                    <p style="color: red; font-size: 12px"> ${email}</p>
                                </div>
                                <div class="group">
                                    <label for="pass" class="label">Số điện thoại</label>
                                    <input id="pass" type="text" class="input" name="Phone" placeholder="0345xxx" value="${requestScope.c.getPhone()}">
                                 <p style="color: red; font-size: 12px"> ${phone}</p>
                                </div><div class="group">
                                    <label for="pass" class="label">Địa chỉ liên hệ</label>
                                    <input id="pass" type="text" class="input" name="Address" placeholder="Nhập địa chỉ liên hệ." value="${requestScope.c.getAddress()}">
                                </div>
                                <div class="group">
                                    <input type="submit" class="button" value="Đăng ký" style="font-weight: bold">
                                </div>
                                <div class="hr"></div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>