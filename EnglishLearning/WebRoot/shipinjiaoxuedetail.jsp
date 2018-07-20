<%@ page language="java"  pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
		{
			out.print("<script>alert('对不起，请先登录!');location.href='index.jsp';</script>");
		}
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>大学英语自主学习网</title>
    <link href="css/style.css" type=text/css rel=stylesheet>
  </head>
  <%
	  String id=request.getParameter("id");
	
	  String sql="select * from shipinjiaoxue where id="+id;
	  String bianhao="";String jiaocaimingcheng="";String kecheng="";String zhujiangren="";String shipinwenjian="";String beizhu="";
	  ResultSet RS_result=connDbBean.executeQuery(sql);
	  while(RS_result.next()){
	  bianhao=RS_result.getString("bianhao");
	  jiaocaimingcheng=RS_result.getString("jiaocaimingcheng");
	  kecheng=RS_result.getString("kecheng");
	  zhujiangren=RS_result.getString("zhujiangren");
	  shipinwenjian=RS_result.getString("shipinwenjian");
	  beizhu=RS_result.getString("beizhu");
	  }
  %>
<body >
	<table width="988" height="1007" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
		<tr>
			<td><%@ include file="qttop.jsp"%></td>
		</tr>
		<tr>
			<td><table id="__01" width="988" height="666" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><table id="__01" width="785" height="666" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td valign="top"><table id="__01" width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="100%" height="33" background="qtimages/1.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="17%" height="20" align="center" valign="bottom"><span class="title">视频教学</span></td>
                        <td width="76%" class="STYLE4">&nbsp;</td>
                        <td width="7%" valign="bottom" class="STYLE4"></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td width="100%" height="669" valign="top" background="qtimages/5.gif"><p align="center">

                    </p>
                      <table width="96%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#AAE4D5" style="border-collapse:collapse">
                        <tr align="center" height="39"><td>编号</td><td><%=bianhao%></td></tr> 
                        <tr align="center" height="39"><td>教材名称</td><td><%=jiaocaimingcheng %></td></tr> 
                        <tr align="center" height="39"><td>课程</td><td><%=kecheng%></td></tr> 
                        <tr align="center" height="39"><td>主讲人</td><td><%=zhujiangren%></td></tr>
                        <tr align="center" height="39"><td>视频文件</td><td><a href='<%=shipinwenjian %>' target='_blank'>下载</a></td></tr>
							 					<tr align="center" height="39"><td>备注</td><td><%=beizhu %></td></tr>
                        <tr align="center" height="39">
                          <td colspan="2"><input type="button" name="Submit5" value="返回" onClick="javascript:history.back();" style=" height:19px; border:solid 1px #000000; color:#666666"></td>
                        </tr>                        
			<%
				String lurl="",houzhui="";
				lurl=shipinwenjian;
				houzhui=lurl.substring(lurl.length()-4,lurl.length());
				
				if (houzhui== ".swf")
				{
		%>  
    <p align=center>
    	<object CLASSID=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 CODEBASE=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0 width=541 height=374>
           <param name=movie value=<%=lurl%>> <param name=quality value=high> <EMBED SRC=<%=lurl%> QUALITY=high PLUGINSPAGE=http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash type=application/x-shockwave-flash width=541 height=374></embed>
      </object>
		<% 
			}
			if (houzhui== ".mpg")
			{
		%>
    <p align=center>
    <object align=middle classid=CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95 class=OBJECT id=MediaPlayer width=500 height=350 >
     <param name=ShowStatusBar value=-1>
     <param name=Filename value=<%=lurl%>>
     <embed type=application/x-oleobject codebase=http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701 flename=mp src=<%=lurl%>   width=500 height=100></embed>
    </object>
		<% 
			}
			if ( houzhui.equals(".mid") || houzhui.equals(".wma") || houzhui.equals(".wmv")  )
			{
		%>
    <p align=center>
         <object align=middle classid=CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95 class=OBJECT id=MediaPlayer width=500 >
           <param name=ShowStatusBar value=-1>
     <param name=Filename value=<%=lurl%>>
     <embed type=application/x-oleobject codebase=http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701 flename=mp src=<%=lurl%>   width=500></embed>
    </object>
		<%
			}
			if (houzhui.equals(".mp3")  )
			{
		%>
    <p align=center>
         <object align=middle classid=CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95 class=OBJECT id=MediaPlayer width=500 height="90" >
           <param name=ShowStatusBar value=-1>
     <param name=Filename value=<%=lurl%>>
     <embed type=application/x-oleobject codebase=http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701 flename=mp src=<%=lurl%>   width=500 height="90"></embed>
    </object>
		<%
			}
		%>
     </td></tr></table>
			<p align="center">&nbsp;</p>
			<p align=center></td></tr>
     <tr>
       <td><img src="qtimages/4.gif" width="785" height="10" alt=""></td>
     </tr></table></td></tr></table></td>
       <td valign="top"><%@ include file="qtleft.jsp"%></td></tr>
     </table></td>
		</tr>
		<tr>
			<td width="988" height="130" background="qtimages/1_03.gif"><%@ include file="qtdown.jsp"%></td>
		</tr>
	</table>
</body>
</html>