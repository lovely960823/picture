<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="${pageContext.request.contextPath }/static/jquery/jquery-1.8.2.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/static/jquery/jquery.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js" charset="utf-8"></script>

<script src="${pageContext.request.contextPath }/static/layui/layui-v2.5.6/layui/layui.all.js" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/layui-v2.5.6/layui/css/layui.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传视频结果</title>
</head>
<body>
<input id="path" value="${path}" type="hidden">
	<div id="video" style="width:600px;height:400px;left: 50px;"></div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/ckplayer/ckplayer.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	var path = $("#path").val();
	var videoObject = {
	        container: '#video',//“#”代表容器的ID，“.”或“”代表容器的class
	        variable: 'player',//该属性必需设置，值等于下面的new chplayer()的对象
	        video:path
	 };
	var player=new ckplayer(videoObject);
})
</script>

</html>