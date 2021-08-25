/*
@Name:闲言轻博客模块;
@Time:2018-07-09;
@Author：欧欧;
@Site：...
*/


$(function(){
	//处理移动端点击延迟
	FastClick.attach(document.body);
	
	//注意：导航 依赖 element 模块，否则无法进行功能性操作
	layui.use('element', function(){
	  var element = layui.element;

	});

	// 分页
	layui.use('laypage', function(){
	  var laypage = layui.laypage;
	  //执行一个laypage实例
	  laypage.render({
	    elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
	    ,count: 50 //数据总数，从服务端得到
	    ,theme: '#1e9fff'
	  });
	});

	//导航切换
	$(document).on('click','.nav-hide .more',function(){
		$('.nav-hide ul').fadeToggle(300);
	});

	// 回到顶部
	$(window).scroll(function(){
		if($(window).scrollTop()>=100){
			$('.layui-fixbar li').fadeIn(300);
		}else{
			$('.layui-fixbar li').fadeOut(300);
		}
	});
	$(document).on('click','.layui-fixbar li',function(){
		$('html,body').animate({scrollTop:0},500);
	});

	//点赞
	$(document).on('click','.like',function(){
		if($(this).text()=="点赞"){
			$(this).text("已赞");
		}
		$(this).css({
			color:'red'
		});
		layer.msg('点赞成功', {time: 2000, icon:6});
	});

	
})