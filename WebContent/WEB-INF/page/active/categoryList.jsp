<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>后台管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
      <link rel="stylesheet" href="/themes/active/css/app.v2.css" type="text/css" />
      <link rel="stylesheet" type="text/css" href="/themes/active/css/fileinput.css">
</head>
<body>
<section class="vbox">
	<header class="bg-dark dk header navbar navbar-fixed-top-xs">
     <div class="navbar-header aside-md"> <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen" data-target="#nav"> <i class="fa fa-bars"></i> </a> <a  class="navbar-brand" ><!--  <img src="images/logo.png" class="m-r-sm">-->数据管理系统</a><!--  <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".nav-user"> <i class="fa fa-cog"></i> </a>  --></div>
    <ul class="nav navbar-nav hidden-xs">
     
    </ul>
   <ul class="nav navbar-nav navbar-right hidden-xs nav-user">
      <li class="dropdown"> <a  class="dropdown-toggle" href="/active/login.html" > 当前用户：${ sessionScope.userName }，点击退出 </a>
        <ul class="dropdown-menu animated fadeInRight">
          <span class="arrow top"></span>
          <li> <a  data-toggle="ajaxModal" href="/active/login.html" >退出</a> </li>
        </ul>
      </li>
    </ul>
  </header>
  <section>
    <section class="hbox stretch"> 
      <aside class="bg-dark lter aside-md hidden-print" id="nav">
        <section class="vbox">
          <section class="w-f scrollable">
            <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="5px" data-color="#333333">
              <nav class="nav-primary hidden-xs">
                <ul class="nav">
                  <li class="active"><a href="index.html" class="active"><i class="fa fa-cog icon"><b class="bg-warning"></b></i><span class="pull-right"><i class="fa fa-angle-down text"></i><i class="fa fa-angle-up text-active"></i></span><span>基础设置</span></a>
                    <ul class="nav lt">
                      <li><a href="active/categoryController/list.do?type=1"><i class="fa fa-angle-right"></i><span>一级分类</span></a></li>
                      <li><a href="active/categoryController/list.do?type=2"><i class="fa fa-angle-right"></i><span>二级分类</span></a></li>
                      <li><a href="/active/addressController/list.do"><i class="fa fa-angle-right"></i><span>地址管理</span></a></li>
                    </ul>
                  </li>
                  <li ><a href="#"><i class="fa fa-user icon"><b class="bg-success"></b></i><span class="pull-right"><i class="fa fa-angle-down text"></i><i class="fa fa-angle-up text-active"></i></span><span>用户相关</span></a>
                    <ul class="nav lt">
                      <li><a href="/active/activeUserController/list.do"><i class="fa fa-angle-right"></i><span>用户信息</span></a></li>
                    </ul>
                  </li>
                  <li  ><a href="#pages"><i class="fa fa-file-text icon"><b class="bg-primary"></b></i><span class="pull-right"><i class="fa fa-angle-down text"></i> <i class="fa fa-angle-up text-active"></i> </span><span>活动相关</span> </a>
                    <ul class="nav lt">
                      <li><a href="active/activeController/list.do"><i class="fa fa-angle-right"></i><span>活动相关</span></a></li>
                      <li><a href="active/bannerController/list.do"><i class="fa fa-angle-right"></i><span>头图管理</span></a></li>
                       <li><a href="active/photoController/list.do"><i class="fa fa-angle-right"></i><span>相册管理</span></a></li>
                    </ul>
                  </li>
                  <li><a href=""><i class="fa fa-envelope-o icon"><b class="bg-primary dker"></b> </i> <span class="pull-right"><i class="fa fa-angle-down text"></i> <i class="fa fa-angle-up text-active"></i> </span><span>反馈描述</span></a> 
                    <ul class="nav lt">
                      <li><a href="active/feedbackController/list.do"><i class="fa fa-angle-right"></i><span>反馈相关</span></a></li>
                    </ul>
                  </li>
                </ul>
              </nav>
            </div>              
          </section>
        </section>
      </aside>
      <section id="content">
        <section class="panel panel-1 panel-default">
        <input id="type" type="hidden" value="${type}">
           <header class="panel-heading">分类管理</header>
           <div class="row text-sm wrapper">
              <div>
                <a href="#modal-add" data-toggle="modal" class="btn btn-s-md btn-danger btn-rounded" style="float: right;" id="btn_add_category">添加</a>
              </div>
          </div>
          <div class="table-responsive">
            <table class="table table-striped b-t b-light text-sm">
              <thead>
                <tr>
                  <th>父级名称</th>
                  <th>分类名称</th>
                  <th>类别图片</th>
                  <th>分类类型</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
               
              </tbody>
            </table>
          </div>
             <footer class="panel-footer">
                <div class="row">
                  <div class="col-sm-4 hidden-xs">
                  </div>
                  <div class="col-sm-4 text-center"> <small id="page_currentNums" class="text-muted inline m-t-sm m-b-sm " ></small> </div>
                  <div class="col-sm-4 text-right text-center-xs">
                    <ul  id="page_totalPages" class="pagination pagination-sm m-t-none m-b-none ">
                    </ul>
                  </div>
                </div>
          </footer>
        </section>
      </section>
    </section>
  </section>
</section>
<script src="/themes/active/js/app.v2.js"></script>

<div class="modal fade" id="modal-add">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">添加</h4>
      </div>
      <div class="modal-body">
        <section class="panel panel-default m-l-n-md m-r-n-md m-b-none">
          <div class="panel-body">
            <form role="form">
           	<input type="hidden" id="category_id"/>
              <div class="form-group">
                  <label>级别</label>
                  <select class="form-control m-b" id="category_level">
                  <option value="0">一级分类</option>
                  <option value="1">二级分类</option>
                  </select>
              </div>
              <div class="form-group" id="div_category_father" style="display: none;">
                  <label>父级分类</label>
                  <select class="form-control m-b" id="category_father">
                  </select>
              </div>
              <div class="form-group">
                  <label>分类名称</label>
                  <input type="text" class="form-control" placeholder="分类名称" id="category_name">
              </div>
               <div class="form-group">
                  <label>分类图片</label>
                  <input type="hidden" id="category_img"/>
              <form enctype="multipart/form-data">
                  <input id="file" name="file" class="file" type="file" multiple data-min-file-count="1" >
              </form>
              </div>
               <div class="form-group">
                  <label>分类类别</label>
                  <input type="text" class="form-control" placeholder="分类类别" id="category_type">
              </div>
              <button type="submit" class="btn btn-s-md btn-success" style="display:block;margin: 20px auto 0" id="btn_submit_category" data-dismiss="modal">添加</button>
            </form> 
          </div>
        </section>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-success" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
<script src="/themes/active/js/file-input/fileinput.min.js"></script>
<script src="/themes/active/js/commonPage.js"></script>
<script src="/themes/active/js/categoryList.js"></script>
<script type="text/javascript">
		  $("#file").fileinput({
			  language: 'zh',
			  uploadUrl: 'active/categoryController/uploadFile.do',
		      'allowedFileExtensions' : ['jpg', 'png','gif'],
		  });
		  $('#file').on('fileuploaded', function(event, data, previewId, index) {
		      var response = data.response;
		      if(response.success){
		    	  $("#category_img").val(response.obj);
		      }
		  });
		  </script>
</body>
</html>