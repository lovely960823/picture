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
.layui-form-item {
    clear: both;
    *zoom: 1;
    margin: 10px 40px 0 0;
}
</style>
</head>
<body>
<form class="layui-form" action="" id="form1">
<input name="id" id="id" value="${menu.id }" type="hidden">
 <div class="layui-form-item">
    <label class="layui-form-label">名称</label>
    <div class="layui-input-block">
      <input type="text" name="name" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="${menu.name }">
    </div>
 </div>
 
 <div class="layui-form-item">
    <label class="layui-form-label">档号</label>
    <div class="layui-input-block">
      <input type="text" name="dh" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="${menu.dh }">
    </div>
 </div>
 <div class="layui-form-item">
    <label class="layui-form-label">时间</label>
    <div class="layui-input-block">
      <input type="text" name="sj" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" value="${menu.sj }">
    </div>
 </div>
 <div class="layui-form-item">
    <label class="layui-form-label">人物</label>
    <div class="layui-input-block">
      <input type="text" name="rw" required  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input"  value="${menu.rw }">
    </div>
 </div>
<div class="layui-form-item layui-form-text">
    <label class="layui-form-label">背景</label>
    <div class="layui-input-block">
      <textarea name="bj" placeholder="请输入" class="layui-textarea" style="height: 30px;"> ${menu.bj }</textarea>
    </div>
  </div>
  
  <div align="right">
     <button type="button" class="layui-btn layui-btn-normal layui-btn-radius" style=" margin: 20px 50px 0 0;" onclick="updateBz()">确定</button>
     <!-- <button type="button" class="layui-btn layui-btn-primary layui-btn-radius" onclick="cancel()">取消</button> -->
  </div>
</form>
</body>
<script type="text/javascript">
function cancel(){
	parent.layer.closeAll('iframe');
}
function updateBz(){
	var form =$("#form1").serialize()
	 $.ajax({
	      url:'${pageContext.request.contextPath }/common/updateBz',
	      type:'POST',
	      dataType:'JSON',
	      data:form,
	      success:function(data){
	    	if(data.code==10000){
	    		layer.msg(data.message, {time: 1000});
	    		parent.getDataLiu();
	    	}else{
	    		layer.msg(data.message, {time: 1000});
	    	}
	    	}
		});
}

//给layer.open添加esc事件 
$('body',document).on('keyup', function (e) {
	console.log('1111111');
    if (e.which === 27) {
    	//关闭自己
    	parent.layer.close(parent.layer.getFrameIndex(window.name));
    }
});
</script>
</html>