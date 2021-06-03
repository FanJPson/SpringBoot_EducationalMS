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
				<div class="card mb-5">
					<div class="card-body">
						<h2 class="card-title text-center">打分</h2>
						<form class="mt-2" action="/teacher/mark" id="editfrom" method="post" onsubmit="return check()">
							<input  readonly="readonly" type="hidden" class="form-control" name="courseid" value="${selectedCourse.courseid}">
							<div class="mb-3 form-floating">
								<input type="text" readonly="readonly" class="form-control" id="inputPassword3" name="studentid" value="${selectedCourse.studentid}">
								<label for="inputPassword3" class="form-label">学号</label>
							</div>
							<div class="mb-3 form-floating">
								<input type="text" readonly="readonly" class="form-control" id="name1" name="name" value="${selectedCourse.studentCustom.username}">
								<label for="name1" class="form-label">姓名</label>
							</div>
							<div class="mb-3 form-floating">
								<input type="number" class="form-control" id="mark1" name="mark" placeholder="请输入成绩">
								<label for="mark1" class="form-label">成绩</label>
							</div>
							<div class="mb-3 text-center">
								<button class="btn btn-primary" id="addSubmit" type="submit">提交</button>
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
    $("#nav li:nth-child(1)").addClass("active")
    function check() {
        if(reset.mark.value==""||reset.mark.value==null)
        {alert("请输入成绩");return false;}
    }
</script>
</html>
