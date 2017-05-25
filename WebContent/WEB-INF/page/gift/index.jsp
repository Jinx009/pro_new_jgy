<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
	<meta charset="utf-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title>抽奖活动</title>
    <script src="/themes/js/jquery.js" ></script>
    <script src="/themes/js/common.js" ></script>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <script src="/themes/js/gift/index.js" ></script>
    <link rel="stylesheet" type="text/css" href="/themes/css/gift/index.css" />
</head>
<body>
	<!-- 抽奖按钮start -->
	<div class="start-bg"  >
		<img class="start-img" src="/themes/css/gift/start.png" id="start" onclick="changeHash('3');" >
	</div>
	<!-- 抽奖池三等奖 -->
	<div class="gift" id="gift3" >
		<div class="gift-top" ></div>
		<div class="gift-main" >
			<div style="height: 5%;" ></div>
			<h2 class="gift-name" >三等奖</h2>
			<table class="main-table-3" >
				<tr>
					<td style="width: 6%;"></td>
					<td>员工号:</td><td id="num31"></td>
					<td>员工号:</td><td id="num32"></td>
					<td>员工号:</td><td id="num33"></td>
					<td>员工号:</td><td id="num34"></td>
					<td style="width: 6%;"></td>
				</tr>
				<tr>
					<td style="width: 6%;"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名:</td><td id="name31"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名:</td><td id="name32"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名:</td><td id="name33"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名:</td><td id="name34"></td>
					<td style="width: 6%;"></td>
				</tr>
				<tr><td  style="width: 6%;"></td></tr>
				<tr>
					<td style="width: 6%;"></td>
					<td>员工号:</td><td id="num35"></td>
					<td>员工号:</td><td id="num36"></td>
					<td>员工号:</td><td id="num37"></td>
					<td>员工号:</td><td id="num38"></td>
					<td style="width: 6%;"></td>
				</tr>
				<tr>
					<td style="width: 6%;"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名:</td><td id="name35"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名:</td><td id="name36"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名:</td><td id="name37"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名:</td><td id="name38"></td>
					<td style="width: 6%;"></td>
				</tr>
				<tr><td style="width: 6%;"></td></tr>
				<tr>
					<td style="width: 6%;"></td>
					<td>员工号:</td><td id="num39"></td>
					<td>员工号:</td><td id="num310"></td>
					<td>员工号:</td><td id="num311"></td>
					<td>员工号:</td><td id="num312"></td>
					<td style="width: 6%;"></td>
				</tr>
				<tr>
					<td style="width: 6%;"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名:</td><td id="name39"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名:</td><td id="name310"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名:</td><td id="name311"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名:</td><td id="name312"></td>
					<td style="width: 6%;"></td>
				</tr>
			</table>
		</div>
	</div>
		<!-- 抽奖池二等奖 -->
	<div class="gift" id="gift2" >
		<div class="gift-top" ></div>
		<div class="gift-main" >
			<div style="height: 5%;" ></div>
			<h2 class="gift-name" >二等奖</h2>
			<table class="main-table-2" >
				<tr>
					<td style="width: 4%;"></td>
					<td>员工号：</td><td id="num21"></td>
					<td>员工号：</td><td id="num22"></td>
				</tr>
				<tr>
					<td style="width: 4%;"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名：</td><td id="name21"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名：</td><td id="name22"></td>
				</tr>
				<tr><td style="width: 4%;"></td></tr>
				<tr>
					<td style="width: 4%;"></td>
					<td>员工号：</td><td id="num23"></td>
					<td>员工号：</td><td id="num24"></td>
				</tr>
				<tr>
					<td style="width: 4%;"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名：</td><td id="name23"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名：</td><td id="name24"></td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 抽奖池一等奖 -->
	<div class="gift" id="gift1" >
		<div class="gift-top" ></div>
		<div class="gift-main" >
			<div style="height: 5%;" ></div>
			<h2 class="gift-name" >一等奖</h2>
			<table class="main-table-1" >
				<tr>
					<td style="width: 15%" ></td>
					<td>员工号：</td><td id="num11"></td>
					<td style="width: 15%"></td>
				</tr>
				<tr>
					<td style="width: 15%"></td>
					<td>姓&nbsp;&nbsp;&nbsp;名：</td><td id="name11"></td>
					<td style="width: 15%"></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>