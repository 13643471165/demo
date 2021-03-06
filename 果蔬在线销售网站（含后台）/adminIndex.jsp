<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>果蔬销售后台管理系统</title>
<link rel="stylesheet" href="./css/reset.css">
<style>
    /* 结构样式开始 */
    header{width: 100%;height: 60px;border-bottom: 1px solid #737477;}
    article{width: 100%;background: #888A8E;}
    #header{width:1120px;height: 60px;margin: 0 auto;}
    /* 结构样式结束 */

    /* header头部样式开始 */
    #header div{float: left;}
    #header .icon{width:60px;height: 60px;background: url(./images/icon.png) no-repeat;background-size: 60px 60px;}
    #header .marketname{height: 60px;line-height: 60px;padding: 0px 20px;font-size: 20px;text-align: center;width: 1020px;}
    /* header头部样式结束 */

    /* article部分样式开始 */
    #article{width: 1120px;height: 100%;margin: 0 auto;}
    #nav,#content{float: left;box-shadow: 0px 0px 5px black;}
    #nav{width:220px;height: 100%;}
    #content{width:900px;height: 100%;position: relative;}
    #nav div{width:200px;margin: 20px auto 0;font-size: 15px;position: relative;}
    #nav div .text{width:200px;border-radius: 10px;box-shadow: 2px 2px 10px black;
    text-align: center;line-height: 30px;font-weight: bold;color: white;display: block;cursor: pointer;}
    #nav div .arrows{position: absolute;top:5px;right:10px;width: 20px;height: 20px;background: blue;transition: 1s;
    background: url(./images/arrow.png) no-repeat;background-size: 20px 20px;cursor: pointer;}
    #nav div .arrowsClick{transform: rotate(180deg);}
    #nav div ul{width: 185px;margin: 0 auto;margin-top: 1px;height: 0px;overflow: hidden;transition: 1s;}
    #nav div ul li{width: 100%;height: 25px;font-size: 12px;line-height: 25px;text-align: center;border:1px solid black;
    border-radius: 5px;background: white;cursor: pointer;}
    #content div.container{width: 100%;height: 100%;box-sizing: border-box;padding: 40px;position: absolute;top: 0;left: 0;display: none;}
    #content div.container:nth-child(1){display: block;}
    /* article部分样式结束 */

    /* content上架商品部分开始 */
    #content #upShelf div{float: left;height: 490px;position: relative;}
    #content #upShelf div.upShelfText{width: 250px;}
    #content #upShelf div.upShelfForm{width: 440px;margin-left: 10px;}
    #content #upShelf div.upShelfText span{display: block;margin-top: 20px;font-size: 20px;color: white;width: 100%;height: 25px;
    text-align: right;line-height: 25px;}
    #content #upShelf div.upShelfText span:nth-child(5){margin-top: 150px;}
    #content #upShelf div.upShelfForm span{display: block;margin-top: 20px;margin-left: 10px;}
    #content #upShelf div.upShelfForm span input{width: 120px;height: 20px;outline: none;background:#888A8E;font-size: 15px;}
    #content #upShelf div.upShelfForm textarea{width: 380px;height: 145px;outline: none;background:#888A8E;}
    #content #upShelf div.upShelfForm .upSheflFormSubmit{width:120px;height:40px;position: absolute;bottom: 75px;left:20px;
    font-size:20px; border-radius: 5px;background: white;outline: none;}
    /* content上架商品部分结束 */
