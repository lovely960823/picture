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

</head>
<body>
<br>
<input id="id" value="${id }" type="hidden">
<div class="layui-upload">
  <button type="button" class="layui-btn" id="test2">多图片上传</button>
  <button type="button" class="layui-btn" onclick="cancel()">关闭</button>  
  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
    预览图：
    <div class="layui-upload-list" id="demo2"></div>
 </blockquote>
</div>	
          
<script>
function cancel(){
	parent.layer.close(parent.layer.getFrameIndex(window.name));
}
layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
//多图片上传
  upload.render({
    elem: '#test2'
    ,url: '${pageContext.request.contextPath }/common/uploadFile?id='+$('#id').val() //改成您自己的上传接口
    ,multiple: true
    ,before: function(obj){
      //预读本地文件示例，不支持ie8
      obj.preview(function(index, file, result){
        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" style="width: 150px;height: 150px;" class="layui-upload-img">')
      });
    }
    ,done: function(res){
      //上传完毕
    	layer.msg('上传成功', {icon: 6}); 
      parent.getDataLiu();
    }
  });
  
})

//给layer.open添加esc事件 
$('body',document).on('keyup', function (e) {
    if (e.which === 27) {
    	//关闭自己
    	parent.layer.close(parent.layer.getFrameIndex(window.name));
    }
});
</script>

</body>
</html>