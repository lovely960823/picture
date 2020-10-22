function timeAxis(params) {
    for(var i=0;i<params.length;i++){
        $(".flowChart").append('<div class="oneNode '+params[i].value+'" >' +
            '        <div class="solid" ><span style="font-family: cursive;font-size: 45px;font-weight: bold;color: #7f3a20;">'+params[i].name+'</span></div>' +
           /* '        <div class="check" style="background:'+params[i].color.colorRgba()+';border-color: '+params[i].color+' ">'+params[i].time+'</div>' +
            '        <div class="tag-boder"></div>' +*/
            '        <div class="NodeDetail" style="background-image:url(/static/teacher/images/ic_tu1.png)">' +
            '            <div class="NodeDetail-content dot" ><img class="mainimg" alt="" onmouseover="setSonId('+params[i].id+','+params[i].folder+')" src="'+params[i].value+'"  style="width:250px;height:220px;" onclick="viewAndChecknode('+params[i].id+')"></div>' +
            '        </div>' +
            '    </div>'
            
            
        );

    }

    $(".flowChart").append('<div class="endNode"></div>');
    $(".flowChart .oneNode:even").addClass('upNode');
    $(".flowChart .oneNode:odd").addClass('upNode');
    var xx = $(".oneNode ")[0].clientWidth;
    var x = params.length+1;
  $(".flowChart")[0].style.width=xx*x+"px";
}
