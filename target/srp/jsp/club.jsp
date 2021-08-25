<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <title>Home</title>
    <!--meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content=""/>
    <style type="text/css">
        .photo {
            margin-right: 3%;
            margin-left: 3%;
            margin-top: 3%;
        }

        .button {
            display: inline-block;
            border-radius: 4px;
            background-color: #93D1FF;
            border: none;
            color: #2E2D3C;
            text-align: center;
            font-size: 14px;
            width: 100px;
            height: 30px;
            transition: all 0.5s;
            cursor: pointer;
            vertical-align: middle;
            float: right;
            margin-right: 40px;
        }

        .button span {
            cursor: pointer;
            display: inline-block;
            position: relative;
            transition: 0.5s;
        }

        .button span:after {
            content: '»';
            position: absolute;
            opacity: 0;
            top: 0;
            right: -20px;
            transition: 0.5s;
        }

        .button:hover span {
            padding-right: 25px;
        }

        .button:hover span:after {
            opacity: 1;
            right: 0;
        }
        .div-head {
            width: 270px;
            height: 65px;
            margin-left: 85%;
            position: fixed;
            z-index: 999;
        }
        .div-head .ul-head .li-head-1{
            list-style: none;
            text-align: center;
            line-height: 55px;
            font-size: 18px;
            float: left;
            width: 70px;
            height: 55px;
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
            width: 125px;
            height: 62px;
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
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!--//meta tags ends here-->
    <!--booststrap-->
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all">

    <!--//booststrap end-->

    <!-- font-awesome icons -->
    <link rel="stylesheet" href="../css/font-awesome.min.css"/>

    <!-- //font-awesome icons -->
    <!--stylesheets-->
    <link href="../css/style01.css" rel='stylesheet' type='text/css' media="all">
    <!--//style sheet end here-->
    <link rel="stylesheet" href="../css/lightbox.css">
    <link href="http://fonts.googleapis.com/css?family=Encode+Sans+Condensed:300,400,500,600,700" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Abel" rel="stylesheet">
</head>
<body>

<div class="div-head" id="tx-div">
    <ul class="ul-head">
        <li class="li-head-2">
            <img class="img-head" id="img-head" src="${sessionScope.get("uPhoto")}" onclick="window.open('${pageContext.request.contextPath}/userInfo/${sessionScope.get("uName")}')">
        </li>
    </ul>
</div>
<!--header start here-->
<div class="banner">
    <div class="top-nav">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="club.jsp" class="active">Home</a></li>
                    <li><a href="#about" class="scroll">About</a></li>
                    <li><a href="#service" class="scroll">Services</a></li>
                    <li><a href="#team" class="scroll">Team</a></li>
                    <li><a href="#gallery" class="scroll">Activities</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="w3-agile-logo">
            <div class=" head-wl">
                <div class="headder-w3">
                    <h1><a href="club.jsp">Welcome</a></h1>
                </div>
                <!--                <div class=" tele">-->
                <!--                    <p><span class="fa fa-qq" aria-hidden="true"></span>1095826205</p>-->
                <!--                </div>-->
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="w3layouts-text">
            <h2 id="1-h2"></h2>
            <div class="border"></div>
            <p>欢迎来到我们的社团，请继续浏览以获得更多的信息</p>
        </div>
    </div>
</div>
<!--header strat here-->
<!-- about-top -->
<div class="about" id="about">
    <!-- container -->
    <div class="container">
        <div class="about-info">
            <h3>About Us</h3>
        </div>
        <div class="about-top-grids">
            <div class="col-md-8 about-top-grid">
                <h4>Introduction：
                </h4>
                <p id="2-p">
                </p>
            </div>
            <div class="col-md-4 about-top-grid ">
                <img id="2-img" src="" alt=""/>
            </div>
            <div class="clearfix"></div>
        </div>

        <div class="item-cost">

            <div class="col-md-2 cost-w3">
                <div class="col-sm-3 col-xs-3 agileits-ma">
                    <div class="w3ls-svr-icon">
                        <span class="fa fa-gift" aria-hidden="true"></span>
                    </div>
                </div>

                <div class="col-sm-9 col-xs-9 agileits-ma">
                    <div class="svr-bt-text-w3ls">
                        <h4><span class="cost">&nbsp;Gift</span></h4>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-2 cost-w3">
                <div class="col-sm-3 col-xs-3 agileits-ma">
                    <div class="w3ls-svr-icon">
                        <span class="fa fa-map" aria-hidden="true"></span>
                    </div>
                </div>

                <div class="col-sm-9 col-xs-9 agileits-ma">
                    <div class="svr-bt-text-w3ls">
                        <h4><span class="cost">&nbsp;Map</span></h4>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-2 cost-w3">
                <div class="col-sm-3 col-xs-3 agileits-ma">
                    <div class="w3ls-svr-icon">
                        <span class="fa fa-gamepad" aria-hidden="true"></span>
                    </div>
                </div>

                <div class="col-sm-9 col-xs-9 agileits-ma">
                    <div class="svr-bt-text-w3ls">
                        <h4><span class="cost">&nbsp;play</span></h4>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-2 cost-w3">
                <div class="col-sm-3 col-xs-3 agileits-ma">
                    <div class="w3ls-svr-icon">
                        <span class="fa fa-headphones" aria-hidden="true"></span>
                    </div>
                </div>

                <div class="col-sm-9 col-xs-9 agileits-ma">
                    <div class="svr-bt-text-w3ls">
                        <h4><span class="cost">&nbsp;Music</span></h4>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- //about-top -->
<!-- features -->
<div class="services" id="service">
    <div class="container">
        <div class="features-w3l">
            <h3> Service</h3>
            <div class="col-md-4 features-grids">
                <span class="fa fa-heart-o" aria-hidden="true"></span>
                <a id="a3-1" href=""><p id="p3-1" style="color: springgreen;font-size: 18px" onclick="apply_activity()">活动发布</p></a>
                <div class="border-line"></div>
            </div>
            <div class="col-md-4 features-grids features-grd-mdl1">
                <span class="fa fa-money" aria-hidden="true"></span>
                <a><p id="p3-2" style="color: turquoise;font-size: 18px" onclick="apply_club()">申请加入</p></a>
                <div class="border-line"></div>
            </div>
            <div class="col-md-4 features-grids">
                <span class="fa fa-paper-plane" aria-hidden="true"></span>
                <a id="a3-3" href=""><p id="p3-3" style="color: coral;font-size: 18px" onclick="verify_user()">入社审核</p></a>
                <div class="border-line"></div>
            </div>
            <div class="col-md-4 features-grids">
                <span class="fa fa-briefcase" aria-hidden="true"></span>

                <p>暂未开通</p>
                <div class="border-line"></div>
            </div>
            <div class="col-md-4 features-grids features-grd-mdl2">
                <span class="fa fa-map" aria-hidden="true"></span>

                <p>暂未开通</p>
                <div class="border-line"></div>
            </div>
            <div class="col-md-4 features-grids">
                <span class="fa fa-car" aria-hidden="true"></span>

                <p>暂未开通</p>
                <div class="border-line"></div>
            </div>
            <div class="clerfix"></div>
        </div>
    </div>
</div>
<!-- //features -->
<!-- team-->
<div class="team agileits" id="team">
    <div class="team-info">
        <div class="container">
            <div id="main" class="team-row">
            </div>
            <div class="clearfix"></div>
            <button class="button" id="4-button" onclick="">
                <span>更多</span>
            </button>
        </div>
    </div>
</div>
<!-- //team -->
<!-- Stats -->
<div class="stats-agileits" id="stats">
    <div class="container">
        <div class="stats-info agileits w3layouts">
            <h3> Stats</h3>
            <div style="margin-left: 33%">
                <div class="col-md-2 col-sm-3 agileits w3layouts stats-grid stats-grid-2">
                    <span class="fa fa-calendar font" aria-hidden="true"></span>
                    <div id="date_show" class="numscroller agileits-w3layouts" data-slno='1' data-min='0' data-max='' data-delay='3'
                         data-increment="2">
                    </div>
                    <div class="stat-info-w3ls">
                        <h4 class="agileits w3layouts">Time</h4>
                    </div>
                </div>
                <div class="col-md-2 col-sm-3 stats-grid agileits w3layouts stats-grid-3">
                    <span class="fa fa-users font" aria-hidden="true"></span>
                    <div id="member_show" class="numscroller agileits-w3layouts" data-slno='1' data-min='0' data-max='1021'
                         data-delay='3'
                         data-increment="2">
                    </div>
                    <div class="stat-info-w3ls">
                        <h4 class="agileits w3layouts">Followers </h4>
                    </div>
                </div>
                <div class="col-md-2 col-sm-3 stats-grid stats-grid-4 agileits w3layouts">
                    <span class="fa fa-heart-o font" aria-hidden="true"></span>
                    <div id="zan_show" class="numscroller agileits-w3layouts" data-slno='1' data-min='0' data-max='1010'
                         data-delay='3'
                         data-increment="2">
                    </div>
                    <div class="stat-info-w3ls">
                        <h4 class="agileits w3layouts">Likes</h4>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- //Stats -->

<!-- gallery -->
<div id="gallery" class="gallery">
    <div class="container">
        <div class="gallery-info">
            <h3 class="title">Our Activities</h3>
            <div class="col-md-4 gallery-grids">
                <a id="6-a-1" href="">
                    <img id="6-img-1" src="" alt="" class="img-responsive zoom-img">
                </a>
            </div>
            <div class="col-md-4 gallery-grids">
                <a id="6-a-2" href="">
                    <img id="6-img-2" src="" alt="" class="img-responsive zoom-img">
                </a>
            </div>
            <div class="col-md-4 gallery-grids">
                <a id="6-a-3" href="">
                    <img id="6-img-3" src="" alt="" class="img-responsive zoom-img">
                </a>
            </div>

            <div class="col-md-6 gallery-grids grid-mdl">
                <a id="6-a-4" href="">
                    <img id="6-img-4" src="" alt="" class="img-responsive zoom-img">
                </a>
            </div>
            <div class="col-md-6 gallery-grids grid-mdl">
                <a id="6-a-5" href="">
                    <img id="6-img-5" src="" alt="" class="img-responsive zoom-img">
                </a>
            </div>
            <div class="clearfix"></div>
        </div>
        <button id="6-button" class="button" onclick="">
            <span>更多</span>
        </button>
    </div>
</div>
<!-- //gallery -->

<script type='text/javascript' src='../js/jquery-3.5.1.js'></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/lightbox-plus-jquery.min.js"></script>
<script type="text/javascript" src="../js/numscroller-1.0.js"></script>
<script type="text/javascript" src="../js/move-top.js"></script>
<script src="../js/canvas-nest.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
<script src="../layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    var selectcId;
    var selectuId;
    var activity_flag = 0;
    var apply_flag = 0;
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
        selectcId = request.cId;
        selectuId = request.uId;
        $.ajax({
            url: "/srp/clubs/" + selectcId,
            type: "get",
            dataType: "json",
            success: function (result) {
                document.getElementById("1-h2").innerText = result.cName;
                document.getElementById("2-p").innerText = result.cDescription;
                document.getElementById("2-img").src = result.tPhoto;
                document.getElementById("6-button").onclick = function () {
                    window.open('club_activities.html?cId=' + selectcId + "&uId=" + selectuId)
                };
                document.getElementById("4-button").onclick = function () {
                    window.open('select_all_member.html?cId=' + selectcId + "&uId=" + selectuId)
                };
                var sta_date = new Date(result.cCreateTime.replace(/-/g,"/"));
                var end_date = new Date();
                end_date.toLocaleDateString();
                var num = (end_date-sta_date)/(1000*3600*24);
                var days = parseInt(Math.ceil(num));
                var dateShow = document.getElementById("date_show");
                dateShow.setAttribute('data-max',days);
            }
        });
        $.ajax({
            url: "/srp/role/" + selectcId + "/" + selectuId,
            type: "get",
            dataType: "json",
            success: function (result) {
                if (result === 3 || result === "" || result === null) {
                    document.getElementById("p3-1").innerText = "暂未开通";
                    document.getElementById("p3-3").innerText = "暂未开通";
                }else {
                    activity_flag = 1;
                }
            }
        });
        $.ajax({
           url: "/srp/clubMembers/" +selectcId,
            type:"get",
            dataType:"json",
            success:function (result) {
               var data = result.data;
                for (var i = 0 ;i < result.count; i++){
                    if (selectuId === data[i].uid.toString() ){
                        if(data[i].status === 1){
                            apply_flag = 1;
                        }else {
                            apply_flag = 2;
                        }
                    }
                }
                if (apply_flag === 1){
                    document.getElementById("p3-2").innerText = "暂未开通";
                }else if (apply_flag === 2){
                    document.getElementById("p3-2").innerText = "申请审核中";
                }
            }
        });
        $.ajax({
            url: "/srp/roleClubMember/" + selectcId,
            type: "get",
            dataType: "json",
            success: function (result) {
                if (result != null && result !== "") {
                    var html = "";
                    var main = document.getElementById("main");
                    html += "<h3 class=\"agile-title\">Our Team</h3>";
                    for(var i = 0 ; i < result.length && i < 4; i++){
                        html += "<div class=\"col-md-2 team-grids photo\">\n" +
                            "                        <div class=\"team-agile-img\">\n" +
                            "                        <a href=\"#\"><img style='height: 210px;' src=\"" + result[i].uPhoto +"\" alt=\"img\">" +
                            "                        <div class=\"view-caption\">\n" +
                            "                        <div class=\"w3ls-info\">\n" +
                            "                        <h4>"+ result[i].uName +"</h4>\n" +
                            "                        </div>\n" +
                            "                        <div style=\"float: right;font-family: 仿宋,serif;font-size: 20px;color: #fff9ec\">\n" + result[i].roleName +
                            "                        </div>\n" +
                            "                        </div>\n" +
                            "</a>\n" +
                            "                        </div>\n" +
                            "                        </div>"
                    }
                    main.innerHTML = html;
                }

            }
        });
        $.ajax({
            url: "/srp/activities/" + selectcId,
            type: "get",
            dataType: "json",
            success: function (result) {
                if (result != null && result !== "") {
                    for (let i = 0; i < result.length; i++) {
                        if (i === 0) {
                            document.getElementById("6-img-1").src = result[0].aPhoto;
                            document.getElementById("6-a-1").href = "activity_details.html?aId=" + result[0].aId + "&uId=" + selectuId;
                        } else if (i === 1) {
                            document.getElementById("6-img-2").src = result[1].aPhoto;
                            document.getElementById("6-a-2").href = "activity_details.html?aId=" + result[1].aId + "&uId=" + selectuId;
                        } else if (i === 2) {
                            document.getElementById("6-img-3").src = result[2].aPhoto;
                            document.getElementById("6-a-3").href = "activity_details.html?aId=" + result[2].aId + "&uId=" + selectuId;
                        } else if (i === 3) {
                            document.getElementById("6-img-4").src = result[3].aPhoto;
                            document.getElementById("6-a-4").href = "activity_details.html?aId=" + result[3].aId + "&uId=" + selectuId;
                        } else if (i === 4) {
                            document.getElementById("6-img-5").src = result[4].aPhoto;
                            document.getElementById("6-a-5").href = "activity_details.html?aId=" + result[4].aId + "&uId=" + selectuId;
                        }
                    }
                } else {
                    alert('失败!');
                    window.location.reload();
                }
            }
        });
    };
    function apply_activity() {
        if (activity_flag === 1){
            window.open('activity_apply.html?cId=' + selectcId + '&uId=' + selectuId);
        }
    }
    function verify_user() {
        if (activity_flag === 1){
            window.open('select_all_member.html?cId=' + selectcId + '&uId=' + selectuId);
        }
    }
    function apply_club() {
        if (apply_flag === 0){
            layui.use('layer', function () {
                var layer = layui.layer;

                layer.msg('确认要申请吗？', {
                    btn: ['确认', '取消']
                    , yes: function (index) {
                        $.ajax({
                            url: "/srp/clubMembers/" + selectcId + "/" + selectuId,
                            type: "post",
                            dataType: "json",
                            success: function (result) {
                                if (result === "success") {
                                    layer.msg('申请成功！',{icon:6,time:2000});
                                    document.getElementById("p3-2").innerText = "申请审核中";
                                } else {
                                    layer.alert('申请失败!');
                                }
                            }
                        });
                    }
                });
            })
        }
    }
</script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({scrollTop: $(this.hash).offset().top}, 900);
        });
    });
</script>
<!-- start-smoth-scrolling -->

<!-- for-bottom-to-top smooth scrolling -->
<script type="text/javascript">
    $(document).ready(function () {
        var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
        };
        $().UItoTop({easingType: 'easeOutQuart'});
    });
</script>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>		