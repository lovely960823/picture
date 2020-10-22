function timeAxis(params) {
    $(".flowChart").append('<div class="startNode"></div>');
    var colorArr = [];

    //给每个对象添加color属性，并赋给一个随机的颜色
    for(var i=0;i<params.length;i++){
        params[i].color=getRandomColor();
    }
    
    for(var i=0;i<params.length;i++){
    	for(var j=0;j<params[i].name.length;j++){
    		var name = params[i].name;
    		var htm='';
    		for(var n=0;n<name.length;n++){
    			img='<span id="myspan" style="width:20px;" align="center">'+name[n]+'</span><img class="nameimg" src="/static/images/tuoyuan.png" style="width:30px;height:30px;">';
    			htm=htm+img;
    		}
    		var length = name.length*30;
    	}
      
        
        $(".flowChart").append('<div class="oneNode '+params[i].value+'" >' +
            '        <div class="solid"></div>' +
            '        <div class="check" style="width:'+length+'px; background-color:rgba(0,0,0,0~1);border:0px;">'+htm+'</div>' +
            '        <div class="tag-boder"></div>' +
            '        <div class="NodeDetail" >' +
            '            <div class="NodeDetail-content dot" style="width:250px;height: 250px;background: url(/static/images/bgk.png);background-size: cover;"><img class="mainimg" alt="" onmouseover="setSonId('+params[i].id+','+params[i].folder+')" src="'+params[i].value+'" onclick="viewAndChecknode('+params[i].id+')" style="width:250px;height:220px;"></div>' +
            '        </div>' +
            '    </div>'
            
            
        );

    }
    $(".flowChart").append('<div class="endNode"></div>');
    $(".flowChart .oneNode:even").addClass('upNode');
    $(".flowChart .oneNode:odd").addClass('bottomNode');
     var xx = $(".oneNode ")[0].clientWidth;
        var x = params.length+1;
      $(".flowChart")[0].style.width=xx*x+"px";
}

//获得随机颜色
function getRandomColor()
{
    var c = '#';
    var cArray = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'];
    for(var i = 0; i < 6;i++)
    {
        var cIndex = Math.round(Math.random()*15);
        c += cArray[cIndex];
    }
    return c;
}
//处理颜色
var reg = /^#([0-9a-fA-f]{3}|[0-9a-fA-f]{6})$/;
String.prototype.colorRgba = function(){
    var sColor = this.toLowerCase();
    if(sColor && reg.test(sColor)){
        if(sColor.length === 4){
            var sColorNew = "#";
            for(var i=1; i<4; i+=1){
                sColorNew += sColor.slice(i,i+1).concat(sColor.slice(i,i+1));
            }
            sColor = sColorNew;
        }
        //处理六位的颜色值
        var sColorChange = [];
        for(var i=1; i<7; i+=2){
            sColorChange.push(parseInt("0x"+sColor.slice(i,i+2)));
        }
        return "rgba(" + sColorChange.join(",") + ",0.8)";
    }else{
        return sColor;
    }
};

