'use strict'
$(document).ready(function() {
	loadData();
	$("#btn_sendMsg").click(function(){
		sendMsg();
	});
});

//頁面數據
var _list;
function decodeUnicode(str) {  
    str = str.replace(/\\/g, "%");  
    return unescape(str);  
}  
/**
 * 加载参与活动用户列表数据
 * @returns
 */
function loadData(){
	var _activeId=$("#people_activeId").val();
	$.ajax({
        url:"active/peopleController/loadData.do",
        data:{
        	activeId:_activeId,
        	currentPage:_currentPage
        },
        success:function(data){
        	$("tbody").empty();
        	updatePageParams(data.page);
        	if(_totalPages>0){
        		_list=data.list;
            	$.each(data.list,function(i,people){
            		var _row="<tr>"+
            		    "<td style=\"display:none;\">"+i+"</td>"+
            		    "<td><input type=\"checkbox\" name=\"people_phone\" value=\""+people.mobiePhone+"\"></td>"+
            		    "<td>"+people.nickName+"</td>"+
            		  	"<td>"+people.mobiePhone+"</td>"+
            		  	"<td>"+people.name+"</td>"+
            		  	"<td>"+people.addTime+"</td>"+
            		  	"</tr>"
            		$("tbody").append(_row);
            	})
        	};
        }
    });

}

function sendMsg(){
	var _phones="";
	var _activeId=$("#people_activeId").val();
	var _sendContent = $('#msgContent').val();
	$("input[name='people_phone']").each(function(i,checkBox_people){
		if(checkBox_people.checked){
			_phones+=checkBox_people.value+"_";
		}
	})
	if(_phones!=""){
		_phones=_phones.substr(0,_phones.length-1);
		$.ajax({
	        url:"active/peopleController/sendMsg.do",
	        type:'post',
	        data:{
	        	phones:_phones,
	        	activeId:_activeId,
	        	sendContent:_sendContent
	        },
	        success:function(data){
	        	 if(data.success){
	        		 alert("发送成功!");
	        	 }
	        }
	    });
	}
}




