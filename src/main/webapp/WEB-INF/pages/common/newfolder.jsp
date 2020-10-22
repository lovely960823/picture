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

<!-- 照片裁剪 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/cj/css/cropper.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/cj/css/ImgCropping.css">
<script src="${pageContext.request.contextPath }/static/cj/js/cropper.min.js"></script>
	
<script src="https://cdn.bootcdn.net/ajax/libs/blueimp-md5/1.0.1/js/md5.js" charset="utf-8"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/blueimp-md5/1.0.1/js/md5.min.js" charset="utf-8"></script>	


<style type="text/css">
#btndiv{
    position: fixed;
    right: 5px;
    bottom:0px;
}
.layui-upload-list {
    margin: 10px 0;
    margin-top: 44px;
}
</style>

</head>
<body>
<br>
<form action="" id="form1" enctype="multipart/form-data">
<input type="hidden" id="id" value="${id }" name="id">
<input name="img" id="img" value="" type="hidden">
<div class="layui-form-item">
    <label class="layui-form-label">相册名称</label>
    <div class="layui-input-block">
      <input type="text" id="name" name="name"  style="width: 80%" autocomplete="off" placeholder="请输入标题" class="layui-input">
    </div>
  </div>
</form>

   <button id="replaceImg" class="l-btn">相册封面</button> 
  <label class="layui-form-label">相册封面</label>
<div style="width: 150px;height: 150px;border: solid 1px #555;padding: 5px;margin-top: 10px;margin-left: 110px;" >
    <img id="finalImg" src="" width="100%">
</div>
  
  <div class="layui-form-item" id="btndiv">
     <button type="button" class="layui-btn"  onclick="commit1()" >保存</button> 
      <button type="button" class="layui-btn" onclick="cancel()">取消</button> 
  </div>
 
 <!--图片裁剪框 start-->
<div style="display: none" class="tailoring-container">
    <div class="black-cloth" onclick="closeTailor(this)"></div>
    <div class="tailoring-content">
            <div class="tailoring-content-one">
                <label title="上传图片" for="chooseImg" class="l-btn choose-btn">
                    <input type="file" accept="image/jpg,image/jpeg,image/png" name="file" id="chooseImg" class="hidden" onchange="selectImg(this)">
                    选择图片
                </label>
                <div class="close-tailoring"  onclick="closeTailor(this)">×</div>
            </div>
            <div class="tailoring-content-two">
                <div class="tailoring-box-parcel">
                    <img id="tailoringImg">
                </div>
                <div class="preview-box-parcel">
                    <p>图片预览：</p>
                    <div class="square previewImg"></div>
                    <!-- <div class="circular previewImg"></div> -->
                </div>
            </div>
            <div class="tailoring-content-three">
                <button class="l-btn cropper-reset-btn">复位</button>
                <button class="l-btn cropper-rotate-btn">旋转</button>
                <button class="l-btn cropper-scaleX-btn">换向</button>
                <button class="l-btn sureCut" id="sureCut">确定</button>
            </div>
        </div>
</div>
<!--图片裁剪框 end-->

</body>

<script>
function cancel(){
	//parent.location.reload();
	parent.layer.close(parent.layer.getFrameIndex(window.name));
}
function commit1(){
	var name = $('#name').val();
	var id = $('#id').val();
	var img = $('#finalImg').attr("src");
	if(name==null||name==''){
		layer.msg('名称为必填项', {time: 1000});
		$('#name').focus();
		return ;
	}
	
	//加载loding
    var loading = layer.load(0, {
        shade: false
    });
	
	$('#img').val($('#finalImg').attr("src"));//点击的时候赋值
	var form = new FormData(document.getElementById("form1"));
	$.ajax({  
        url: "${pageContext.request.contextPath }/common/newfolder",
        type: 'POST',  
        data: form,  
        timeout : 10000, //超时时间设置，单位毫秒
        async: false,  
        cache: false,  
        contentType: false,  
        processData: false, 
        success: function (data) { 
        	if(data.code=10000){
      		  parent.location.reload();
      		  layer.closeAll();
  			  parent.layer.close(parent.layer.getFrameIndex(window.name));
  			  parent.refreshTree();
      	  }else{
      		  layer.msg(data.message, {time: 1000});
      	  }
       	 //关闭加载loding
         layer.close(loading);
       	},  
        error: function (data) {
        	layer.msg(data.message, {time: 1000});
        }
	});
	//img = md5(img);
	/* $.ajax({
      url:'${pageContext.request.contextPath }/common/newfolder',
      type:'POST',
      //contentType : 'application/json;charset=utf-8',
      dataType:'JSON',
      data:{"id":id,"img":img,"name":name},
      success:function(data){
    	  if(data.code=10000){
    		  parent.location.reload();
    		  layer.closeAll();
			  parent.layer.close(parent.layer.getFrameIndex(window.name));
			  parent.refreshTree();
    	  }else{
    		  layer.msg(data.message, {time: 1000});
    	  }
      }
	}); */
}

