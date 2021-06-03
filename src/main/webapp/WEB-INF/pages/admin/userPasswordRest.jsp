<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
</head>
<body>
	<!-- 顶栏 -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- 中间主体 -->
	<div class="container" id="content">
		<div class="row">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="col-md-10">
				<div class="card">
					<div class="card-body">
						<h2 class="card-title text-center">重置其他用户密码</h2>
						<form class="mt-2" action="/admin/userPasswordRest" id="editfrom" method="post" onsubmit="return check()">
							<div class="mb-3 form-floating">
								<input type="text" class="form-control" id="userid" name="username" placeholder="请输入用户名">
								<label for="userid" class="form-label">其他用户账号</label>
							</div>
							<div class="mb-3 form-floating">
								<input type="password" class="form-control" id="inputPassword3" name="password" placeholder="请输入密码">
								<label for="inputPassword3" class="form-label">密码</label>
							</div>
							<div class="mb-3 form-floating">
								<input type="password" class="form-control" id="Da1" name="password2" placeholder="请确认密码">
								<label for="Da1" class="form-label">确认密码</label>
							</div>
							<div class="mb-3 text-center">
								<button class="btn btn-primary" type="submit">提交</button>
								<button class="btn btn-secondary" type="reset">重置</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- 引入JQuery  bootstrap.js-->
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script>
    $("#nav li:nth-child(4)").addClass("active")

    function check() {
        if(reset.username.value==""||reset.username.value==null)
        {alert("请输入账户名称");return false;}
        if(reset.password.value==""||reset.password.value==null)
        {alert("请输入重置密码");return false;}
        if(reset.password2.value==""||reset.password2.value==null)
        {alert("请输入再次输入密码");return false;}
        if(reset.password.value != reset.password2.value)
        {alert("两次密码不正确");return false;}
    }
</script>
</html>
