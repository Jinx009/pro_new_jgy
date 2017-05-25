'use strict'
$(document).ready(function() {
	loadData();
});

//頁面數據
var _list;

/**
 * 加载反馈列表数据
 * @returns
 */
var a1 = new Array();
var a2 = new Array();
var a3 = new Array();
var a4 = new Array();
var a5 = new Array();
var a6 = new Array();
function getSum(a){
	var sum = 0;
	for(var i in a){
		sum += a[i];
	}
	var s = 0;
	if(a.length!=0){
		s = sum/a.length;
	}
	return '总分：'+sum+'；人数：'+a.length+'；平均分：'+s;
}
function loadData(){
	$.ajax({
        url:"active/feedbackController/loadData.do",
        data:{currentPage:_currentPage},
        success:function(data){
        	$("tbody").empty();
        	updatePageParams(data.page);
        	if(_totalPages>0){
        		_list=data.list;
            	$.each(data.list,function(i,feedback){
            		if(feedback.type=='白玉兰女子讲堂'){
            			a1.push(feedback.score);
            		}else if(feedback.type=='少儿培训'){
            			a2.push(feedback.score);
            		}else if(feedback.type=='相亲交友'){
            			a3.push(feedback.score);
            		}else if(feedback.type=='家政母婴'){
            			a4.push(feedback.score);
            		}else if(feedback.type=='7点不一样'){// 志愿者招募
            			a5.push(feedback.score);
            		}else if(feedback.type=='志愿者招募'){
            			a6.push(feedback.score);
            		}
            		$('#a1').html(getSum(a1));
            		$('#a2').html(getSum(a2));
            		$('#a3').html(getSum(a3));
            		$('#a4').html(getSum(a4));
            		$('#a5').html(getSum(a5));
            		$('#a6').html(getSum(a6));
            		var _row="<tr>"+
            		    "<td style=\"display:none;\">"+i+"</td>"+
//            		  	"<td>"+decodeUnicode(feedback.nickName)+"</td>"+
            		    "<td>"+feedback.type+"</td>"+
            		    "<td>"+feedback.score+"</td>"+
            		  	"<td>"+feedback.content+"</td>"+
            		  	"<td>"+feedback.addTime+"</td>"+
            		  	"<td>"+feedback.phone+"</td>"+
            		  	"</tr>"
            		$("tbody").append(_row);
            	})
        	};
        }
    });

}

function decodeUnicode(str) {  
    str = str.replace(/\\/g, "%");  
    return unescape(str);  
}  

