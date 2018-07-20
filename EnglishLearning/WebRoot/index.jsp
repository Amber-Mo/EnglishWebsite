<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>大学英语自主学习网</title>
    <link href="css/style.css" type="text/css" rel="stylesheet">
<style type="text/css">
<!--
.STYLE1 {color: #00cccc;}
body {
	background-color: #e9f8f5;
}
.STYLE2 {color: #6d2e18;}
.STYLE2 {color: #6d2e18; font-weight: bold; }
-->
</style>
  </head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
  <table width="988" height="1007" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td><%@ include file="qttop.jsp"%></td>
	</tr>
	<tr>
		<td><table id="__01" width="988" height="666" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><table id="__01" width="785" height="666" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td><table id="__01" width="785" height="307" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="284" height="307" background="qtimages/1_02_01_01_01.gif" align="center">
    <script type="text/javascript">
			var focus_width=254;
			var focus_height=234;
			var text_height=20;
			var swf_height = focus_height+text_height;
			var pics="";
			var links="";
			var texts="";
		<%
			String sqlbht;
			sqlbht="select top 5 id,biaoti,shouyetupian from xinwentongzhi where shouyetupian<>'' and shouyetupian<>'null' order by id desc";
			ResultSet RS_resultbht=connDbBean.executeQuery(sqlbht);
			String idbht="";
			String biaotibht="";
			String shouyetupianbht="";
			 while(RS_resultbht.next()){
		 shouyetupianbht=shouyetupianbht+RS_resultbht.getString("shouyetupian")+"|";
		 idbht=idbht+"gg_detail.jsp?id="+RS_resultbht.getString("id")+"|";
		 biaotibht=biaotibht+RS_resultbht.getString("biaoti")+"|";
		 }
		 shouyetupianbht=shouyetupianbht.substring(0,shouyetupianbht.length()-1);
		 idbht=idbht.substring(0,idbht.length()-1);
		 biaotibht=biaotibht.substring(0,biaotibht.length()-1);
		%>
		pics="<%=shouyetupianbht%>";
		links="<%=idbht%>";
		texts="<%=biaotibht%>";
		document.write('<embed src="qtimages/pixviewer.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#ffffff" quality="Best" width="'+ focus_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">');
	</script></td>
	  <td><table id="__01" width="501" height="307" border="0" cellpadding="0" cellspacing="0">
	    <tr>
	      <td width="501" height="33" background="qtimages/1_02_01_01_02_01.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
	        <tr>
	          <td width="28%" height="20" align="center" valign="bottom"><span class="title">新闻通知</span></td>
	          <td width="57%" class="STYLE4">&nbsp;</td>
	          <td width="15%" valign="bottom" class="STYLE4"><a href="news.jsp?lb=新闻通知">更多&gt;&gt;</a></td>
	        </tr>
	      </table></td>
	    </tr>
	    <tr>
	      <td width="501" height="264" valign="top" background="qtimages/1_02_01_01_02_02.jpg">
	      <table class="newsline" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
	        <tbody>
	         <%
					 String sql="";
					 sql="select top 10 id,biaoti,addtime from xinwentongzhi where leibie='新闻通知' order by id desc";
					 String id="";
					 String biaoti="";
					 String addtime="";
					 int i=0;
					 ResultSet RS_result=connDbBean.executeQuery(sql);
					 while(RS_result.next()){
					     i=i+1;
					     id=RS_result.getString("id");
							 biaoti=RS_result.getString("biaoti");
							 if(biaoti.length() >=32){
							     biaoti=biaoti.substring(0,32);
							 }
							 addtime=RS_result.getString("addtime");
					%>
	             <tr>
	               <td width="4%" align="center" ><img height="7" 
	                 src="qtimages/index_r9_c9.jpg" 
	                 width="7" /></td>
	               <td width="80%"><a href="gg_detail.jsp?id=<%=id%>"><%=biaoti%></a> </td>
	               <td width="16%"><%out.print(addtime.substring(0,10));%>
	               </td>
	             </tr>
	            <%
	              }
	            %>
	             </tbody></table></td></tr>
	              <tr>
	                <td><img src="qtimages/1_02_01_01_02_03.jpg" width="501" height="10" alt=""></td>
	              </tr></table></td>
	              </tr></table></td></tr>
	            <tr>
	              <td><table id="__01" width="100%" border="0" cellpadding="0" cellspacing="0">
	                <tr>
	                  <td width="100%" height="33" background="qtimages/1.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
	                    <tr>
	                      <td width="17%" height="20" align="center" valign="bottom"><span class="title">教师风彩</span></td>
	                      <td width="76%" class="STYLE4">&nbsp;</td>
	                      <td width="7%" valign="bottom" class="STYLE4"><a href="jiaoshixinxilist.jsp">更多&gt;&gt;</a></td>
	                    </tr>
	                  </table></td>
	                </tr>
	                <tr>
	                  <td width="100%" height="118" valign="top" background="qtimages/3.gif"><table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	                    <tr>
			<%
			  sql="select top 4 id,zhaopian,xingming from jiaoshixinxi where zhaopian<>'' order by id desc";
				RS_result=connDbBean.executeQuery(sql);
				String xingming="";
				String touxiang="";
				while(RS_result.next()){
				    id=RS_result.getString("id");
				    xingming=RS_result.getString("xingming");
				    touxiang=RS_result.getString("zhaopian");
			%>
	        <td height="157" align="center"><table width="23%" border="0" cellspacing="0" cellpadding="0">
	            <tr>
	              <td height="150" align="center">
	              <a href="jiaoshixinxidetail.jsp?id=<%=id%>"><img src="<%=touxiang%>" width="135" height="141" border="0"></a></td>
	            </tr>
	            <tr>
	              <td height="22" align="center"><%=xingming%></td>
	            </tr>
	        </table></td>
	      <%
			  }
			 %>
	        </tr></table></td></tr>
	         <tr>
	           <td><img src="qtimages/4.gif" width="785" height="10" alt=""></td>
	         </tr>
	         </table></td></tr>
	         <tr>
	           <td><table id="__01" width="100%" border="0" cellpadding="0" cellspacing="0">
	             <tr>
	               <td width="100%" height="33" background="qtimages/1.gif"><table width="100%" border="0" cellpadding="0" cellspacing="0">
	                   <tr>
	                     <td width="17%" height="20" align="center" valign="bottom"><span class="title">系统简介</span></td>
	                     <td width="76%" class="STYLE4">&nbsp;</td>
	                     <td width="7%" valign="bottom" class="STYLE4"><a href="jiaoshixinxilist.jsp"></a></td>
	                   </tr>
	               </table></td>
	             </tr>
	             <tr>
	               <td width="100%" height="118" valign="top" background="qtimages/3.gif"><table width="98%" border="0" align="center">
	                 <tr>
	                   <td>
	           <%
						 String sqlxtggx="select * from dx where leibie='系统简介'";
						 ResultSet RS_resultxtggx=connDbBean.executeQuery(sqlxtggx);
						 while(RS_resultxtggx.next()){
						     out.print(RS_resultxtggx.getString("content"));
						 }
					 %>
					</td></tr></table></td></tr>
	          <tr>
	            <td><img src="qtimages/4.gif" width="785" height="10" alt=""></td>
	          </tr>
	          </table></td></tr></table></td>
	       <td valign="top"><%@ include file="qtleft.jsp"%></td>
	     </tr>
     </table></td>
		</tr>
		<tr>
			<td width="988" height="130" background="qtimages/1_03.gif"><%@ include file="qtdown.jsp"%></td>
		</tr>
	</table>
</body>
</html>