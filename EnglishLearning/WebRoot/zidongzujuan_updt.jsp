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
    <title>自动组卷</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
		<script type="text/javascript" src="js/popup.js"></script>
	  <script type="text/javascript">
	    function up(tt){
	    	var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
        pop.setContent("contentUrl","upload.jsp?Result="+tt);
        pop.setContent("title","文件上传");
        pop.build();
        pop.show();
	    }
		</script>
  </head>
		<script language="javascript">
			function check(){
				if(document.form1.bianhao.value==""){alert("请输入编号");document.form1.bianhao.focus();return false;}if(document.form1.tishu.value==""){alert("请输入题数");document.form1.tishu.focus();return false;}if(document.form1.fenzhi.value==""){alert("请输入分值");document.form1.fenzhi.focus();return false;}
			}
		</script>
<body >
	<%
   String id=request.getParameter("id");
  %>
  <form name="form1" id="form1" method="post" action="zidongzujuan_updt_post.jsp?id=<%=id %>">
  修改自动组卷
  <br><br>
  <%
	  String sql="select * from zidongzujuan where id="+id;
	  String bianhao="";String zhuanye="";String tishu="";String fenzhi="";String timu="";
	  ResultSet RS_result=connDbBean.executeQuery(sql);
	  while(RS_result.next()){
	  timu=RS_result.getString("timu");  bianhao=RS_result.getString("bianhao");zhuanye=RS_result.getString("zhuanye");tishu=RS_result.getString("tishu");fenzhi=RS_result.getString("fenzhi");
	  }
   %>
	   <table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
	     <tr><td width="10%" align="center">编号</td><td><input name='bianhao' type='text' id='bianhao' value='<%= bianhao%>' /></td></tr><tr style="display:none"><td>专业：</td><td><select name='zhuanye' id='zhuanye'><%sql="select zhuanye from zhuanyexinxi order by id desc";RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%><option value="<%= RS_result.getString("zhuanye")%>" ><%=RS_result.getString("zhuanye")%></option><%}%></select></td></tr><script language="javascript">document.form1.zhuanye.value='<%=zhuanye%>';</script><tr style="display:none"><td>题数：</td><td><input name='tishu' type='text' id='tishu' value='<%= tishu%>' /></td></tr><tr style="display:none"><td>分值：</td><td><input name='fenzhi' type='text' id='fenzhi' value='<%= fenzhi%>' /></td></tr>
	     <tr>
	       <td width="10%" align="center">题目</td>
	       <td><input name='timu' type='text' id='timu' value='<%= timu%>' size="60" />(ID间用半角逗号隔开)</td>
	     </tr>
	     <tr align="center">
	      <td colspan="2"><input type="submit" name="Submit" value="提交" onclick="return check();" />&nbsp;&nbsp;
	      <input type="reset" name="Submit2" value="重置" /></td>
	    </tr>
	  </table>
	</form>
</body>
</html>


