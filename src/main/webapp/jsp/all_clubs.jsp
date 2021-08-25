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
    <script src="https://oss.maxcdn.com/libs/resultpond.js/1.3.0/resultpond.min.js"></script>
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
            color:#00FF00;
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
<li class="li-head-2"><img class="img-head" id="img-head" src="../${sessionScope.get("uPhoto")}" onclick="window.open('/userInfo/${sessionScope.get("uName")}')">
        </li>
    </ul>
</div>
<div class="banner" style="height: 800px; width: 100%; background: url(../images/reading.jpg) no-repeat; background-size:cover;">
    <div class="cont w1000">
        <div class="title">
            <h3>ALL<br/>CLUBS</h3>
        </div>
    </div>
</div>
<div id="main" class="content">
    <div class="cont w1000">
        <div class="list-item">
            <ul id="LAY_demo1"></ul>
        </div>
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
            url: "/srp/total_club",
            type: "get",
            dataType: "json",
            success: function (finish) {
                layui.use(['element', 'laypage', 'flow'], function () {
                    var flow = layui.flow
                        , $ = layui.$;

                    flow.load({
                        elem: '#LAY_demo1' //流加载容器
                        ,done: function(page, next){ //执行下一页的回调
                            $.ajax({
                                url: "/srp/clubs/" + (page*4 - 4) + "/" + 4,
                                type: "get",
                                dataType: "json",
                                success: function (result) {
                                    if (result !== "") {
                                        var lis = [];
                                        layui.each(result, function (index, item) {
                                            lis.push("<div class=\"item\">\n" +
                                                "                                                <div class=\"layui-fluid\">\n" +
                                                "                                                <div class=\"layui-row\">\n" +
                                                "                                                <div class=\"layui-col-xs12 layui-col-sm4 layui-col-md5\">\n" +
                                                "                                                <div class=\"img\"><img src=\"" + item.tPhoto + "\" alt=\"\"></div>\n" +
                                                "                                                </div>\n" +
                                                "                                                <div class=\"layui-col-xs12 layui-col-sm8 layui-col-md7\">\n" +
                                                "                                                <div class=\"item-cont\">\n" +
                                                "                                                <h3>\n" + item.cName +
                                                "                                                </h3>\n" +
                                                "                                                <h5>" +item.cCreateTime + "</h5>\n" +
                                                "                                                <p>\n" + item.cDescription +
                                                "                                                </p>\n" +
                                                "                                                <a href=\"" +
                                                "club.jsp?cId=" + item.cId +
                                                "\" class=\"go-icon\"></a>\n" +
                                                "                                                </div>\n" +
                                                "                                                </div>\n" +
                                                "                                                </div>\n" +
                                                "                                                </div>\n" +
                                                "                                                </div>");
                                        });
                                        //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                                        //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                                        next(lis.join(''), page < finish.total/4);
                                    }
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