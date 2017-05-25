<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>巾帼园</title>
	<meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <script src="/themes/js/vue.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/Swiper/3.1.7/css/swiper.min.css">
    <script src="http://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/Swiper/3.1.7/js/swiper.jquery.min.js"></script>
    <script src="/themes/active/js/front/mobiscroll.custom-2.6.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/themes/active/css/front/reset.css">
    <link rel="stylesheet" type="text/css" href="/themes/active/css/front/mobiscroll.custom-2.6.2.min.css">
    <link rel="stylesheet" type="text/css" href="/themes/active/css/front/jgy.css">
    <link rel="stylesheet" type="text/css" href="/themes/active/css/front/starability-all.min.css"/>
    <script src="/themes/active/js/front/feedback.js"></script>
    <style type="text/css">
    .this-tables{
    	width: 100%;
    }
    .left-td{
    	width: 30%;
    	padding-left: 15px;
    	font-size: 14px;
    	text-align: left;
    	height: 40px;
    }
    .right-td{
    	text-align: left;
    	font-size: 14px;
    	padding-left: 15px;
    	height: 40px;
    }
     select{
		-webkit-appearance:none;appearance:none;outline:none;-webkit-tap-highlight-color:rgba(0,0,0,0);
	}
	html,body{
		background: white;
	}
	.ability-fade {
	    display: block;
	    position: relative;
	    width: 100px;
	    min-height: 60px;
	    padding: 0;
	    border: none;
	}
	.starability-fade {
	    display: block;
	    position: relative;
	    width: 100px;
	    min-height: 60px;
	    padding: 0;
	    border: none;
	     margin-top: 15px;
	}
	.starability-fade>label {
	    position: relative;
	    display: inline-block;
	    float: right;
	    width: 20px;
	    height: 20px;
	    font-size: .1em;
	    color: transparent;
	    cursor: pointer;
	    background-repeat: no-repeat;
	}
	.starability-fade>label {
	    background-size: 20px auto;
	}
	.starability-fade>label:before {
	    display: none;
	    position: absolute;
	    content: ' ';
	    width: 20px;
	    height: 20px;
	    background-repeat: no-repeat;
	    background-position: 0 -20px;
	    bottom: -10px;
	}
	.starability-fade>label:before {
	    display: none;
	    position: absolute;
	    content: ' ';
	    width: 20px;
	    height: 20px;
	    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAA8CAMAAABGivqtAAAAxlBMV…Jht5rnRQA4z9zyRRaXssvyqp5I6Vutv0vkpJaJtnjpz/8B19ytIayazLoAAAAASUVORK5CYII=);
	    background-repeat: no-repeat;
	    background-position: 0 -20px;
	    bottom: -10px;
	}
	.starability-fade>input:hover~label {
	    background-position: 0 -20px;
	}
	.starability-fade>input:checked~label, .starability-fade>input:focus~label, .starability-fade>input:hover~label {
	    background-position: 0 -20px;
	}
    </style>
</head>
<body>
		<nav class="feed-back-nav">
		<ul>
			<li class="actived" >我的反馈<span></span></li>
			<li>我要反馈<span ></span></li>
		</ul>
	</nav>
	<div class="feed-back-content">
		<div  id="list" >
			<textarea v-for="model in data" v-text="model.content" style="min-height:1.1rem;" readonly="readonly" ></textarea>
		</div>
		<div style="display: none">
			<table class="this-tables">
				<tr>
					<td class="left-td" >选择类别：</td>
					<td class="right-td" >
						<select id="type" >
							<option value="" >请选择类型</option>
							<option value="白玉兰女子讲堂" >白玉兰女子讲堂</option>
							<option value="少儿培训" >少儿培训</option>
							<option value="相亲交友" >相亲交友</option>
							<option value="家政母婴" >家政母婴</option>
							<option value="7点不一样" >7点不一样</option>
							<option value=" 志愿者招募" > 志愿者招募</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="left-td" style="height: 40px;" valign="middle" >您的评分：</td>
					<td class="right-td"style="height: 40px;" valign="middle"   >
						<form>
						  <fieldset class="starability-fade" style="min-height: 40px;">
						    <input type="radio" id="rate5" name="rating" value="5" />
						    <label for="rate5"></label>
						    <input type="radio" id="rate4" name="rating" value="4" />
						    <label for="rate4"></label>
						    <input type="radio" id="rate3" name="rating" value="3" />
						    <label for="rate3"></label>
						    <input type="radio" id="rate2" name="rating" value="2" />
						    <label for="rate2"></label>
						    <input type="radio" id="rate1" name="rating" value="1" />
						    <label for="rate1"></label>
						  </fieldset>
						</form>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="left-td"  >填写反馈：</td>
				</tr>
				<tr>
					<td colspan="2" >
						<textarea placeholder="请输入您的反馈内容"  style="min-height:1.1rem;margin-top:15px;" id="text" ></textarea>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<a class="btn" style="display: none" onclick="add()" >发送</a>
	<div class="blank"></div>
	<footer>
		<dl>
			<dt><a  onclick="goIndex();" ><img src="/themes/active/img/home.png" /></a></dt>
			<dd>活动</dd>
		</dl>
		<dl>
			<dt><a href="/active/page/photo.html" ><img src="/themes/active/img/ablum.png" /></a></dt>
			<dd>相册</dd>
		</dl>
		<dl>
			<dt><a href="/active/page/feedback.html" ><img src="/themes/active/img/comments.png" /></a></dt>
			<dd>反馈</dd>
		</dl>
		<dl>
			<dt><a href="/active/page/my.html" ><img src="/themes/active/img/data.png" /></a></dt>
			<dd>我的</dd>
		</dl>
	</footer>
	<script type="text/javascript">
		$(function(){
			$(".feed-back-nav ul li").on("click",function(){
				var index = $(this).index();
				if(index>0){
					$('.btn').show();
				}else{
					$('.btn').hide();
				}
				$(this).addClass('actived').siblings().removeClass('actived');
				$(".feed-back-content div").hide();
				$(".feed-back-content div").eq(index).show();
			});
		})
	</script>
</body>
</html>