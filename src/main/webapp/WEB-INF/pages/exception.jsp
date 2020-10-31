<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>主页</title>
<!--[if lt IE 9]>
	<script src="js/html5.js"></script>
	<script src="js/css3-mediaqueries.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath }/static/jquery/jquery-1.8.2.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/static/jquery/jquery.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js" charset="utf-8"></script>
<link href="${pageContext.request.contextPath }/static/exception/css/404.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(function() {
		var h = $(window).height();
		$('body').height(h);
		$('.mianBox').height(h);
		centerWindow(".tipInfo");
	});

	//2.将盒子方法放入这个方，方便法统一调用
	function centerWindow(a) {
		center(a);
		//自适应窗口
		$(window).bind('scroll resize',
				function() {
					center(a);
				});
	}

	//1.居中方法，传入需要剧中的标签
	function center(a) {
		var wWidth = $(window).width();
		var wHeight = $(window).height();
		var boxWidth = $(a).width();
		var boxHeight = $(a).height();
		var scrollTop = $(window).scrollTop();
		var scrollLeft = $(window).scrollLeft();
		var top = scrollTop + (wHeight - boxHeight) / 2;
		var left = scrollLeft + (wWidth - boxWidth) / 2;
		$(a).css({
			"top": top,
			"left": left
		});
	}
</script>

</head>
<body>
<div class="mianBox">
	<img src="${pageContext.request.contextPath }/static/exception/images/yun0.png" alt="" class="yun yun0" />
	<img src="${pageContext.request.contextPath }/static/exception/images/yun1.png" alt="" class="yun yun1" />
	<img src="${pageContext.request.contextPath }/static/exception/images/yun2.png" alt="" class="yun yun2" />
	<img src="${pageContext.request.contextPath }/static/exception/images/bird.png" alt="" class="bird" />
	<img src="${pageContext.request.contextPath }/static/exception/images/san.png" alt="" class="san" />
	<div class="tipInfo">
		<div class="in">
			<div class="textThis">
				<h2>出错啦,赶快摇人啊！</h2>
				<p><span>页面自动<a id="href" href="${pageContext.request.contextPath }/">跳转</a>到首页</span><span>等待<b id="wait">30</b>秒</span></p>
				<script type="text/javascript">                            (function() {
						var wait = document.getElementById('wait'), href = document.getElementById('href').href;
						var interval = setInterval(function() {
							var time = --wait.innerHTML;
							if (time <= 0) {
								
								clearInterval(interval);
								location.href = "${pageContext.request.contextPath }/";
							}
							;
						}, 1000);
					})();
				</script>
			</div>
		</div>
	</div>
</div>

 
</body>
</html>
