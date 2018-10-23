<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>北京城市学院资产管理系统</title>
</head>

<!-- LYH  666 -->
	
<style type="text/css">
	body{
		/*background-color: color="#4b88be"*/
		
	    background: -moz-linear-gradient(#9ee2f9, white); /* Firefox 3.6 - 15 */
	    background: linear-gradient(#9ee2f9, white) no-repeat; /* 标准的语法 */
		
	}
	
	
	#page{
		width: 800px;
		margin-left: auto;
		margin-right: auto;
		
	}
	
	#main{
		width: 800px;
		height: 500px;
	/*	border: 1px solid #006CFF;*/
		margin-top: 150px;
		border-radius: 20px;
		background-image: url(image/login.png);
		background-size: cover;
		margin-bottom: 150px;
	}
	
	#head{
		font-family: Arial;
	}
	
	
	#head{
		margin-left: 250px;
		padding-top: 20px;
		font-family: Cambria, "Hoefler Text", "Liberation Serif", Times, "Times New Roman", "serif";
		font-size: 25px;
	}
	
	#login{
	/*	border: 1px solid #00AAF1;*/
		width: 250px;
	/*	background-color: #0EECFF;*/
	/*	border-radius: 10px;*/
		margin-top: 110px;
		margin-left: 70px;
	}
	
	#title{
		padding-left: 110px;
		padding-top: 10px;
		padding-bottom: 5px;
		font-size: 15px;
	}
	
	table{

	}

	td{

	}

	#button{
		margin-left: 45px;
		margin-top: 15px;
	}
	
</style>
	
	
<script src="script/jquery-3.3.1.js"></script>
	
<body>
	<div id="page">
				<div id="main">
					<div id="head"> 北京城市学院资产管理系统 </div>
						
							<div id="login">
								<div id="title">用户登录</div>
								<form action="" id="loginform">
									  <table cellspacing="10px" >
										<tr>
										<td align="right">ID:</td>
											<td> <input type="text" name="userid" id="userid"> </td>
										</tr>
										<tr>
											<td align="right">口令:</td>
											<td> <input type="text" name="password" id="password"></td>
										</tr>

									</table>
								</form>
									<div id="button">  
										
										<button type="button" class="btn btn-default btn-xs">登录</button> &nbsp;
								
										<button type="button" class="btn btn-default btn-xs">注册</button> &nbsp;
										
										<button type="button" class="btn btn-default btn-xs">找回密码</button> &nbsp;
								
								</div>
								
							</div>
				</div>
	</div>
	
	
</body>
	
	
	
</html>
