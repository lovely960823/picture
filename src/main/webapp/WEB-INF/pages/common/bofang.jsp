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

<script src="${pageContext.request.contextPath }/static/picbofang/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath }/static/picbofang/js/jquery.timers-1.2.js"></script>
<script src="${pageContext.request.contextPath }/static/picbofang/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath }/static/picbofang/js/jquery.galleryview-3.0-dev.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/picbofang/css/jquery.galleryview-3.0-dev.css" />
<style type="text/css">
.gv_galleryWrap {
    position: relative;
    background: #222;
    font-size: 10pt;
    top: 0px;
    height: 640px!important;
}
.gv_panel img {
    position: absolute;
    visibility: visible;
    top: 0px !important;
    left: 0px;
}
.gv_gallery {
    position: relative;
    overflow: hidden;
    height: 640px!important;
}
.gv_panel {
    filter: inherit;
    position: absolute;
    top: 0px;
    left: 0px;
    z-index: 100;
    overflow: hidden;
    height: 640px!important;
}
.gv_panelWrap {
    filter: inherit;
    position: absolute;
    overflow: hidden;
    height: 600px!important;
}

</style>
</head>
<body>
<center>
	<ul id="myGallery">
		<c:forEach items="${list }" var="list">
			<li><img src="${list.img }" alt="${list.name }"  /></li>
		</c:forEach>
		<%-- <li><img src="${pageContext.request.contextPath }/static/picview/images/bp1.jpg" alt="Lone Tree Yellowstone" />
		<li><img src="${pageContext.request.contextPath }/static/picview/images/bp2.jpg" alt="Is He Still There?!" />
		<li><img src="${pageContext.request.contextPath }/static/picview/images/bp4.jpg" alt="Noni Nectar For Green Gecko" />
		<li><img src="${pageContext.request.contextPath }/static/picview/images/bp7.jpg" alt="Flight of an Eagle Owl" />
		<li><img src="${pageContext.request.contextPath }/static/picview/images/bp14.jpg" alt="Winter Lollipops" />
		<li><img src="${pageContext.request.contextPath }/static/picview/images/bp26.jpg" alt="Day of Youth" />
		<li><img src="${pageContext.request.contextPath }/static/picview/images/bp27.jpg" alt="Sunbathing Underwater" />
		<li><img src="${pageContext.request.contextPath }/static/picview/images/bp28.jpg" alt="Untitled" />
		<li><img src="${pageContext.request.contextPath }/static/picview/images/bp41.jpg" alt="New Orleans Streetcar" />
		<li><img src="${pageContext.request.contextPath }/static/picview/images/bp49.jpg" alt="By The Wind of Chance" />
		<li><img src="${pageContext.request.contextPath }/static/picview/images/bp52.jpg" alt="Fishing on the Cloud" />
		<li><img src="${pageContext.request.contextPath }/static/picview/images/bp53.jpg" alt="Blue Lagoon" />
		<li><img src="${pageContext.request.contextPath }/static/picview/images/bp54.jpg" alt="Time" /> --%>
	</ul>
</center>
	<script>
	$(function(){
		$('#myGallery').galleryView();
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
