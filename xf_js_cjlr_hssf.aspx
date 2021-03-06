<%@ Page Language="vb" AutoEventWireup="false" Codebehind="xf_js_cjlr_hssf.aspx.vb" Inherits="zjdx.xf_js_cjlr_hssf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="gb2312">
<head>
<title>现代教学管理信息系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="Content-Language" content="gb2312" />
<meta content="all" name="robots" />
<meta name="author" content="sunleoo@gmail.com" />
<meta name="Copyright" content="正方软件 zfsoft" />
<meta name="description" content="教务软件 学分制 教学管理" />
<meta content="教务软件 学分制 教学管理" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" rev="stylesheet" href="style/main.css" type="text/css" media="all" />
		<SCRIPT language="javascript">
		    function button5_click(){
		        if (confirm("成绩为空的不能提交到正式成绩库，提交以后下次登陆将不能再修改该成绩\n如果只需要保存成绩，请点击保存按钮。\n单击“确定”提交成绩。单击“取消”停止提交。")==true)
		            __doPostBack('Button5','')
		    }	  
		    
		    function Input_focus(e){
		        if (e.tagName == "INPUT")
		            e.parentElement.parentElement.bgColor = "#DCDCDC"
		        else
		            e.parentElement.parentElement.parentElement.bgColor ="#DCDCDC"
		    }
		    
		    function Input_blur(e){
		        if (e.tagName == "INPUT")
		            e.parentElement.parentElement.bgColor = ""
		        else
		            e.parentElement.parentElement.parentElement.bgColor =""
		    }		    
		     
		    function win_unload(){
		        if (document.all.txtChanged.value == "1" && document.all.Button1.disabled == ""){
		            if (confirm("您输入的成绩尚未保存，你确定不保存就退出吗？\n单击“确定”关闭页面。单击“取消”提交未保存的成绩。") == false){
		                __doPostBack('Button1','');
		                return;
		            }
		        }
		        
		        alert("成绩输入完成，谢谢！");
		        window.close();
		    }
		</SCRIPT>
	</HEAD>
	<BODY>
		<FORM id="Form1" onkeydown="if(event.keyCode==13)event.keyCode=9" method="post" runat="server">
	<iframe src="head.htm" frameborder="0" scrolling="no" width="100%" height="59"></iframe> 
<div id="main"> 
    <div id="title"> 
      <div id="title_l"></div> 
      <div id="title_m">教师成绩录入</div> 
      <div id="title_r"></div> 
    </div> 
    <div id="content"> 		
