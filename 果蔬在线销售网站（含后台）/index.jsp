<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = (String)request.getSession().getAttribute("username");
	String isLogin = (String)request.getSession().getAttribute("isLogin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>果蔬店</title>
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="./css/public.css">
<style>
    /* 结构布局开始 */
    header{width: 100%;height: 170px;}
    article{width: 100%;}
    #header{width: 1120px;height: 130px;margin:0 auto;}
    #content{width: 1120px;margin: 0 auto;}
    /* 结构布局结束 */

    /*公共样式开始*/
    i{width: 1px;background: #A9A9AB;display: inline-block;margin: 0px 5px;}
    .shadediv{background: black;opacity: 0.3;position: absolute;top: 0;left: 0;z-index: 100;}
    /*公共样式结束*/

    /* 登录框样式开始 */
    .loginbox{width: 325px;height: 250px;position: absolute;top: 50%;left: 50%;margin-top: -125px;margin-left: -162px;z-index: 101;
    border: 1px solid black;text-align: center;background: white;opacity: 1;}
    .loginbox .loginheader{border-bottom: 1px solid #7B7B77;height: 40px;width:100%;line-height: 40px;position: relative;font-size: 15px;}
    .loginbox .loginheader i{width: 30px;height: 30px;position: absolute;right: 0px;top: 5px;background: url(./images/close.png) no-repeat;
    background-size: 30px 30px;cursor: pointer;}
    .loginbox form div{position: relative;margin-top: 20px;}
    .loginbox form div:first-child{margin-top: 40px;}
    .loginbox .loginInput{border-radius: 5px;width: 170px;height: 35px;outline: none;padding-left: 40px;}
    .loginbox img{position: absolute;top: 5px;left: 60px;}
    .loginbox .loginUser{width:30px;height: 30px;}
    .loginbox .loginBtn{width: 70px;height: 35px;margin-top: 20px;}
    /* 登陆框样式结束 */

    /* 注册框样式开始 */
    .registerbox{width: 325px;height: 400px;position: absolute;top: 50%;left: 50%;margin-top: -200px;margin-left: -162px;z-index: 101;
    border: 1px solid black;text-align: center;background: white;opacity: 1;}
    .registerbox .registerheader{border-bottom: 1px solid #7B7B77;height: 40px;width:100%;line-height: 40px;position: relative;font-size: 15px;}
    .registerbox .registerheader i{width: 30px;height: 30px;position: absolute;right: 0px;top: 5px;background: url(./images/close.png) no-repeat;
    background-size: 30px 30px;cursor: pointer;}
    .registerbox form div{position: relative;margin-top: 20px;}
    .registerbox form div:first-child{margin-top: 40px;}
    .registerbox .registerInput{border-radius: 5px;width: 170px;height: 35px;outline: none;padding-left: 40px;}
    .registerbox img{position: absolute;top: 5px;left: 60px;}
    .registerbox .registerUser{width:30px;height: 30px;}
    .registerbox .registerBtn{width: 70px;height: 35px;margin-top: 20px;}
    /* 注册框样式结束 */

    /* 购物框样式开始 */
    .
    /* 购物框样式结束 */

    /*头部部分开始*/
    #hhhhhh{width: 0px;}
    #hlogo{width: 190px;height: 130px;background: url(./images/logo.png) no-repeat;background-size: 130px 130px;text-align: center;line-height: 170px;
    background-position-x:30px;float: left;}
    #header #hleft{width: 930px;height: 130px;float: left;position: relative;}
    nav{width: 100%;height: 30px;text-align: right;line-height: 30px;font-size: 15px;background:#BDBFC5;}
    nav #nav{width: 1120px;height: 30px;margin: 0 auto;}
    nav i{height:10px;}
    nav span{text-align: center;cursor: pointer;}
    nav span:last-child{margin-right: 10px;}
    nav span:hover{color: red;}
    #hleft .search{width: 550px;height: 36px;position:absolute;top: 50%;left: 75px;margin-top: -18px;}
    #hleft .search .searchinput{width: 498px;height: 34px;border: 1px solid #00CC48;outline: none;font-size: 15px;line-height: 36px;float: left;}
    #hleft .search .btn{width:48px;height: 36px;background: #00CC48;outline: none;border:  none; float: left;line-height: 36px;
    text-align: center;cursor: pointer;}
    #hleft .search .btn span{width: 20px;height: 20px;display: inline-block;margin-top: 8px;background: url(./images/search.png) no-repeat;
    background-size: 20px 20px;}
    #hleft .shoppingcart{width: 190px;height: 36px;position: absolute;top: 50%;left: 680px;margin-top: -18px;text-align: center;
    line-height: 36px;border:1px solid black;position: relative;cursor: pointer;z-index: 30;background: white;}
    #hleft .shoppingcart .carticon{width: 20px;height: 20px;background: url(./images/cart.png) no-repeat;background-size: 20px 20px;
    display: inline-block;vertical-align: middle;margin-right: 3px;}
    #hleft .shoppingcart .number{position: absolute;width: 15px;height: 15px;right: 38px;top: 5px;background: red;line-height: 15px;
    text-align: center;border-radius: 50%;color: white;}
    #hleft .shoppingcart .cart{width: 263px;height: 300px;background: white;position: absolute;top: 35px;left: -74px;border: 1px solid black;
    z-index: 1;display: none;}
    #hleft .shoppingcart:hover{border-bottom: 1px solid white;}
    #hleft .shoppingcart:hover .cart{display: block;cursor:default;}
    #hleft .shoppingcart .cartContent{width: 100%;height: 270px;overflow: auto;}
    #hleft .shoppingcart .cartBtn{width: 100%;height: 30px;text-align: center;background: red;line-height: 30px;font-size: 20px;
    cursor: pointer;z-index: 20;}
    #hleft .shoppingcart .cartContent .cartStaff div{float: left;height: 30px;line-height: 30px;}
    #hleft .shoppingcart .cartContent .cartStaff div.cSGood{margin-left: 20px;font-size: 15px;vertical-align: middle;}
    #hleft .shoppingcart .cartContent .cartStaff div.cSCheckbox{vertical-align: middle;margin-left: 5px;}
    #hleft .shoppingcart .cartContent .cartStaff div.cSCheckbox input{display: inline-block;}
    /*头部部分结束*/

    /* article部分开始 */
    #content #hotcontent{width: 180px;height: 765px;float: left;box-shadow: 0 0 1px black;}
    #content #goodcontent{width: 900px;box-shadow: 0 0 1px black;float: left;margin-left: 40px;}
    #goodcontent .showgood{width: 100%;height: 765px;}
    #goodcontent .showgood .goods{width: 200px;height: 250px;float: left;margin-left: 20px;margin-top:5px;position: relative;}
    #goodcontent .showgood .goods:hover{box-shadow: 1px 1px 5px #AFB6B2}
    #goodcontent .showgood .goods div.buynum{width: 200px;height: 45px;position: absolute;bottom: 0px;left: 0px;opacity: 0;
    transition:1s;z-index: 10;background: white;}
    #goodcontent .showgood .goods:hover div.buynum{bottom: -45px;opacity: 1;line-height: 45px;}
    #goodcontent .showgood .goods div.buynum input{width: 50px;height: 25px;margin-top: 10px;}
    #goodcontent .showgood .goods img{width: 178px;height: 160px;display: block;}
    #goodcontent .showgood .goods div{float: left;}
    #goodcontent .showgood .goods div:nth-of-type(1){width: 100px;height: 30px;line-height: 30px;text-align: center;font-size: 18px;
    font-weight: bold;}
    #goodcontent .showgood .goods div:nth-of-type(2){width:70px;height: 30px; line-height: 30px;text-align: left;}
    #goodcontent .showgood .goods div:nth-of-type(2) span{color: red;}
    #goodcontent .showgood .goods div:nth-of-type(3){margin-left: 10px;}
    #goodcontent .showgood .goods div:nth-of-type(4){margin-left: 10px;}
    #goodcontent .showgood .goods div:nth-of-type(5){width: 60px;height: 20px;position: absolute;bottom: 10px;right: 10px;font-size: 12px;
    background: red;color: white;cursor: pointer;text-align: center;line-height: 20px;}
    #goodcontent .pages{width: 100%;height: 40px;margin-top: 10px;background: yellow;}
    /* article部分结束 */
