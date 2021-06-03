<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
	<style type="text/css">
	body{
	   background: url(./images/background.png) no-repeat;
		background-size: 100% 100%;
		height: 100vh;
	}
	#login-box {
		/*border:1px solid #F00;*/
		/* padding: 35px; */
		border-radius:20px;
		background: #ffffff;
		font-size: 1.2rem;
	}

	</style>
</head>
<body>
	<div class="container" id="top">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4 p-3 shadow-lg" id="login-box" style="margin-top: 150px; ">
				<form role="form" action="/login" id="from1" method="post">
				  <div class="mb-3 mt-1 text-center">
					<h2>登录</h2>
				  </div>
				  <div class="mb-3">
				    <label for="userID" class="col-sm-3 form-label">账户:</label>
					  <input type="text" class="form-control" id="userID" placeholder="请输入账户" name="username" style="font-size: 1.2rem;">
				  </div>
				  <div class="mb-2">
				    <label for="password" class="col-sm-3 form-label">密码</label>
					  <input type="password" class="form-control" id="password" placeholder="请输入密码" name="password" style="font-size: 1.2rem;">
				  </div>

				  <div class="mb-3">
				    <div class="text-end">
				      <div class="label" style="font-size: 14px;color: red">
						  ${message}
				      </div>
				    </div>
				  </div>
				  <div class="mb-4">
					  <button type="submit" class="btn btn-light btn-outline-primary btn-lg" style="width: 100%;">登录</button>
				  </div>
				</form>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
</body>

<!-- 引入JQuery  bootstrap.js-->
<script src="./js/jquery-3.6.0.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script>
	// 给文本框获取焦点
	$("#userID").focus();

</script>

</html>
