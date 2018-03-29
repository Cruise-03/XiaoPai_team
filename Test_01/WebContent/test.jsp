<%@ page language="java" contentType="text/html; charset=utf-8"  import="java.util.*" pageEncoding="utf-8"%>
<%@page import="project.TitleDAO,project.Title"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>车辆识别</title>
<%

    String path = request.getRequestURI();

    String basePath = request.getScheme() + "://"

            + request.getServerName() + ":" + request.getServerPort()

            + path;

%>

<base
href="<%=basePath%>">
<style type="text/css">
	div 
	{
		position:absolute;
		top:19%;
		right:10%;
		
		background-color:#b4bebf;
		filter:alpha(Opacity=80);
		opacity: 0.6;
		width:350px;
		height:360px;
		overflow: scroll;
	}
	video{
	position:relative;
	left:10%;
	}
	h1{
	text-align:center;
	font-weight:normal;
	
	}
	form{
	position:relative;
	left:10%;
	}
	body{
	background-image:url(background1.jpg);
	}
	#input1{
	
    background-color: #555555; /* Green */
    border: none;
    color: white;
    padding: 6px 8px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    margin: 4px 2px;
    cursor: pointer;

	}
	#button1{
	
    background-color: #555555; /* Green */
    border: none;
    color: white;
    padding: 6px 8px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    margin: 4px 2px;
    cursor: pointer;

	}
	#button2{
	position:relative;
	left:16%;
	bottom:37px;
    background-color: #555555; /* Green */
    border: none;
    color: white;
    padding: 6px 8px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    margin: 4px 2px;
    cursor: pointer;

	}
	#button3{
    background-color: #005AB5; /* Green */
    border: none;
    color: white;
    padding: 6px 8px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    margin: 4px 2px;
    cursor: pointer;

	}
	#button4{
    background-color: #005AB5; /* Green */
    border: none;
    color: white;
    padding: 6px 8px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    margin: 4px 2px;
    cursor: pointer;
 	
	}
	.hidden{
	display: none;
	}
	#tb{
	display: none;
	border: 1px;
	}
</style>
<script type="text/javascript">

    function play(){
    	document.getElementById("video").src="${address}";
    	document.getElementById("media").load();
    }
    function redirect(){
 
    	var hi=document.getElementById("tb");
    	hi.style.display="inline-table";
    	
    }
   
</script>

</head>
<body >
	
	<h1 style="color:#5B5B5B;">
	<strong>
	停车场入口汽车识别系统
	</strong>
	</h1>
	<% boolean flag=false; %>
	<video id="media" controls style="border:1px solid black;" height="400px" width="560px" title="video element"> 
		<source id="video" src="" type="video/mp4">
	</video>
	<br/>
	<form action="${pageContext.request.contextPath}/servlet/UploadHandleServlet" enctype="multipart/form-data" method="post">
  		
 	 	上传文件1：<input type="file" name="file1"><br/>
  		
  		<input id="input1" type="submit" value="提交">
  		
  		
 	</form>
 	<form action="${pageContext.request.contextPath}/servlet/sendAddressServlet">
 	 	<button id="button1">获取视频</button>
 	</form>
 	<button id="button2" onclick="play()" >播放视频</button>
	<div>
	<button id="button3" onclick="redirect()" >获取车牌</button>
	
	 <button id="button4" onclick="window.location.href='http://10.6.12.93:8080/Test/photo.html'">车牌图片</button>
	 <table border="1" id="tb">
      <tr>
          <td width="2%">id</td>
          <td width="4%">车牌号</td>
          <td width="4%">日期</td>
      </tr>
        <%
           TitleDAO dao=new TitleDAO();          
           List<Title> list =dao.readFirstTitle();
           for(Title tl:list)
           {%>
          <tr >
              <td width="2%" ><%=tl.getId() %></td>
              <td width="4%"><%=tl.getPlate_number() %></td>
              <td width="4%"><%=tl.getDate() %></td>
          </tr>
            <%}
       %>
  	</table>
  	
	</div>
	
	
</body>
</html>