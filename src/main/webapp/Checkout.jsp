<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="css/header.css">
     <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/themify-icons/themify-icons.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
     <link rel="stylesheet" href="css/shop.css">
    <title>Thanh toán</title>
</head>
<style>
    body {
        
        font-size: 17px;
        padding: 8px;
    }

    * {
        box-sizing: border-box;
    }

    h2 {
        font-size: 40px;
        background: linear-gradient(to left, #660066 0%, #ff3300 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .row {
        display: -ms-flexbox;
        /* IE10 */
        display: flex;
        -ms-flex-wrap: wrap;
        /* IE10 */
        flex-wrap: wrap;
    }

    .col-25 {
        -ms-flex: 25%;
        /* IE10 */
        flex: 25%;
    }

    .col-50 {
        -ms-flex: 50%;
        /* IE10 */
        flex: 50%;
    }

    .col-75 {
        -ms-flex: 75%;
        /* IE10 */
        flex: 75%;
    }

    .col-25,
    .col-50,
    .col-75 {
        padding: 0 16px;
    }

    .container {
        background-color: #f2f2f2;
        padding: 5px 20px 15px 20px;
        border: 1px solid lightgrey;
        border-radius: 3px;
    }

    .styleInput {
        width: 100%;
        margin-bottom: 20px;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }

    label {
        margin-bottom: 10px;
        display: block;
    }

    .icon-container {
        margin-bottom: 20px;
        padding: 7px 0;
        font-size: 24px;
    }

    .btn {
        background: linear-gradient(to left, #99ccff 0%, #003399 100%);
        color: black;
        padding: 12px;
        margin: 10px 0;
        border: none;
        width: 100%;
        border-radius: 3px;
        cursor: pointer;
        font-size: 20px;
    }

    .btn:hover {
        background: linear-gradient(to left, #003399 0%, #99ccff 100%);
    }

    a {
        color: #2196F3;
    }

    hr {
        border: 1px solid lightgrey;
    }

    span.price {
        float: right;
        color: grey;
    }

    /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
    @media (max-width: 800px) {
        .row {
            flex-direction: column-reverse;
        }

        .col-25 {
            margin-bottom: 20px;
        }
    }
</style>

<body>
<jsp:include page="Header.jsp"></jsp:include>
    <h2 style="margin:100px 0 0 30px">Checkout</h2>
    <p style="margin:0 0 10px 30px">Please checkout and pay us, before you run away.</p>
    <div class="row">
        <div class="col-75">
            <div class="container">
                <form action="checkoutCnt", method="post">

                    <div class="row" style="margin: 0px -1px; padding: 30px 0 0 0;">
                        <div class="col-50">
                            <h3 style="opacity: 0.8; margin: 0 0 10px 0">Billing Address</h3>
                            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
                            <input type="text" id="fname" name="firstname" placeholder="Ravi Raushan" class="styleInput">
                            <label for="email"><i class="fa fa-envelope"></i> Phone</label>
                            <input type="text" id="email" name="phone" placeholder="123456789" class="styleInput">
                            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
                            <input type="text" id="adr" name="address" placeholder="officers Colony" class="styleInput">
                            <label for="city"><i class="fa fa-institution"></i> City</label>
                            <input type="text" id="city" name="city" placeholder="Ranchi" class="styleInput">
                        </div>

                        <div class="col-50">
                            <h3 style="opacity: 0.8; margin: 0 0 10px 0px">Payment</h3>
                            <div class="d-block my-3">
                                <div class="custom-control custom-radio" style="">
                                    <input value="Credit card" id="credit" name="paymentMethod" type="radio" class="custom-control-input"
                                        checked="" required="" style="">
                                    <label class="custom-control-label" for="credit" style="display: inline;">Credit
                                        card</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input value="Debit card" id="debit" name="paymentMethod" type="radio" class="custom-control-input"
                                        required="">
                                    <label class="custom-control-label" for="debit" style="display: inline;">Debit
                                        card</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input value="PayPal" id="paypal" name="paymentMethod" type="radio" class="custom-control-input"
                                        required="">
                                    <label class="custom-control-label" for="paypal"
                                        style="display: inline;">PayPal</label>
                                </div>
                            </div>
                            <div class="" style="margin: 29px 0 0 6px;">
                                <div class="col-md-6 mb-3" style="display: block;">
                                    <label for="cc-name">Name on card</label>
                                    <input type="text" class="form-control styleInput" id="cc-name" placeholder="" required="" >
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="cc-number">Credit card number</label>
                                    <input type="text" class="form-control styleInput" id="cc-number" placeholder="" required="" >

                                </div>
                            </div>

                        </div>

                    </div>
                    <label>
                        <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
                    </label>
                    <input type="submit" value="Continue to checkout" class="btn">
                </form>
            </div>
        </div>
        <div class="col-25">
            <div class="container">
                <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b></b></span>
                </h4>
                <c:forEach items="${listC}" var="o">
                <p><a href="#">${o.name} </a> <span class="price">$${o.price}</span></p>
                </c:forEach>
                <hr>
                <p>Total <span class="price" style="color:black"><b>$${price}</b></span></p>

            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>

</html>