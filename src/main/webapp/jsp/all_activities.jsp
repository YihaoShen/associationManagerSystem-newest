<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="../layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="../css/main.css">
  <!--加载meta IE兼容文件-->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
  <![endif]-->
  <style type="text/css">
    .div-head {
      width: 270px;
      height: 65px;
      margin-top: 10px;
      margin-left: 85%;
      position: fixed;
      z-index: 999;
    }
    .div-head .ul-head .li-head-1{
      list-style: none;
      margin-top: 10px;
      text-align: center;
      line-height: 58px;
      font-size: 20px;
      float: left;
      width: 70px;
      height: 58px;
      font-weight:bold;
      position:relative;
      color:#ff7f21;
      border:none;
      cursor:pointer;
      transition:800ms ease all;
      outline:none;
    }
    .div-head .ul-head .li-head-1:hover{
      background:#fff;
      color:#1AAB8A;
    }
    .div-head .ul-head .li-head-1:before,.div-head .ul-head .li-head-1:after{
      content:'';
      position:absolute;
      top:0;
      right:0;
      height:2px;
      width:0;
      background:#1AAB8A;
      transition:400ms ease all;
    }
    .div-head .ul-head .li-head-1:after{
      right:inherit;
      top:inherit;
      left:0;
      bottom:0;
    }
    .div-head .ul-head .li-head-1:hover:before,.div-head .ul-head .li-head-1:hover:after{
      width:100%;
      transition:800ms ease all;
    }
    .div-head .ul-head .li-head-2{
      list-style: none;
      float: left;
      width: 130px;
      height: 65px;
    }
    .div-head .ul-head .li-head-2 .img-head {
      margin-left: 20%;
      border-radius: 50%;
      overflow: hidden;
      display: block;
      width: 65px;
      height:65px;
      border: 1px solid green;
    }
  </style>
</head>
<body>
<div class="div-head" id="tx-div">
  <ul class="ul-head">
<%--    <li class="li-head-1">注册</li>--%>
<%--    <li class="li-head-1">登录</li>--%>
    <li class="li-head-2"><img class="img-head" id="img-head" src="../${sessionScope.get("uPhoto")}" onclick="window.open('/userInfo/${sessionScope.get("uName")}')">
    </li>
  </ul>
</div>
<div class="banner"style="height: 700px; width: 100%; background: url(../images/tea-time.jpg) no-repeat; background-size:cover;">
  <div class="cont w1000">
    <div class="title">
      <h3>ALL<br/>ACTIVITIES</h3>
    </div>
  </div>
</div>

<div id="main" class="content">
  <div class="cont w1000">
    <div id="items" class="list-item">

    </div>
    <div id="demo" style="text-align: center;"></div>
  </div>
</div>
<script type="text/javascript" src="../layui/layui.js"></script>
<script src="../js/jquery-3.5.1.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/canvas-nest.js"></script>
<script type="text/javascript">
  window.onload = function () {
    function getRequest() {
      var url = location.search; //获取url中"?"符后的字串
      var theRequest = new Object();
      if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
          theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
        }
      }
      return theRequest;
    }

    var request = getRequest();
    var selectuId = request.uId;
    $.ajax({
      url: "/srp/total_activities",
      type: "get",
      dataType: "json",
      success: function (finish) {
        layui.use(['element', 'laypage'], function () {
          var element = layui.element
                  , laypage = layui.laypage
                  , $ = layui.$
                  , layer = layui.layer;

          laypage.render({
            elem: 'demo'
            , count: finish.total
            , theme: '#1E9FFF'
            , limit: 5
            , layout: ['count', 'prev', 'page', 'next', 'skip']
            , jump: function (obj) {
              $.ajax({
                url: "/srp/all_activity",
                type: "get",
                dataType: "json",
                success: function (result) {
                  //模拟渲染
                  document.getElementById('items').innerHTML = function () {
                    var arr = []
                            ,
                            thisData = result.concat().splice(obj.curr * obj.limit - obj.limit, obj.limit);
                    layui.each(thisData, function (index, item) {
                      arr.push("<div class=\"item\">\n" +
                              "                                                <div class=\"layui-fluid\">\n" +
                              "                                                <div class=\"layui-row\">\n" +
                              "                                                <div class=\"layui-col-xs12 layui-col-sm4 layui-col-md5\">\n" +
                              "                                                <div class=\"img\"><img src=\"" + item.aPhoto + "\" alt=\"\"></div>\n" +
                              "                                                </div>\n" +
                              "                                                <div class=\"layui-col-xs12 layui-col-sm8 layui-col-md7\">\n" +
                              "                                                <div class=\"item-cont\">\n" +
                              "                                                <h3>\n" + item.aTitle +
                              "                                                </h3>\n" +
                              "                                                <h5>" + item.cName + "</h5>\n" +
                              "                                                <p>\n" + item.aIntroduction +
                              "                                                </p>\n" +
                              "                                                <a href=\"../html/activity_details.html?aId=" + item.aId + "\" class=\"go-icon\"></a>\n" +
                              "                                                </div>\n" +
                              "                                                </div>\n" +
                              "                                                </div>\n" +
                              "                                                </div>\n" +
                              "                                                </div>");
                    });
                    return arr.join('');
                  }();
                }
              })
            }
          });
        })
      }
    })
  }
</script>
</body>
</html>