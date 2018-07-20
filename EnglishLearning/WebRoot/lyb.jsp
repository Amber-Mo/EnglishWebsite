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
  </head>
		<script language="javascript">
			function checklyb()
			{
				if(document.formlyb.cheng.value=="")
				{
					alert("请输入昵称");
					document.formlyb.cheng.focus();
					return false;
				}
				if(document.formlyb.neirong.value=="")
				{
					alert("请输入留言内容");
					document.formlyb.neirong.focus();
					return false;
				}
				if(document.formlyb.youxiang.value!="")
				{
					var strEmail = document.getElementById("youxiang").value;		
					var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
					var email_Flag = reg.test(strEmail);
					if(email_Flag){
					
					}
					else{
						alert("对不起，您输入的邮箱地址格式错误。");
						return false;
					}
				}
				if(document.formlyb.QQ.value!="")
				{
					var strQQ = document.getElementById("QQ").value;		
					var regQQ = /^[1-9]\d{4,8}$/;
					var qq_Flag =  regQQ.test(strQQ);
					if(qq_Flag){
					
					}else{
						alert("对不起，您输入的QQ号码格式错误。");
						return false;
					}
				}
				if(document.formlyb.dianhua.value!="")
				{
					var strPhone = document.getElementById("dianhua").value; 
					var reg = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
					phone_Flag = reg.test(strPhone);
					if(phone_Flag){
					}else{
					alert("对不起，您输入的电话号码格式错误。");
					return false;
					}
				}
			}
		</script>
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
                        <td width="17%" height="20" align="center" valign="bottom"><span class="title">留言板</span></td>
                        <td width="69%" class="STYLE4">&nbsp;</td>
                        <td width="14%" valign="bottom" class="STYLE4"><a href="lyblist.jsp" class="title">查看已有留言</a></td>
                      </tr>
                    </table></td></tr>
                  <tr>
                    <td width="100%" height="669" valign="top" background="qtimages/5.gif"><form name="formlyb" method="post" action="liuyanban_add_post.jsp">
                          <table width="92%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#AAE4D5" style="border-collapse:collapse">
                            <tr>
                              <td width="12%" align="center">昵称</td>
                              <td width="88%"><input name='cheng' type='text' id='cheng' value='' />
                              *</td>
                            </tr>
                            <tr>
                              <td align="center">头像</td>
                              <td><input name="xingbie" type="radio" value="1" checked>
                                  <img src="img/1.gif" width="64" height="71">
                                  <input type="radio" name="xingbie" value="2">
                                  <img src="img/2.gif" width="64" height="71">
                                  <input type="radio" name="xingbie" value="3">
                                  <img src="img/3.gif" width="64" height="71">
                                  <input type="radio" name="xingbie" value="4">
                                  <img src="img/4.gif" width="64" height="71">
                                  <input type="radio" name="xingbie" value="5">
                                  <img src="img/5.gif" width="64" height="71"></td>
                            </tr>
                            <tr>
                              <td align="center">QQ</td>
                              <td><input name='QQ' type='text' id='QQ' value='' /></td>
                            </tr>
                            <tr>
                              <td align="center">邮箱</td>
                              <td><input name='youxiang' type='text' id='youxiang' value='' /></td>
                            </tr>
                            <tr>
                              <td align="center">电话</td>
                              <td><input name='dianhua' type='text' id='dianhua' value='' /></td>
                            </tr>
                            <tr>
                              <td align="center">内容</td>
                              <td><textarea name="neirong" cols="50" rows="10" id="neirong"></textarea>
                              *</td>
                            </tr>
                            <tr align="center">
                              <td colspan="2"><input type="submit" name="Submit42" value="提交" onClick="return checklyb();" style=" height:19px; border:solid 1px #000000; color:#666666" />&nbsp;&nbsp;
                                  <input type="reset" name="Submit22" value="重置" style=" height:19px; border:solid 1px #000000; color:#666666" /></td>
                            </tr>
                          </table></form></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/4.gif" width="785" height="10" alt=""></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
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