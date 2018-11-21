<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName

()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
  <head>
   
     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">     
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.1.1.js"></script>
   <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function() {
             $.ajax({
				type:'post',
				url:"categoryJsonAction_getcategorys.action",
				dataType:"json",
				success: function(data){
					var data2 = eval(data);
					for(var i in data2){
					 $("#category").append("<li><a href='findByCategory.action?cid="+data2[i].id+"' target='main'>"+data2[i].categoryName+"</a></li>");
						}
					}
				})
        });
    function setIframeHeight(iframe) {
			if (iframe) {
				var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
			if (iframeWin.document.body) {
			iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
	}
	}
	};

		window.onload = function () {
		setIframeHeight(document.getElementById('external-frame'));
	};
    </script>

    
  </head>
  
  <body>
  <nav class="navbar navbar-default">
	<div class="container">
    	<div class="navbar-header">
        	<a href="Untitled-3.html" class="navbar-brand">知天下</a>
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-

collapse">
            	<span class="icon-bar"></span>            	
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="navbar-collapse collapse">
         	<ul class="nav navbar-nav">
            	<li>
                	<a href="index.jsp">首页</a>
                </li>
                <li class="dropdown">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">分类管理
                    	<span class="caret"></span>
                    </a>
                 	<ul class="dropdown-menu">
                    	<li><a href="add_page" target="main">添加分类</a></li>
                        <li><a href="listCategory" target="main">管理分类</a></li>
                    </ul>
                </li>
            	<li class="dropdown">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">新闻管理
                    	<span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" id="category">
                    	<li><a href="listNew" target="main">全部新闻</a></li>
                    	<li><a href="addNp" target="main">添加新闻</a></li>
                    	<li class=" divider"></li>
                    </ul>
                </li>
                
            </ul>
            <ul class="nav navbar-nav navbar-right">
   				<% if(session.getAttribute("username")!=null){%>
                <li>
                <a href="#"><%=session.getAttribute("username")%></a>
                </li>
                <li><a href="exit">退出</a></li>
                <%}else{%>
                <li>
                	<a href="login.jsp">登录</a>
  				</li>
                <li>
   					<a href="regist.jsp">注册</a>
                <li>
                <%}%>
              </ul>
        </div>
    </div>
</nav>

<div>
	<div class="container">
		<iframe src="listNew" width="1000px" height="100%" name="main" frameborder="0" scrolling="no" id="external-frame" onload="setIframeHeight(this)"></iframe>
	</div>
</div>
</body>
</html>

   	

