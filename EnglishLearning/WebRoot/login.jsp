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
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>用户登录</title>
		<style type="text/css">
			.STYLE5 {
				color: black;
				font-size: 26pt;
			}
			.STYLE7 {color: #FFFFFF;}
			.STYLE9 {color: #FFFFFF; font-size: 12px; }
			.inputtext {
				border-left:1px solid balck;
				border-right:1px solid balck;
				border-top:1px solid balck;
				border-bottom:1px solid balck;
			}
		</style>
</head>
		<script language="javascript">
			function check(){
				if(document.form1.username.value=="" || document.form1.pwd.value==""){
					alert('请输入完整');
					return false;
				}
			}
		</script>
<body>
<form name=form1 action="adminyanzheng.jsp" method="POST">
  <table cellspacing=0 cellpadding=0 width=900 align=center border=0>
    <tbody>
      <tr>
        <td valign="middle" background="images/login_1.gif" style="height: 105px"><br>
            <table width="100%" height="51" border="0" align="left">
              <tr>
                <td><div style="font-family:宋体; color:#ffffff; filter:Glow(Color=#000000,Strength=2); width: 100%; font-weight: bold; font-size: 19pt; margin-top:5pt">
                    <div align="center" class="STYLE5">大学英语自主学习网</div>
                </div></td>
              </tr>
          </table></td>
      </tr>
      <tr>
        <td background=images/login_2.jpg height=300><table height=300 cellpadding=0 width=900 border=0>
            <tbody>
              <tr>
                <td colspan=2 height=35></td>
              </tr>
              <tr>
                <td width=360></td>
                <td><table cellspacing=0 cellpadding=2 border=0>
                    <tbody>
                      <tr>
                        <td style="HEIGHT: 28px" width=80><span class="STYLE9">用户名：</span></td>
                        <td style="HEIGHT: 28px" width=150>
                        <input name="username" type="text" class="inputtext" id="username" size="15"></td>
                        <td style="HEIGHT: 28px" width=370><span class="STYLE7"></span></td>
                      </tr>
                      <tr>
                        <td style="height: 28px"><span class="STYLE9">密&nbsp;&nbsp; 码：</span></TD>
                        <td style="height: 28px"><input name="pwd" type="password" class="inputtext" id="pwd" size="15"></td>
                        <td style="height: 28px"><span class="STYLE7"></span></td>
                      </tr>
                      <tr style="display:none">
                        <td style="height: 28px"><span class="STYLE9">权限：</span></td>
                        <td style="height: 28px"><select name="cx" id="cx" class="inputtext">
                          <option value="管理员">管理员</option>
                          <option value="教师">教师</option>
                          <option value="学生">学生</option>
                        </select></td>
                        <td style="height: 28px"><span class="STYLE7"></span></TD>
                      </tr>
                      <tr>
                        <td style="height: 18px"><span class="STYLE7"></span></td>
                        <td style="height: 18px"><span class="STYLE7"></span></td>
                        <td style="height: 18px"><span class="STYLE7"></span></td>
                      </tr>
                      <tr>
                        <td><span class="STYLE7"></span></td>
                        <td><input name=btn type=image id=btn style="border-top-width: 0px; border-left-width: 0px; border-bottom-width: 0px; border-right-width: 0px" 
                  					onclick="return check();" src="images/login_button.gif">
                        </td>
                      </tr>
                    </tbody>
                </table></td>
              </tr>
            </tbody>
        </table></td>
      </tr>
      <tr>
        <td><img src="images/login_3.jpg" border=0></td>
      </tr>
    </tbody>
  </table>
</form>
</body>
</html>

