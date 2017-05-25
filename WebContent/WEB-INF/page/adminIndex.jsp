<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>后台</title>
    <script src="/themes/dist/js/jquery.js" ></script>
    <script src="/themes/dist/js/bootstrap.min.js" ></script>
    <script src="/themes/dist/js/vue.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="/themes/dist/css/bootstrap-theme.min.css" >
    <link rel="stylesheet" type="text/css" href="/themes/dist/css/bootstrap.min.css" >
    <script>
       var ress = {};
       ress.data = new Array();
        $(function(){
            $.ajax({
                url:'/getAllUserList.html',
                type:'GET',
                dataType:'JSON',
                success:function(res){
                	if(res!=null&&res.data!=null){
                		for(var i = 0;i<res.data.length;i++){
                			if(res.data[i].pic1!=null&&'null'!=res.data[i].pic1){
                				res.data[i].pic1 = '/themes/data/'+res.data[i].pic1;
                				ress.data.push(res.data[i]);
                			}
                		}
                	}
                    new Vue({
                        el: 'body',
                        data:{items:ress.data}
                    })
                }
            })
       /*      var res = {},data1 = {},data2 = {};
            res.data = new Array();
            data1.pic1 = '',data2.pic = '',
            data1.realName = 'Jinx',data2.realName = 'Pythone',
            data1.sex = '男',data2.realName = '女',
            data1.age = '26',data2.age = '22',
            data1.num = '1001',data2.num = '1002',
            data1.edu = '高中',data2.edu = '大学';
            res.data.push(data1);
            res.data.push(data2);
            new Vue({
                el: 'body',
                data:{items:res.data}
            }) */
        })
    </script>
    <style>
        .info-table{
            margin-top: 10px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">巾帼园</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="javascript:location.reload();">用户列表</a></li>
                <li><a href="/adminSecond.html">匹配列表</a></li>
            </ul>
        </div>
    </div>
</nav>
<table class="table table-striped info-table">
    <thead>
        <tr>
            <th>编号</th>
            <th>图片</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>学历</th>
        </tr>
    </thead>
    <tbody>
        <tr v-for="model in items" >
            <td v-text="model.num" ></td>
            <td>
                <img v-bind:src="model.pic1" height="38px" >
            </td>
            <td v-text="model.realName" ></td>
            <td v-text="model.sex" ></td>
            <td v-text="model.age" ></td>
            <td v-text="model.edu" ></td>
        </tr>
    </tbody>
</table>
</body>
</html>