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
    <title>��������</title>
    <link href="css/CSS.css" type="text/css" rel="stylesheet">
    <script language="javascript" src="js/Calendar.js"></script>
		<script type="text/javascript" src="js/popup.js"></script>
	  <script type="text/javascript">
	    function up(tt){
	    	var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
        pop.setContent("contentUrl","upload.jsp?Result="+tt);
        pop.setContent("title","�ļ��ϴ�");
        pop.build();
        pop.show();
	    }
		</script>
  </head>
		<script language="javascript">
			function check(){
				if(document.form1.bianhao.value==""){alert("��������");document.form1.bianhao.focus();return false;}if(document.form1.mingcheng.value==""){alert("����������");document.form1.mingcheng.focus();return false;}
			}
		</script>
<body >
	<%
  	String id=request.getParameter("id");
  %>
  <form name="form1" id="form1" method="post" action="ziliaoxiazai_updt_post.jsp?id=<%=id %>">
     �޸���������<br><br>
  <%
	  String sql="select * from ziliaoxiazai where id="+id;
	  String bianhao="";String mingcheng="";String leibie="";String kecheng="";String jianjie="";String fujian="";
	  ResultSet RS_result=connDbBean.executeQuery(sql);
	  while(RS_result.next()){
	  bianhao=RS_result.getString("bianhao");mingcheng=RS_result.getString("mingcheng");leibie=RS_result.getString("leibie");kecheng=RS_result.getString("kecheng");jianjie=RS_result.getString("jianjie");fujian=RS_result.getString("fujian");
	  }
  %>
	   <table width="60%" border="1" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
	     <tr><td align="center">���</td><td><input name='bianhao' type='text' id='bianhao' value='<%= bianhao%>' /></td></tr>
	     <tr><td align="center">����</td><td><input name='mingcheng' type='text' id='mingcheng' size='50' value='<%=mingcheng%>' /></td></tr>
	     <tr><td align="center">���</td><td><select name='leibie' id='leibie'>
	       <option value="��ѧ�μ�">��ѧ�μ�</option>
	       <option value="�������">�������</option>
	       <option value="֪ͨ����">֪ͨ����</option>
	       <option value="��־����">��־����</option>
	     </select></td></tr><script language="javascript">document.form1.leibie.value='<%=leibie%>';</script>
	     <tr><td align="center">�γ�</td><td><select name='kecheng' id='kecheng'>
	       <% sql="select kechengmingcheng from kechengxinxi order by id desc"; RS_result=connDbBean.executeQuery(sql);while(RS_result.next()){%>
	       <option value="<%= RS_result.getString("kechengmingcheng")%>" ><%=RS_result.getString("kechengmingcheng")%></option>
	       <%}%>
	     </select>
	     </td></tr><script language="javascript">document.form1.kecheng.value='<%=kecheng%>';</script>
	     <tr><td align="center">���</td><td><textarea rows="1" cols="60" name="jianjie" onscroll="this.rows++;" id='jianjie'><%=jianjie%></textarea></td></tr>
	     <tr><td align="center">����</td><td><input name='fujian' type='text' id='fujian' size='50' value='<%= fujian%>' />&nbsp;<input type='button' value='�ϴ�' onClick="up('fujian')"/></td></tr>
	    <tr align="center">
	      <td colspan="2"><input type="submit" name="Submit" value="�ύ" onClick="return check();" />&nbsp;&nbsp;
	      <input type="reset" name="Submit2" value="����" /></td>
	    </tr>
	  </table>
	</form>
</body>
</html>


