<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>相册</title>
<!--[if lt IE 9]>
	<script src="js/html5.js"></script>
	<script src="js/css3-mediaqueries.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath }/static/jquery/jquery-1.8.2.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/static/jquery/jquery.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js" charset="utf-8"></script>

<script src="${pageContext.request.contextPath }/static/layui/layui-v2.5.6/layui/layui.all.js" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/layui-v2.5.6/layui/css/layui.css">

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/picbofang2/css/jq22.css"></link>


</head>
<body>
<!-- 代码 开始 -->
<div id="content">
    <div class="mygallery clearfix">
	<div class="tn3 album">
	    <h4>Fixed Dimensions</h4>
	    <div class="tn3 description">Images with fixed dimensions</div>
	    <div class="tn3 thumb">images/620x378/1.png</div>
	    <ol>
	    <c:forEach items="${list }" var="list">
	    	<li>
		    <h4>${list.name }</h4>
		    <div class="tn3 description"></div>
		    <a href="${list.img }">
			<img src="${list.img }" />
		    </a>
		</li>
	    </c:forEach>
		<!-- <li>
		    <h4>Hohensalzburg Castle</h4>
		    <div class="tn3 description">Salzburg, Austria</div>
		    <a href="images/620x378/1.png">
			<img src="images/620x378/1.png" />
		    </a>
		</li> -->

	    </ol>
	</div>
    </div>
</div>
<script src="${pageContext.request.contextPath }/static/picbofang2/js/jquery.tn3lite.min.js"></script>
<script>
$(document).ready(function() {
	var tn1 = $('.mygallery').tn3({
		skinDir:"skins",
		imageClick:"fullscreen",
		image:{
		maxZoom:1.5,
		crop:true,
		clickEvent:"dblclick",
		transitions:[{
		type:"blinds"
		},{
		type:"grid"
		},{
		type:"grid",
		duration:460,
		easing:"easeInQuad",
		gridX:1,
		gridY:8,
		// flat, diagonal, circle, random
		sort:"random",
		sortReverse:false,
		diagonalStart:"bl",
		// fade, scale
		method:"scale",
		partDuration:360,
		partEasing:"easeOutSine",
		partDirection:"left"
		}]
		}
	});
});

//给layer.open添加esc事件 
$('body',document).on('keyup', function (e) {
    if (e.which === 27) {
    	//关闭自己
    	parent.layer.close(parent.layer.getFrameIndex(window.name));
    }
});
</script>
<!-- 代码 结束 -->

</body>
</html>