//给layer.open添加esc事件 
/* $('body',document).on('keyup', function (e) {
    if (e.which === 27) {
    	//关闭自己
    	parent.layer.close(parent.layer.getFrameIndex(window.name));
    }
}); */










//弹出框水平垂直居中
(window.onresize = function () {
  var win_height = $(window).height();
  var win_width = $(window).width();
  if (win_width <= 768){
      $(".tailoring-content").css({
          "top": (win_height - $(".tailoring-content").outerHeight())/2,
          "left": 0
      });
  }else{
      $(".tailoring-content").css({
          "top": (win_height - $(".tailoring-content").outerHeight())/2,
          "left": (win_width - $(".tailoring-content").outerWidth())/2
      });
  }
})();

//弹出图片裁剪框
$("#replaceImg").on("click",function () {
  $(".tailoring-container").toggle();
});
//图像上传
function selectImg(file) {
  if (!file.files || !file.files[0]){
      return;
  }
  var imagSize = document.getElementById("chooseImg").files[0].size;
  if(imagSize > 1024 * 1024 * 3){
	  layer.msg('请选择3m以内的图片', {time: 1000});
	  return ;
  }
  
  var reader = new FileReader();
  reader.onload = function (evt) {
      var replaceSrc = evt.target.result;
      //更换cropper的图片
      $('#tailoringImg').cropper('replace', replaceSrc,false);//默认false，适应高度，不失真
  }
  reader.readAsDataURL(file.files[0]);
}
//cropper图片裁剪
$('#tailoringImg').cropper({
  aspectRatio: 1/1,//默认比例
  preview: '.previewImg',//预览视图
  guides: false,  //裁剪框的虚线(九宫格)
  autoCropArea: 0.5,  //0-1之间的数值，定义自动剪裁区域的大小，默认0.8
  movable: false, //是否允许移动图片
  dragCrop: true,  //是否允许移除当前的剪裁框，并通过拖动来新建一个剪裁框区域
  movable: true,  //是否允许移动剪裁框
  resizable: true,  //是否允许改变裁剪框的大小
  zoomable: false,  //是否允许缩放图片大小
  mouseWheelZoom: false,  //是否允许通过鼠标滚轮来缩放图片
  touchDragZoom: true,  //是否允许通过触摸移动来缩放图片
  rotatable: true,  //是否允许旋转图片
  crop: function(e) {
      // 输出结果数据裁剪图像。
  }
});
//旋转
$(".cropper-rotate-btn").on("click",function () {
  $('#tailoringImg').cropper("rotate", 45);
});
//复位
$(".cropper-reset-btn").on("click",function () {
  $('#tailoringImg').cropper("reset");
});
//换向
var flagX = true;
$(".cropper-scaleX-btn").on("click",function () {
  if(flagX){
      $('#tailoringImg').cropper("scaleX", -1);
      flagX = false;
  }else{
      $('#tailoringImg').cropper("scaleX", 1);
      flagX = true;
  }
  flagX != flagX;
});

//裁剪后的处理
$("#sureCut").on("click",function () {
  if ($("#tailoringImg").attr("src") == null ){
      return false;
  }else{
      var cas = $('#tailoringImg').cropper('getCroppedCanvas');//获取被裁剪后的canvas
      var base64url = cas.toDataURL('image/png'); //转换为base64地址形式
      $("#finalImg").prop("src",base64url);//显示为图片的形式

      //关闭裁剪框
      closeTailor();
  }
});
//关闭裁剪框
function closeTailor() {
  $(".tailoring-container").toggle();
}

</script>
</html>