</style>
<script>
    window.onload = function(){
        var header = document.getElementsByTagName("header")[0];
        var article = document.getElementsByTagName("article")[0];
        var oUl = document.getElementById("nav").getElementsByTagName("ul");
        var oLi = document.getElementById("nav").getElementsByTagName("li");
        var oDiv = document.getElementById("content").getElementsByTagName("div");
        var lastClicked = 0;

        articleHeight();
        navToogle();
        staffShow();
        upShelf();

        //此函数用于一开始确定article的高度
        function articleHeight(){
            var headerHeight = header.offsetHeight;
            var docHeight = document.documentElement.clientHeight;

            if(docHeight - headerHeight <= 500){
                article.style.height = 500+'px';
            }else{
                article.style.height = (docHeight - headerHeight)+'px';
            }
        }

        //此函数用于导航列表的展开与收缩
        function navToogle(){
            var tSpan = document.getElementsByClassName('text');
            var oLiHeight = oLi[0].offsetHeight;

            for(var i = 0; i < tSpan.length; i++){
                tSpan[i].index = i;
                tSpan[i].isClicked = 0;
                tSpan[i].onclick = function(){
                    if(!this.isClicked){
                        this.nextElementSibling.className += " arrowsClick";
                        oUl[this.index].style.height = (oUl[this.index].getElementsByTagName("li").length * oLiHeight) + 'px';
                        this.isClicked = 1;
                    }else{
                        this.nextElementSibling.className = "arrows";
                        oUl[this.index].style.height = 0 + 'px';
                        this.isClicked = 0;
                    }
                }
            }
        }

        //果蔬情况的展示
        function staffShow(){
            
        }

        //上架商品
        function upShelf(){
            oLi[1].onclick = function(){
                var index = 1;
                oDiv[lastClicked].style.display = "none";
                lastClicked = index + 1;
                oDiv[lastClicked].style.display = "block";
            }
        }

        window.onresize = function(){
            var headerHeight = header.offsetHeight;
            var docHeight = document.documentElement.clientHeight;
            if(docHeight - headerHeight <= 500){
                article.style.height = 500 + 'px'; 
            }else{
                article.style.height = (docHeight - headerHeight) + 'px';
            }
        }
    }
</script>
</head>
<body>
    <header>
        <div id="header">
           <div class="icon"></div>
           <div class="marketname">果蔬销售和配送后台管理系统</div>
        </div>
    </header>
    <article>
        <div id="article">
            <div id="nav">
                <div>
                    <span class="text">商品情况</span>
                    <span class="arrows"></span>
                    <ul>
                        <li>果蔬情况</li>
                        <li>上架商品</li>
                        <li>下架商品</li>
                    </ul>
                </div>
                <div>
                    <span class="text">订单情况</span>
                    <span class="arrows"></span>
                    <ul>
                        <li>未完成订单</li>
                        <li>已完成订单</li>
                    </ul>
                </div>
                <div>
                    <span class="text">库存情况</span>
                    <span class="arrows"></span>
                    <ul>
                        <li>查看库存</li>
                        <li>管理库存</li>
                    </ul>
                </div>
                <div>
                    <span class="text">用户信息</span>
                    <span class="arrows"></span>
                    <ul>
                        <li>查看用户</li>
                        <li>删除用户</li>       
                    </ul>
                </div>
            </div>
            <div id="content">
                <div class="container">1</div>
                <div class="container">2</div>
                <div class="container" id="upShelf">
                        <div class="upShelfText">
                            <span>商品名称</span>
                            <span>商品价格</span>
                            <span>商品库存</span>
                            <span>商品简介</span>
                            <span>上传图片</span>
                        </div>
                        <div class="upShelfForm">
                        	<form action="UpShelfServlet" enctype="multipart/form-data" method="post">
                            	<span><input type="text" name="goodname"></span>
                            	<span><input type="text" name="price"></span>
                            	<span><input type="text" name="reserves"></span>
                            	<span><textarea rows="10" cols="20" name="introduce"></textarea></span>
                                <span><input type="file" name="file"></span>
                                <input type="submit" class="upSheflFormSubmit" value="确定上传">
                            </form>
                        </div>
                </div>
                <div class="container">4</div>
                <div class="container">5</div>
                <div class="container">6</div>
                <div class="container">7</div>
                <div class="container">8</div>
                <div class="container">9</div>
                <div class="container">10</div>
            </div>
        </div>
    </article>
</body>
</html>