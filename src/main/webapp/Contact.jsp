<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=i, initial-scale=1.0">
    <title>Contact</title>
    <link rel="stylesheet" href="contact.css">
    <link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/themify-icons/themify-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet" href="css/shop.css">
    <link rel="stylesheet" href="css/footer.css">
    <script src="https://kit.fontawesome.com/9140a7c26d.js" crossorigin="anonymous"></script>
</head>
<style>
* {
    padding: 0;
    margin: 0;
}

.container {
    max-width: 1000px;
    margin: 50px auto;
    display: flex
}

.container-left {
    width: 65%;
    border: 1px solid #dee2e6;
    border-radius: 3px;
    box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5); 
}

.ctn-txt {
    margin-top: 30px;
    padding: 10px 60px;

}

.ctn-txt1 {
    padding: 0 60px;
    font-size: 25px;

}

.ctn-input {
    display: flex;
}

.ctn-input-txtl{
    padding: 10px 60px;
}

.ctn-input-txtr{
    padding: 10px 60px;
}

.input-txt {
    height: 30px;
    width: 150%;
    border: 1px solid #ccc;
}

.ctn-input-txtf {
    padding: 10px 60px;
}

.ctn-input-mess {
    height: 100px;
    width: 99%;
    border: 1px solid #ccc;
}

.ctn-send {
    padding: 20px 60px;
}

.send-massage {
    height: 40px;
    padding: 10px;
}

.container-right {
    margin-left: 35px;
    width: 30%;
    border-radius: 3px;
    border: 1px solid #dee2e6;
    box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5); 

}

.ctn-right-info {
    padding: 30px 40px 0 40px;
}

.ctn-right-info span{
    font-weight: bold;
    font-size: 20px;
    opacity: 0.8;
    margin-left: 5px;
}


@media only screen and (max-width: 46.1875em) {
    .container {
        max-width: 1000px;
        margin: 50px auto;
        display: block;
    }

    .container-left {
        width: 100%;
        border: 1px solid #dee2e6;
        border-radius: 3px;
        margin: 0 auto;
    }

    .ctn-txt {
        margin-top: 10px;
        padding: 10px 10px;
    }

    .ctn-txt1 {
        padding: 0 10px 20px 10px;
        font-size: 25px;
    }

    .ctn-input-txtl {
        padding: 10px 20px;
        margin-left: -8px;
    }

    .ctn-input-txtr {
        padding: 10px 65px;
        margin-left: -8px;

    }

    .ctn-input-txtf {
        padding: 10px 12px;
    }


    .ctn-input-mess {
        height: 100px;
        width: 100%;

    }

.send-massage {
    height: 40px;
    padding: 10px;
    background: #292929;
    color: white;
    border: none;
    border-radius: 3px;
}

   .ctn-send {
         padding: 20px 12px;
    }

    .container-right {
        margin-left: 0px;
        width: 100%;
        border-radius: 3px;
        border: 1px solid #dee2e6;
        border-top: none;
    }

    .ctn-right-info {
        padding: 10px 40px 0 10px;
    }

    .ctn-right-info p {
        padding: 0px 40px 0 10px;
        opacity: 0.8;
    }

    .ctn-right-info span {
        padding: 0px 40px 0 10px;
        font-weight: bold;
        font-size: 18px;
        opacity: 0.8;
    }

    .ctn-right-info i {
        margin-left: 2px;
        font-size: 18px;
        opacity: 0.8;
    }
}


</style>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<div style="height: 50px"></div>
    <div class="container" style="">
        <div class="container-left">
            <p class="ctn-txt">Get in touch</p>
            <p class="ctn-txt1">Write Us A Message</p>
            <div class="ctn-input">
                <div class="ctn-input-txtl">
                    <p>Your name</p>
                    <input type="text" class="input-txt">
                </div>
                <div class="ctn-input-txtr">
                    <p>Your subject</p>
                    <input type="text" class="input-txt">
                </div>
            </div>
            <div class="ctn-input">
                <div class="ctn-input-txtl">
                    <p>Your email</p>
                    <input type="text" class="input-txt">
                </div>
                <div class="ctn-input-txtr">
                    <p>Your phone</p>
                    <input type="text" class="input-txt">
                </div>
            </div>

            <div class="ctn-input-txtf">
                <p>Your message</p>
                <input type="text" class="ctn-input-mess">
            </div>

            <div class="ctn-send">
                 <input type="submit" value="SEND MESSAGE" class="send-massage">
            </div>
        </div>

        <div class="container-right">
            <div class="ctn-right-info">
                <i class="fa-solid fa-mobile-screen"></i>
                <span>Call us Now</span>
                <p>+8478229846</p>
                <p>+8478229846</p>
            </div>

            <div class="ctn-right-info">
                <i class="fa-regular fa-envelope"></i>
                <span>Gmail</span>
                <p>Phamthanglg2020@gmail.com</p>
                <p>Stu715105218@hnue.edu.vn</p>
            </div>

            <div class="ctn-right-info right-info_res">
                <i class="fa-regular fa-paper-plane"></i>
                <span>Out Address</span>
                <p>Thai Binh</p>
                <p>Thai Binh</p>
            </div>
            
        </div>
    </div>
    
    <jsp:include page="footer.jsp"></jsp:include>
   
</body>
</html>