</style>
<script src="./js/jquery-1.12.1.min.js"></script>
<script>
    window.onload = function(){
        var oBody = document.getElementsByTagName('body')[0];
        var oNav = document.getElementById("nav");
        var oSpan0 = oNav.getElementsByTagName('span')[0];
        var oSpan1 = oNav.getElementsByTagName('span')[1];
        var oShadeDiv = null;
        var nowPage = 1;
        var oGoods = document.getElementsByClassName("showgood")[0];
        var oCartContent = document.getElementsByClassName("cartContent")[0];
 		var sUsername = "";
        var sIsLogin = "<%= isLogin %>"
        var json;
        
        oSpan1.onclick = register;
        
        if(sIsLogin == "true"){
        	 sUsername = "<%= username %>";
        	 oSpan0.onclick = null;
        	 oSpan0.innerHTML = sUsername;
        	 alert(1);
        }else{
        	oSpan0.onclick =login;
        }

        $.ajax({
            type:'POST',
            url:'ShowGoodsPages',
            data:{
                'nowPage':nowPage
            },
            success:function(data){
                json = JSON.parse(data);
                for(var i = 0; i < json.length;i++){
                    var oDiv = document.createElement("div");
                    oDiv.className = "goods";
                    oDiv.innerHTML = "<img src='"+json[i]["images"]+"'>"
                                    +"<div><span>"+json[i]["goodname"]+"</span></div>"
                                    +"<div><span>"+json[i]["price"]+"</span>元/千克</div>"
                                    +"<div>销量:<span>"+json[i]["salenum"]+"</span>千克</div>"
                                    +"<div>库存:<span>"+json[i]["reserves"]+"</span>千克</div>"
                                    +"<div class='cartNext' data-numbers='"+ json[i]["id"] +"' data-index='"+i+"'>加入购物车</div>"
                                    +"<div class='buynum'>请输入您要购买的数量<input type='text'></div>";
                    oGoods.appendChild(oDiv);
                    cart();
                }
                
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
	    })

        function cart(){
            var oDiv2 = document.getElementsByClassName("cartNext");
                for(var i=0;i<oDiv2.length;i++){
                    oDiv2[i].onclick = function(){
                        var index = this.dataset.index;
                        var id = this.dataset.numbers;
                        var oBuynumValue = this.nextElementSibling.getElementsByTagName('input')[0].value;
                        if(oBuynumValue != ""){
                            alert(1);
                            $.ajax({
                                type:'POST',
                                url:'InsertCartServlet',
                                data:{
                                    'gid':id,
                                    'weight':oBuynumValue,
                                    'price':json[index]["price"]
                                },
                                success:function(data){
                                    var oDiv3 = document.createElement("div");
                                    oDiv3.className = "cartStaff";
                                    oDiv3.innerHTML = "<div class='cSCheckbox'><input type='checkbox' name='cSCheckbox' value='"+id+"'></div>"+
                                "<div class='cSGood'>"+
                                    "<span>"+json[index]["goodname"]+"</span>"+
                                    "<span>"+json[index]["price"]+"元*"+oBuynumValue+"斤</span></div>";
                                    oCartContent.appendChild(oDiv3);
                                }
                            })
                        }
                        
                        // var oDiv3 = document.createElement("div");
                        // oDiv3.className = "cartStaff";
                        // oDiv3.numbers = json[index]["id"];
                        // oDiv3.innerHTML="<img src='./images/apple.jpg'>"+
                        //             "<div class='cartPrice'><span>"+json[index]["price"]+"</span>元/千克</div>"+
                        //             "<div class='cartNumbers'>数量:<input type='text'>千克</div>";
                        
                        // oCartContent.appendChild(oDiv3);
                }
                }
        }

        function login(){
            //插入一个遮罩层
            shade();

            //添加登录框
            oLoginBox = document.createElement('div');
            oLoginBox.className = "loginbox";
            oLoginBox.innerHTML = "<div class='loginheader'>用户登录<i id='close'></i></div>"+
            "<form action='UserLogin' method='post'><div><input type='text' name='username' class='loginInput'><img src='./images/user.png' class='loginUser'></img></div>"+
            "<div><input type='password' name='password' class='loginInput'><img src='./images/password.png' class='loginUser'></img></div><input type='submit' value='登录' class='loginBtn'></form>";
            oBody.appendChild( oLoginBox);
            
            var oI = document.getElementById('close');
            
            oI.onclick = function(){
                oBody.removeChild(oLoginBox);
                oBody.removeChild(oShadeDiv);
                oShadeDiv = null;
                oI = null;
                oLoginBox =null;
            }
        }

        function register(){
            //插入一个遮罩层
            shade();

            //添加登录框
            oRegisterBox = document.createElement('div');
            oRegisterBox.className = "registerbox";
            oRegisterBox.innerHTML = "<div class='registerheader'>用户注册<i id='close'></i></div>"+
            "<form action='userRegister' method='post'>"+
            "<div><input type='text' name='username' class='registerInput' placeholder='请输入用户名'><img src='./images/user.png' class='registerUser'></img></div>"+
            "<div><input type='password' name='password' class='registerInput' placeholder='请输入密码'><img src='./images/password.png' class='registerUser'></img></div>"+
            "<div><input type='text' name='address' class='registerInput' placeholder='请输入配送地址'><img src='./images/address.png' class='registerUser'></img></div>"+
            "<div><input type='text' name='phone' class='registerInput' placeholder='请输入电话'><img src='./images/phone.png' class='registerUser'></img></div>"+
            "<input type='submit' value='注册' class='registerBtn'></form>";
            oBody.appendChild(oRegisterBox);
            
            var oI = document.getElementById('close');
            
            oI.onclick = function(){
                oBody.removeChild(oRegisterBox);
                oBody.removeChild(oShadeDiv);
                oShadeDiv = null;
                oI = null;
                oRegisterBox =null;
            }
        }

        function shade(){
            var width = oBody.offsetWidth;
            var height = oBody.offsetHeight;
            oShadeDiv = document.createElement('div');
            oShadeDiv.style.width = width + 'px';
            oShadeDiv.style.height = height + 'px';
            oShadeDiv.className = "shadediv";

            oBody.appendChild(oShadeDiv);
        }

        window.onresize = function(){
            if(oShadeDiv != null){
                oShadeDiv.style.width = oBody.offsetWidth + 'px';
                oShadeDiv.style.height = oBody.offsetHeight + 'px';
            }
        }
    }
</script>
</head>
<body>
    <header>
        <nav>
            <div id="nav">
                <span>你好，请登录</span><i></i>
                <span>注册</span><i></i>
                <span>我的订单</span>
            </div>
        </nav>
        <div id="header">
            <div id="hlogo"></div>
            <div id="hleft">
                <div class="search">
                    <input class="searchinput" type="text">
                    <button class="btn">
                        <span></span>
                    </button>
                </div>
                <div class="shoppingcart">
                    <span class="carticon"></span>
                    我的购物车<span class="number">0</span>
                    <div class="cart">
                        <div class="cartContent">
                            <!-- <div class="cartStaff">
                                <div class='cSCheckbox'><input type='checkbox' name='cSCheckbox' value='a'></div>
                                <div class='cSGood'>
                                    <span>苹果</span>
                                    <span>20.0元*12.0斤</span>
                                </div>
                            </div> -->
                        </div>
                        <div class="cartBtn">购买</div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <article>
        <div id="content" class="clearfix">
            <div id="hotcontent"></div>
            <div id="goodcontent">
                <div class="showgood">
                    <!-- <div class="goods"></div>
                    <div class="goods">
                        <img src='./images/apple.jpg'>
                        <div><span>苹果</span></div>
                        <div><span>15</span>元/千克</div>
                        <div>销量：<span>50</span>千克</div>
                        <div>库存：<span>100</span>千克</div>
                    </div>
                    <div class="goods"></div>
                    <div class="goods"></div>
                    <div class="goods"></div>
                    <div class="goods"></div>
                    <div class="goods"></div>
                    <div class="goods"></div>
                    <div class="goods"></div>
                    <div class="goods"></div>
                    <div class="goods"></div>
                    <div class="goods"></div> -->
                </div>
                <div class="pages"></div>
            </div>
        </div>
    </article>
    <!-- <div class="registerbox">
        <div class='registerheader'>
            用户注册
            <i></i>
        </div>
        <form action='userRegister' method='post'>
            <div><input type='text' name='username' class='registerInput' placeholder='请输入用户名'><img src='./images/user.png' class='registerUser'></img></div>
            <div><input type='password' name='password' class='registerInput' placeholder='请输入密码'><img src='./images/password.png' class='registerUser'></img></div>
            <div><input type='text' name='address' class='registerInput' placeholder="请输入配送地址"><img src='./images/address.png' class='registerUser'></img></div>
            <div><input type='text' name='phone' class='registerInput' placeholder="请输入电话"><img src='./images/phone.png' class='registerUser'></img></div>
            <input type='submit' value='注册' class='registerBtn'>
        </form>
    </div> -->
    
</body>
</html>