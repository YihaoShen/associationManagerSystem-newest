<%--
  Created by IntelliJ IDEA.
  User: shenyihao
  Date: 2021/2/7
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">	
	<title>Hello~:)`v`(:~</title>
	<!-- 图标库npmjs.com -->
	<link rel="stylesheet" href="https://unpkg.com/font-awesome@4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
	<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
	<style>

	  main {
	  	background: linear-gradient(to right top, rgba(38,50,105,0.78),
	  	rgba(255,152,0,0.45)), url(${pageContext.request.contextPath}/images/login_background.jpeg) center center no-repeat ;
	  	background-size: cover;
	  }

	  header {
	  	position: absolute;
	  	top: 10px;
	  	width: 100%;
	  }

	  header .login {
	  	float: right;
      margin-top: 10px;
	  	margin-right: 25px;
	    font-size: 30px; 
      color: #030303;
	  
	  }
      
	  .flip-modal {
	  	  display: none;
	  }
	  .show {
	  	display: block!important;
	  }
       
      /*这个白框*/
	  .modal {
	  	position: absolute;
	  	left: 50%;
	  	top: 50%;
	  	transform: translate(-50%,-50%);
	  	width: 400px;
	  	padding: 16px;
	  	background-color: rgba(0, 0, 0, 0.36);
	  	box-shadow: 1px 2px 9px 4px rgba(3, 3, 3, 0.2);
	  }

	  .modal .close {
        position: absolute;
        right: 10px;
        top: 10px;
	  }
      
      /*'登录注册'四字文本居中*/
	  .modal .tabs {
	  	text-align: center;
	  }
	  .modal .tabs a {
	  	 display: inline-block;
	  	 font-size:16px;
	  	 margin: 10px 10px;
	  	 color: #131313;
	  }
      
      /*下划线*/
	   .modal .active {
  	  	border-bottom: 2px solid #ed6f6f;
  	  	color: #444;
        padding-bottom: 10px;
	  }
     .modal .active:hover{
        opacity: 0.8;
    }
       
       /*设置容器大小*/
	   .modal .content {
	  	  padding: 20px 43px;
	  }

	  /*设置字体大小、颜色*/
      .modal .errormsg {
      	color: #ff002d;
      	font-size: 12px;
      }

      /*div定位做字体图标的坐标*/
      .modal .content .input-field {
      	position: relative;
      	margin-top: 10px;
      }
      
      /*字体图标定位*/
      .modal .content .input-field .fa{
      	position: absolute;
      	left: 13px;
      	top: 13px;
      }

      /*设置登录和密码，居中，占满剩余长度*/
      .modal .content input[type=text],
      .modal .content input[type=password],
      .modal .content input[type=password2]{
      	width: 100%;
      	padding: 10px 10px 10px 28px;
      	outline: none;
      }

      /*提交按钮*/
      .modal .content input[type=submit] {
      	padding: 6px 10px;
      	border: none;
      	background: #fff;
      	box-shadow: 0px 0px 2px rgba(0, 0, 0, 0.36);
      	outline: none;
      }

      /*CSS3 旋转动画 */
      .flip-modal.login .modal-login,
      .flip-modal.register .modal-register {
      	transform: translate(-50%,-50%) rotateY(0deg);
      	backface-visibility: hidden;
      	transition: all 1s;
      }
      .flip-modal.login .modal-register,
      .flip-modal.register .modal-login {
        transform: translate(-50%,-50%) rotateY(180deg);
        backface-visibility: hidden;
        transition: all 1s;
      }
      
	</style>
</head>
<body>
  <!-- 使用到字体图标，从fontAwesome里icon中找 -->
	<header>
		<a class="login" href="#"><i class="fa fa-user-circle"></i></a>
	</header>

	<main>
    <div class="flip-modal login">
			<!-- 展示登录页面 -->
			<div class="modal modal-login">
           <a class="close" href="#"><i class="fa fa-close"></i></a>

            <div class="tabs">
              <a class="login active" href="#">登录</a>
              <a class="register" href="#">注册</a>
            </div>

				<!-- 普通登录 -->
            <div class="content">
               <div class="errormsg"></div>
               <form name="form" action="" method="post">
                  <div class="input-field">
                    <i class="fa fa-user-o"></i>
                    <input name="uStuNumber" type="text" placeholder="学号">
                  </div>
                  <div class="input-field">
                    <i class="fa fa-lock"></i>
                    <input name="uPassword" type="password" placeholder="密码">
                  </div>
                  <div class="input-field" >
					  <select name="m" lay-verify="">
							<option value="1">普通用户登录</option>
						  <option value="2">管理员登录</option>
						  <option value="3">超级管理员登录</option>
						  <input type="submit" value="登录" onclick="a()">
					  </select>
                  </div>

               </form>
            </div>
      </div>
			<!-- 展示注册页面 -->
			<div class="modal modal-register">
  				<a class="close fa fa-close" href="#"></a>
  				<div class="tabs">
  					<a class="login" href="#">登录</a>
  					<a class="register active" href="#">注册</a>
  				</div>
  				<div class="content">
  					 <div class="errormsg"></div>
  					 <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">
    						<div class="input-field">
    							<i class="fa fa-user-o"></i>
    							<input name="uName" type="text" placeholder="输入用户名">
    						</div>

						 <!-- 上传图片 -->
						 <div class="input-field">
							 <i class="fa fa-user-o"></i>
							 <input type="file" name="uPhoto" id="file"placeholder="上传图片" />
						 </div>

						 <div class="input-field">
							 <i class="fa fa-user-o"></i>
							 <input name="uStuNumber" type="text" placeholder="输入学号">
						 </div>
						 <div class="input-field">
							 <i class="fa fa-user-o"></i>
							 <input name="uSex" type="text" placeholder="输入性别">
						 </div>
						 <div class="input-field">
							 <i class="fa fa-user-o"></i>
							 <input name="uCollege" type="text" placeholder="学院">
						 </div>
						 <div class="input-field">
							 <i class="fa fa-user-o"></i>
							 <input name="uCurrentMajor" type="text" placeholder="专业">
						 </div>
						 <div class="input-field">
							 <i class="fa fa-user-o"></i>
							 <input name="uEnrolTime" type="date" placeholder="入学时间">
						 </div>
						 <div class="input-field">
							 <i class="fa fa-user-o"></i>
							 <input name="phone" type="text" placeholder="手机号">
						 </div>




						 <div class="input-field">
							 <i class="fa fa-user-o"></i>
							 <input name="qq" type="text" placeholder="QQ号">
						 </div>
    						<div class="input-field">
    							<i class="fa fa-lock"></i>
    							<input name="uPassword" type="password" placeholder="输入密码">
    						</div>
    						<div class="input-field">
    							<i class="fa fa-lock"></i>
    							<input name="uPassword2"  type="password" placeholder="再次输入密码">
    						</div>
    						<div class="input-field">
    							<input type="submit" value="注册">
    						</div>
  					</form>
  				</div>
			</div>

		</div>

	</main>
  <script>

	  <!-- 上传头像 -->
	  function uploadImg() {
		  debugger;
		  if($("#file").val() != "") {
			  $.ajaxFileUpload({
				  type: "POST",
				  url:"/associationManagerSystem_master_war_exploded/file/upload",//后台接口
				  dataType: "json",
				  fileElementId:"file",  // 文件的id
				  success: function(d){
					  if(d.code == 0) {
						  js.showMessage("上传成功");
						  //图片显示
						  $("#avatar").attr("value",d.data.url);
						  $("#avatarShow").attr("src",d.data.url);
					  }
				  },
				  error: function () {
					  js.showMessage("上传失败");
				  },
			  });
		  } else {
			  js.showMessage("请先选择文件");
		  }
	  }



	  function a() {
		  var num = document.form.m.value

		  if (num == 1) {
			  document.form.action = "${pageContext.request.contextPath}/login"
		  } else if (num == 2) {
			  document.form.action = "${pageContext.request.contextPath}/adminLogin"
		  } else {
			  document.form.action="${pageContext.request.contextPath}/superLogin"
		  }
	  }



     function $(selector){
      return document.querySelector(selector)
    }
    function $$(selector){
      return document.querySelectorAll(selector)
    }
    $$('.modal .login').forEach(function(node){
      node.onclick = function(){
        $('.flip-modal').classList.remove('register')
        $('.flip-modal').classList.add('login')
      }
    })
    $$('.modal .register').forEach(function(node){
      node.onclick = function(){
        $('.flip-modal').classList.remove('login')
        $('.flip-modal').classList.add('register')
      }
    })
    $(".close").onclick = function(){
      $('.flip-modal').classList.remove('show')
    }
    $(".flip-modal").onclick=function(e){
        e.stopPropagation()
    }

    $('header .login').onclick = function(e) {
		e.stopPropagation();
		$('.flip-modal').classList.add('show')
	}
  </script>
</body>
</html>
