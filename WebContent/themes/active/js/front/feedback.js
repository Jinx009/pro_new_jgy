$(function(){
	getData();
})
function goIndex(){
		window.sessionStorage.setItem('address','');
		window.sessionStorage.setItem('type','');
		location.href = '/active/page/index.html'
	}
function getData(){
	$.ajax({
		url:'/active/front/feedbackList.html',
		type:'POST',
		dataType:'json',
		success:function(res){
			new Vue({
   				  el: 'body',
   				  data:{data:res.data}
    		})
		}
	})
}

function add(){
	var score = $('input:radio[name="rating"]:checked').val();
	var type = $('#type').val();
	var data = {};
	data.content = $('#text').val();
	data.score = score;
	data.type = type;
	$.ajax({
		url:'/active/front/addFeedback.html',
		type:'POST',
		data:JSON.stringify(data),
		dataType:'json',
		contentType : 'application/json;charset=UTF-8',  
		success:function(res){
			if(res.status){
				alert('发表成功！');
				location.reload();
			}
		}
	})
}