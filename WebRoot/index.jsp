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
					 $("#category").append("<li><a href='getByCategory.action?cid="+data2[i].id+"' target='main'>"+data2[i].categoryName+"</a></li>");
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
        	<a href="index.jsp" class="navbar-brand">知天下</a>
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
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">分类
                    	<span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" id="category">
                 		
                    </ul>
                </li>
            
            </ul>
            
            <form action="getByKW.action" method="post" class="navbar-form navbar-left" target="main">
            	<div class="input-group">
                	<input type="text" name="keyword" class="form-control">
                    <div class="input-group-btn">
                    	<button type="submit" class="btn btn-primary">搜索</button>
                    </div>
                </div>
            </form>
            
            <ul class="nav navbar-nav navbar-right">
   				<% if(session.getAttribute("username")!=null){%>
                	<%if(session.getAttribute("username").equals("admin")){%>
                		<li><a href="list.jsp">转到后台</a></li>
                		<li>
                		<a><%=session.getAttribute("username")%></a>
                		</li>
                		<li><a href="exit">退出</a></li>
                		<%}else{ %>
                		<li>
                		<a><%=session.getAttribute("username")%></a>
                		</li>
                		<li><a href="exit">退出</a></li>
                		<%} %>  
                 <!-- 显示登录 -->
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
		<iframe src="listNews" width="1000px" name="main" frameborder="0" scrolling="no" id="external-frame" onload="setIframeHeight(this)"></iframe>
	</div>
</div>
<footer class="panel-footer navbar-fixed-bottom">
<div class="container">
	<div class="navbar-collapse collapse" style="text-align:center">
		<ul class="nav navbar-nav">
    		<li><a href="#">常见问题</a></li>
        	<li class="nav-divider"></li>
        	<li><a href="#">联系我们</a></li>
    	</ul>
    </div>
</div>
</footer>

</body>
</html>