<font color="red">注：成绩录到一半时，请勿切换记分制，否则将导致未保存数据丢失。</font>
				<asp:label id="lbl_message" runat="server" Visible="False">lbl_message</asp:label>
				<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
					<TR>
						<TD style="HEIGHT: 13px">教师姓名：
							<ASP:LABEL id="jsxm" runat="server"></ASP:LABEL></TD>
						<TD style="HEIGHT: 13px">课程名称：
							<ASP:LABEL id="kcmc" runat="server"></ASP:LABEL></TD>
						<ASP:TEXTBOX id="txtChanged" style="DISPLAY: none" Text="0" Runat="server"></ASP:TEXTBOX></TR>
					<TR>
						<TD style="HEIGHT: 20px" align="right" colSpan="2">记分制：
							<ASP:DROPDOWNLIST id="jfz" runat="server" AutoPostBack="True">
								<asp:ListItem Value="百分制">百分制</asp:ListItem>
								<asp:ListItem Value="五级制">五级制</asp:ListItem>
								<asp:ListItem Value="二级制">二级制</asp:ListItem>
								<asp:ListItem Value="十一级制">十一级制</asp:ListItem>
							</ASP:DROPDOWNLIST></TD>
					</TR>
					<tr>
						<td height="10"><asp:label id="Label1" runat="server" Visible="False">Label</asp:label>&nbsp;
							<asp:dropdownlist id="ddlBJMC" runat="server" Visible="False" AutoPostBack="True"></asp:dropdownlist>
							<asp:label id="lbl_xb" runat="server" Visible="False">lbl_xb</asp:label>
							<asp:DropDownList id="ddl_xb" runat="server" AutoPostBack="True">
								<asp:ListItem></asp:ListItem>
								<asp:ListItem Value="男">男</asp:ListItem>
								<asp:ListItem Value="女">女</asp:ListItem>
							</asp:DropDownList></td>
					</tr>
				</TABLE>
				<ASP:DATAGRID id="DataGrid1" runat="server" CssClass="SortTable" AutoGenerateColumns="False" Width="936px">
					<HeaderStyle BackColor="#6699FF"></HeaderStyle>
					<Columns>
						<asp:BoundColumn DataField="bjmc" HeaderText="班级名称"></asp:BoundColumn>
						<asp:BoundColumn DataField="xh" HeaderText="学号"></asp:BoundColumn>
						<asp:BoundColumn DataField="xm" HeaderText="姓名">
							<ItemStyle Wrap="False"></ItemStyle>
						</asp:BoundColumn>
						<asp:TemplateColumn HeaderText="平时成绩">
							<ItemTemplate>
								<asp:textBox class=InputBox id=ps onblur=Input_blur(this) onfocus=Input_focus(this) runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.pscj") %>' Width="68">
								</asp:textBox>
								<ASP:DROPDOWNLIST id="dps" runat="server"></ASP:DROPDOWNLIST>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="期中成绩">
							<ItemTemplate>
								<asp:textBox runat="server" ID="qz" Width="68" Text='<%# DataBinder.Eval(Container, "DataItem.qzcj") %>' onfocus="Input_focus(this)" onblur="Input_blur(this)" Class="InputBox"/>
								<ASP:DROPDOWNLIST id="dqz" runat="server"></ASP:DROPDOWNLIST>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="期末成绩">
							<ItemTemplate>
								<asp:textBox class=InputBox id=qm onblur=Input_blur(this) onfocus=Input_focus(this) runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.qmcj") %>' Width="68">
								</asp:textBox>
								<ASP:DROPDOWNLIST id="Dqm" runat="server"></ASP:DROPDOWNLIST>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="实验成绩">
							<ItemTemplate>
								<asp:textBox runat="server" ID="sy" Width="68" Text='<%# DataBinder.Eval(Container, "DataItem.sycj") %>' onfocus="Input_focus(this)" onblur="Input_blur(this)" Class="InputBox"/>
								</asp:textBox>
								<ASP:DROPDOWNLIST id="Dsy" runat="server"></ASP:DROPDOWNLIST>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="总评成绩">
							<ItemTemplate>
								<asp:textbox class=InputBox id=zp onblur=Input_blur(this) onfocus=Input_focus(this) runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.zpcj1") %>' Width="68px">
								</asp:textbox>
								<ASP:DROPDOWNLIST id="Dzp" runat="server"></ASP:DROPDOWNLIST>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="备注">
							<ItemTemplate>
								<ASP:TEXTBOX id=BZ runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BZ") %>'>
								</ASP:TEXTBOX>
								<ASP:DROPDOWNLIST id="dbz" runat="server"></ASP:DROPDOWNLIST>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:BoundColumn DataField="cxbj" HeaderText="重修标记"></asp:BoundColumn>
						<asp:BoundColumn Visible="False" DataField="nfxg" HeaderText="能否修改"></asp:BoundColumn>
					</Columns>
				</ASP:DATAGRID>
				<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
					<TR>
						<TD width="30%" height="34"><asp:panel id="plCJBL" runat="server">平时 
<ASP:TEXTBOX id="psb" runat="server" Width="28px">20</ASP:TEXTBOX>% 
<asp:label id="Label_qz" runat="server">期中</asp:label>
<ASP:TEXTBOX id="qzb" runat="server" Width="28px">0</ASP:TEXTBOX>
<asp:label id="Label_qzb" runat="server">%</asp:label>期末 
<ASP:TEXTBOX id="qmb" runat="server" Width="28px">80</ASP:TEXTBOX>%实验 
<ASP:TEXTBOX id="syb" runat="server" Width="28px">0</ASP:TEXTBOX>%</asp:panel>
						</TD>
						<TD align="center" width="25%">总评转换成
							<ASP:DROPDOWNLIST id="Dropdownlist1" runat="server" AutoPostBack="True">
								<ASP:LISTITEM Value="百分制">百分制</ASP:LISTITEM>
								<ASP:LISTITEM Value="五级制">五级制</ASP:LISTITEM>
								<ASP:LISTITEM Value="二级制">二级制</ASP:LISTITEM>
								<ASP:LISTITEM Value="十一级制">十一级制</ASP:LISTITEM>
							</ASP:DROPDOWNLIST><ASP:BUTTON id="Button1" runat="server" Text="保  存" CssClass="button"></asp:button>&nbsp;&nbsp;</TD>
						<TD align="center" width="10%"><ASP:BUTTON id="btn_hdd" runat="server" Visible="False" Text="输出成绩核对单" Width="100px" Height="23px" CssClass="button"></asp:button>&nbsp;</TD>
						<TD align="center" width="10%"><ASP:BUTTON id="Button3" runat="server" Text="输出打印" CssClass="button"></asp:button>&nbsp;&nbsp;</TD>
						<TD align="center" width="10%"><INPUT id="Button5" onclick="return button5_click();" type="button" value="  提交  " name="Button5"
								runat="server"></TD>
						<TD align="center" width="12%"><ASP:BUTTON id="Button4" runat="server" Text="清空总评" CssClass="button"></asp:button>&nbsp;&nbsp;</TD>
						<TD width="13%">&nbsp;
							<ASP:BUTTON id="Button2" runat="server" Text="关  闭" CssClass="button"></asp:button></TD>
					</TR>
				</TABLE>
</div>
</div>
<div id="bottom">
<iframe src="bottom.htm" frameborder="0" scrolling="no" width="100%" height="28"></iframe>
</div>		</FORM>
	</BODY>
</HTML>
