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

<script src="${pageContext.request.contextPath }/static/layui/layui-v2.5.6/layui/layui.all.js" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/layui-v2.5.6/layui/css/layui.css">

<style type="text/css">
@media (max-width: 1920px) {
      #orgTree{
        height:100% !important;
      }
    } 
    @media (max-width: 1680px) {
      #orgTree{
        height:100% !important;
      }
    } 
    @media (max-width: 1440px) {
      #orgTree{
        height:100% !important;
      }
    } 
    @media (max-width: 1366px) {
      #orgTree{
        height:100% !important;
      }
    } 
    @media (max-width: 1280px) {
      #orgTree{
        height:100% !important;
      }
    } 
    @media (max-width: 1100px) {
      #orgTree{
        height:100% !important;
      }
    } 
    @media (max-width: 1024px) {
      #orgTree{
        
      }
    } 
  @media (max-width: 1920px) {
      #iframe0{
        height:100% !important;
      }
    } 
    @media (max-width: 1680px) {
      #iframe0{
        height:100% !important;
      }
    } 
    @media (max-width: 1440px) {
      #iframe0{
        height:100% !important;
      }
    } 
    @media (max-width: 1366px) {
      #iframe0{
        height:100% !important;
      }
    } 
    @media (max-width: 1280px) {
      #iframe0{
        height:100% !important;
      }
    } 
    @media (max-width: 1100px) {
      #iframe0{
        height:100% !important;
      }
    } 
    @media (max-width: 1024px) {
      #iframe0{
        height:100% !important;
      }
    }

#changeskin{
	position: fixed;
	z-index:99999999999999;
	right: 10px;
    top: 10px;
}

img {
    border: none;
    height: 100%;
    width: 100%;
}
</style>
</head>
<body>
<a id="changeskin" onclick="tochangeskin()"><img src="${pageContext.request.contextPath }/static/images/changeskin.png" style="width: 50px;height: 50px;"></a>

<div class="layui-carousel" id="test10">
  <div carousel-item="">
    <div>
	    <img src="${pageContext.request.contextPath }/static/images/index1.jpg" onclick="toPage(2)" >
    </div>
    <div>
	    <img src="${pageContext.request.contextPath }/static/images/index2.jpg" onclick="toPage(3)" >
    </div>
    <div>
	    <img src="${pageContext.request.contextPath }/static/images/index3.jpg" onclick="toPage(4)" >
    </div>
  </div>
</div>
 
</body>
<script type="text/javascript">
var h = $(window).height(); //浏览器当前窗口可视区域高度
layui.use(['carousel', 'form'], function(){
	  var carousel = layui.carousel
	  ,form = layui.form;
	  //图片轮播
	  carousel.render({
	    elem: '#test10'
	    ,arrow: 'always'
	    ,full:'true'//全屏
	    ,anim:'fade'
	    ,autoplay:'true'
	    ,interval: 5000 //切换时间
	  });
});	  
function toPage(id){
	window.location.href="${pageContext.request.contextPath }/main/"+id;	
}

function tochangeskin(){
	layer.open({
        type: 2,
        skin: 'layui-layer-demo', //样式类名
        title: ['<h3>切换皮肤</h3>','color:white;background-color: white;color:#8A5843'],
        closeBtn: 0, //不显示关闭按钮
        anim: 2,
        area: ['600px', '450px'],
        shadeClose: true, //开启遮罩关闭
        content: '${pageContext.request.contextPath }/common/tochangeSkin'
    });
}

//阻止默认右键菜单
document.oncontextmenu = function (event) {
    event.preventDefault();
};

//获取指定元素下的button按钮
var first = $('.layui-carousel button')[0];
var second = $('.layui-carousel button')[1];
console.log(first);
console.log(second);
first.innerHTML='<img src="/static/images/left.png" style="width:35px;height:40px;">';
second.innerHTML='<img src="/static/images/right.png" style="width:35px;height:40px;">';
</script>
</html>
