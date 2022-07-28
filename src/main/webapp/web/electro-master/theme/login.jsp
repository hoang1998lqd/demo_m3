<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <%--    <script src="main_login.js"></script>--%>
    <link rel="stylesheet" href="../css/login-css.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.24/sweetalert2.min.js"></script>
    <style>
        ::placeholder {
            color: rgba(255, 255, 255, 0.48);
            font-size: 14px;
        }
        .foot-lnk{
            text-align:center;
            color: white;
        }
    </style>
</head>

<body>
<div class="login-wrap">
    <div class="login-html">
        <form action="sign-in" method="post" >
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
            <div class="login-form">
                <div class="sign-in-htm">
                    <div class="group">
                        <label for="user" class="label">Username or Email</label>
                        <input id="user" name="Username" type="text" class="input" placeholder="UserName or Email">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Password</label>
                        <input id="pass" type="password" name="Password" class="input" data-type="password" placeholder="Password">
                    </div>
                    <div class="group">
                        <input id="check" type="checkbox" class="check" checked>
                        <label for="check"><span class="icon"></span> Keep me Signed in</label>
                    </div>

                    <div class="group">
                        <input type="submit" class="button" value="Sign In">
                    </div>
                    <%--<div class="alert alert-danger" role="alert" style="border-radius: 25px">--%>
                    <p style="color: red;font-size: 13px"> ${mess}</p>
                    <%--                </div>--%>
                    <div class="hr" ></div>
                    <div class="foot-lnk">
                        <a href="#forgot">Forgot Password?</a>
                    </div>
                </div>
                <div class="sign-up-htm">
                    <div class="group">
                        <label for="user" class="label">Username</label>
                        <input id="user" type="text" class="input">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Password</label>
                        <input id="pass" type="password" class="input" data-type="password">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Repeat Password</label>
                        <input id="pass" type="password" class="input" data-type="password">
                    </div>

                    <div class="group">
                        <label for="pass" class="label">Full Name</label>
                        <input id="pass" type="text" class="input">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Email Address</label>
                        <input id="pass" type="text" class="input">
                    </div>

                    <div class="group">
                        <label for="pass" class="label">Phone Number</label>
                        <input id="pass" type="text" class="input">
                    </div>

                    <div class="group">
                        <label for="pass" class="label">Address</label>
                        <input id="pass" type="text" class="input">
                    </div>
                    <div class="group">
                        <input type="submit" class="button" value="Sign Up">
                    </div>
                    <div class="hr"></div>
                    <div class="foot-lnk">
                        <a for="tab-1">Already Member?</a>
                    </div>
                </div>
            </div>
        </form>

<%--        Sign UP--%>
        <form action="sign-up" method="post" >
            <div class="login-form">
                <div class="sign-in-htm">
                <div class="sign-up-htm">
                    <div class="group">
                        <label for="user" class="label">Username</label>
                        <input id="user" name="username" type="text" class="input">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Password</label>
                        <input id="pass" type="password" name="password" class="input" data-type="password">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Repeat Password</label>
                        <input id="pass" type="password"  name="repeat" class="input" data-type="password">
                        <p style="color: red; font-size: 12px"> ${messRepeat}</p>
                    </div>

                    <div class="group">
                        <label for="pass" class="label">Full Name</label>
                        <input id="pass" type="text" name="name" class="input">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Email Address</label>
                        <input id="pass" type="text" name="email" class="input">
                        <p style="color: red; font-size: 12px"> ${email}</p>
                    </div>

                    <div class="group">
                        <label for="pass" class="label">Phone Number</label>
                        <input id="pass" type="text" name="phone" class="input">
                        <p style="color: red; font-size: 12px"> ${phone}</p>
                    </div>

                    <div class="group">
                        <label for="pass" class="label">Address</label>
                        <input id="pass" type="text" name="address" class="input">
                    </div>
                    <div class="group">
                        <input type="submit" class="button" value="Sign Up">
                    </div>
                    <div class="hr"></div>
                    <div class="foot-lnk">
                        <a for="tab-1">Already Member?</a>
                    </div>
                </div>
            </div>
            </div>
        </form>
    </div>
</div>
</body>