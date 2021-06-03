<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

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
							<h2 class="card-title text-center">修改教师信息</h2>
							<form class="mt-2" action="/admin/editTeacher" id="editfrom" method="post">
								<div class="mb-3 form-floating">
									<input readonly="readonly" type="number" class="form-control" id="inputEmail3" name="userid" placeholder="请输入工号"
										   value="${teacher.userid}">
									<label for="inputEmail3" class="form-label">工号</label>
								</div>
								<div class="mb-3 form-floating">
									<input type="text" class="form-control" id="inputPassword3" name="username" placeholder="请输入姓名"
										   value="${teacher.username}">
									<label for="inputPassword3" class="form-label">姓名</label>
								</div>
								<div class="mb-3">
									<label class="form-check-label form-check-inline">
										<input class="form-check-input" type="radio" name="sex" value="男" checked>
										男
									</label>
									<label class="form-check-label form-check-inline">
										<input class="form-check-input" type="radio" name="sex" value="女">
										女
									</label>
								</div>
								<div class="mb-3">
									<label for="Da1" class="form-label">出生日期</label>
									<input type="date" class="form-control" id="Da1"
                                           value="<fmt:formatDate value="${teacher.birthyear}" dateStyle="medium" pattern="yyyy-MM-dd" />" name="birthyear">
								</div>
								<div class="mb-3 form-floating">
									<select class="form-select" name="degree" id="degree">
										<option value="本科">本科</option>
										<option value="硕士">硕士</option>
										<option value="博士">博士</option>
									</select>
									<label for="degree" class="form-label">学历</label>
								</div>
								<div class="mb-3 form-floating">
									<select class="form-select" name="title" id="title">
										<option value="普通教师">普通教师</option>
										<option value="助教">助教</option>
										<option value="讲师">讲师</option>
										<option value="副教授">副教授</option>
										<option value="教授">教授</option>
									</select>
									<label for="title" class="form-label">职称</label>
								</div>
								<div class="mb-3">
									<label for="Da2" class="form-label">入职时间</label>
									<input type="date" class="form-control" id="Da2"
										   value="<fmt:formatDate value="${teacher.grade}" dateStyle="medium" pattern="yyyy-MM-dd" />" name="grade">
								</div>
								<div class="mb-3 form-floating">
									<select class="form-select" id="floatingSelect" name="collegeid">
										<c:forEach items="${collegeList}" var="item">
											<option value="${item.collegeid}">${item.collegename}</option>
										</c:forEach>
									</select>
									<label for="floatingSelect">所属院系</label>
								</div>
								<div class="mb-3 text-center">
									<button class="btn btn-primary" type="submit">提交</button>
									<button class="btn btn-secondary" type="reset">重置</button>
									<button class="btn btn-success" onclick="history.back(-1)" type="reset">返回</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
	</div>
	<div class="container" id="footer">
	<div class="row">
		<div class="col-md-12"></div>
	</div>
	</div>
</body>
<!-- 引入JQuery  bootstrap.js-->
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$("#nav li:nth-child(3)").addClass("active");

        var collegeSelect = $("#college option");
        for (var i=0; i<collegeSelect.length; i++) {
            if (collegeSelect[i].value == '${teacher.collegeid}') {
                collegeSelect[i].selected = true;
            }
        }

        var degreeSelect = $("#degree option");
        var titleSelect = $("#title option");

        for (var i=0; i<degreeSelect.length; i++) {
            if (degreeSelect[i].value == '${teacher.degree}') {
                degreeSelect[i].selected = true;
            }
        }
        for (var i=0; i<titleSelect.length; i++) {
            if (titleSelect[i].value == '${teacher.title}') {
                titleSelect[i].selected = true;
            }
        }

	</script>
</html>
