<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>个人资料</title>
    <link href="${pageContext.request.contextPath }/layui/css/layui.css"
          rel="stylesheet" />
    <script src="${pageContext.request.contextPath }/layui/layui.js"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
    <script type="text/javascript">
        layui.use('upload',function(){
            var upload = layui.upload;
            upload.render({
                elem: '#fileBtn'
                ,url: '../updatePersonalById.do'
                ,accept: 'file'
                ,auto: false
                ,bindAction: '#uploadBtn'
                ,done: function(res){
                    alert(res.data.src);
                    $("[name=userImage]").val(res.data.src);
                }
            });
        });
    </script>

</head>
<body>
<form class="layui-form" action="../updatePersonalByIdSuccess.do" method="post" charset="utf-8" target="_parent">
    <div class="layui-form-item" style="margin-top: 20px;">
        <label class="layui-form-label">编号</label>
        <div class="layui-input-block">
            <input type="text" name="uName" required  lay-verify="required" value="${user.Uname }" autocomplete="off" readonly="readonly" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px;">
        <label class="layui-form-label">登录名</label>
        <div class="layui-input-block">
            <input type="text" name="userName" required  lay-verify="required" value="${ui.userName }" autocomplete="off" readonly="readonly" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px;">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="password" name="userPwd" required  lay-verify="required" value="${ui.userPwd }" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px;">
        <label class="layui-form-label">确认密码</label>
        <div class="layui-input-block">
            <input type="password" name="reuserPwd" required  lay-verify="required" value="${ui.userPwd }" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px;">
        <label class="layui-form-label">真实姓名</label>
        <div class="layui-input-block">
            <input type="text" name="userrealName" required  lay-verify="required" value="${ui.userrealName }" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px;">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block">
            <input type="text" name="userPhone" required  lay-verify="required" value="${ui.userPhone }" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px;">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-block">
            <input type="text" name="userAds" required  lay-verify="required" value="${ui.userAds }" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-upload">
        <label class="layui-form-label">头像:</label>
        <div class="layui-upload layui-input-block">
            <input type="hidden" name="userImage" value="${ui.userImage }" required lay-verify="required" />
            <button type="button" class="layui-btn layui-btn-primary" id="fileBtn"><i class="layui-icon">&#xe67c;</i>选择文件</button>
            <button type="button" class="layui-btn layui-btn-warm" id="uploadBtn">开始上传</button>
        </div>
    </div>
    <div class="layui-form-item" style="margin-top: 20px;">
        <div class="layui-input-block">
            <button class="layui-btn" id="btn1" lay-submit lay-filter="formDemo">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>

</form>
</body>
</html>