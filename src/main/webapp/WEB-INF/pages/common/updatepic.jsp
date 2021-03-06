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
<style type="text/css">
#btndiv{
    position: fixed;
    right: 5px;
    bottom:0px;
}
</style>
</head>
<body>
<br>
<form class="layui-form" action="" enctype="multipart/form-data" method="post" id="add_form">
<input type="hidden" id="id" value="${menu.id }">
  <div class="layui-form-item">
    <label class="layui-form-label">名称</label>
    <div class="layui-input-block">
      <input type="text" id="name" name="name" value="${menu.name }" lay-verify="name" style="width: 80%" autocomplete="off" placeholder="请输入标题" class="layui-input">
    </div>
  </div>
  
    <div class="layui-form-item" id="btndiv">
     <button type="button" class="layui-btn"  onclick="commit1()" >保存</button> 
      <button type="button" class="layui-btn" onclick="cancel()">取消</button> 
  </div>
</form>
          
<script>
function cancel(){
	//parent.location.reload();
	parent.layer.close(parent.layer.getFrameIndex(window.name));
}
function commit1(){
	$.ajax({
      url:'${pageContext.request.contextPath }/common/updatepic?id='+$('#id').val()+'&name='+$('#name').val(),
      type:'POST',
      dataType:'JSON',
      data:{},
      success:function(data){
    	  if(data.code=10000){
    		  layer.msg(data.message, {time: 1000});
    		  parent.location.reload();
			  parent.layer.close(parent.layer.getFrameIndex(window.name));
			  parent.refreshTree();
    	  }else{
    		  layer.msg(data.message, {time: 1000});
    	  }
      }
	});
}
</script>

</body>
</html>