<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/cropbox/cropbox.css">
	<script src="${pageContext.request.contextPath }/static/jquery/jquery-1.8.2.min.js" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath }/static/cropbox/cropbox.js" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath }/static/layui/layui-v2.5.6/layui/layui.all.js" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/layui-v2.5.6/layui/css/layui.css">
	<style type="text/css">
	
#btndiv{
    position: fixed;
    right: 5px;
    bottom:0px;
	}
.layui-form-item {
    margin-bottom: 15px;
    clear: both;
    *zoom: 1;
    margin-top: 6px;
}

	</style>
</head>
<body class="white-bg">
<form action="" id="form1" enctype="multipart/form-data">
<input type="hidden" id="id" value="${id }">
<input type="hidden" id="menuId" value="${menu.id }">
<div class="layui-form-item">
    <label class="layui-form-label">相册名称</label>
    <div class="layui-input-block">
      <input type="text" id="xcName" name="name" value="${menu.name }" style="width: 87%" autocomplete="off" maxlength="6" placeholder="请输入标题" class="layui-input">
    </div>
  </div>
<div class="layui-form-item">
    <label class="layui-form-label">相册封面</label>
    <div class="layui-input-block">
      <div class="new-contentarea tc">
	           <a href="javascript:void(0)" class="upload-img"> <label for="avatar">上传图像</label> </a> 
	           <input type="file" class="" name="avatar" id="avatar" accept="image/*"/>
	       </div> 
    </div>
  </div>
</form>
    <div class="container"> 
        <div class="imageBox"> 
	        <div class="thumbBox"></div> 
	        <div class="spinner" style="display: none">Loading...</div> 
	   </div> 
	   <div class="action"> 
	   <!-- <input type="button" id="btnCrop" class="Btnsty_peyton" value="预览" />  -->
	   <input type="button" id="btnZoomIn" style="float: left;" class="Btnsty_peyton" value="+" /> 
	   <input type="button" id="btnZoomOut" style="float: left;" class="Btnsty_peyton" value="-" /> 
	   </div> 
	   <!-- <div class="cropped"></div>  -->
	   <div class="layui-form-item" id="btndiv">
     <button type="button" class="layui-btn"  onclick="submitHandler()" >保存</button> 
      <button type="button" class="layui-btn" onclick="cancel()">取消</button> 
  	</div>
    </div>
<script type="text/javascript">

var cropper;
$(window).load(function() {
	var menuImg = "${menu.img }";
	var avatar = '';
    var options = {
        thumbBox: '.thumbBox',
        spinner: '.spinner',
        imgSrc: menuImg
    }
    cropper = $('.imageBox').cropbox(options);
    $('#avatar').on('change', function() {
        var reader = new FileReader();
        reader.onload = function(e) {
            options.imgSrc = e.target.result;
            //根据MIME判断上传的文件是不是图片类型
            if((options.imgSrc).indexOf("image/")==-1){
                $.modal.alertWarning("文件格式错误，请上传图片类型,如：JPG，PNG后缀的文件。");
            } else {
                cropper = $('.imageBox').cropbox(options);
            }
        }
        reader.readAsDataURL(this.files[0]);
    })
    
	/* $('#btnCrop').on('click', function(){
		var img = cropper.getDataURL();
		$('.cropped').html('');
		$('.cropped').append('<img src="'+img+'" align="absmiddle" style="width:64px;margin-top:4px;box-shadow:0px 0px 12px #7E7E7E;" ><p>64px*64px</p>');
		$('.cropped').append('<img src="'+img+'" align="absmiddle" style="width:128px;margin-top:4px;box-shadow:0px 0px 12px #7E7E7E;"><p>128px*128px</p>');
		$('.cropped').append('<img src="'+img+'" align="absmiddle" style="width:180px;margin-top:4px;box-shadow:0px 0px 12px #7E7E7E;"><p>180px*180px</p>');
	}) */
	
	$('#btnZoomIn').on('click', function(){
		cropper.zoomIn();
	})
	
	$('#btnZoomOut').on('click', function(){
		cropper.zoomOut();
	})
});

function submitHandler() {
	var xcName = $("#xcName").val();
	if(xcName==null||xcName==''){
		layer.msg('名称为必填项', {time: 1000});
		$('#name').focus();
		return ;
	}
	var id = $("#id").val();
	var menuId = $("#menuId").val();
	var formdata = new FormData();
	var img = cropper.getBlob();
	formdata.append("avatarfile", img);
    formdata.append("xcName",xcName);
    formdata.append("id",id);
    formdata.append("menuId",menuId);
    $.ajax({
        url: "${pageContext.request.contextPath }/common/newfolder",
        data: formdata,
        type: "post",
        processData: false,
        contentType: false,
        success: function(data) {
        	if(data.code=10000){
        		  parent.location.reload();
    			  parent.layer.close(parent.layer.getFrameIndex(window.name));
        	  }else{
        		  layer.msg(data.message, {time: 1000});
        	  }
        }
    })
}
function cancel(){
	//parent.location.reload();
	parent.layer.close(parent.layer.getFrameIndex(window.name));
}
</script>
</body>
</html>
