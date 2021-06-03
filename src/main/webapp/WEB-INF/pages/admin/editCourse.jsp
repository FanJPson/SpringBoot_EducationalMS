<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
				<div class="card mt-5">
					<div class="card-body">
						<h2 class="card-title text-center">修改课程信息</h2>
						<form class="mt-2" action="/admin/editCourse" id="editfrom" method="post">
							<div class="mb-3 form-floating">
								<input readonly="readonly" type="number" class="form-control" id="inputEmail3" value="${course.courseid}" name="courseid" placeholder="请输入课程号">
								<label for="inputEmail3" class="form-label">课程号</label>
							</div>
							<div class="mb-3 form-floating">
								<input type="text" class="form-control" id="inputPassword3" name="coursename" placeholder="请输入课程名称"
									   value="${course.coursename}">
								<label for="inputPassword3" class="form-label">课程名称</label>
							</div>
							<div class="mb-3 form-floating">
								<select class="form-select" name="teacherid" id="teacherid">
									<c:forEach items="${teacherList}" var="item">
										<option value="${item.userid}">${item.username}</option>
									</c:forEach>
								</select>
								<label for="teacherid" class="form-label">授课老师工号</label>
							</div>
							<div class="mb-3 form-floating">
								<input type="text" class="form-control" id="time1" placeholder="请输入上课时间"
									   value="${course.coursetime}" name="coursetime">
								<label for="time1" class="form-label">上课时间</label>
							</div>
							<div class="mb-3 form-floating">
								<input type="text" class="form-control" id="dd2" placeholder="上课地点"
									   value="${course.classroom}" name="classroom">
								<label for="dd2" class="form-label">上课地点</label>
							</div>
							<div class="mb-3 form-floating">
								<input type="number" class="form-control" id="time2" placeholder="请输入周数"
									   value="${course.courseweek}" name="courseweek">
								<label for="time2" class="form-label">周数</label>
							</div>
							<div class="mb-3 form-floating">
								<select class="form-select" id="kc3" name="coursetype">
									<option value="必修课">必修课</option>
									<option value="选修课">选修课</option>
									<option value="公共课">公共课</option>
								</select>
								<label for="kc3">课程类型</label>
							</div>
							<div class="mb-3 form-floating">
								<select class="form-select" id="floatingSelect" name="collegeid">
									<c:forEach items="${collegeList}" var="item">
										<option value="${item.collegeid}">${item.collegename}</option>
									</c:forEach>
								</select>
								<label for="floatingSelect">所属院系</label>
							</div>
							<div class="mb-3 form-floating">
								<input type="number" class="form-control" id="score" placeholder="请输入学分"
									   value="${course.score}" name="score">
								<label for="score" class="form-label">学分</label>
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
</body>
<!-- 引入JQuery  bootstrap.js-->
<script src="/js/jquery-3.6.0.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$("#nav li:nth-child(1)").addClass("active")

        var collegeSelect = $("#college option");
        for (var i=0; i<collegeSelect.length; i++) {
            if (collegeSelect[i].value == '${course.collegeid}') {
                collegeSelect[i].selected = true;
            }
        }

        var degreeSelect = $("#coursetype option");
        for (var i=0; i<coursetypeSelect.length; i++) {
            if (coursetypeSelect[i].value == '${course.coursetype}') {
                coursetypeSelect[i].selected = true;
            }
        }

        var teacheridSelect = $("#teacherid option");
        for (var i=0; i<teacheridSelect.length; i++) {
            if (teacheridSelect[i].value == '${course.teacherid}') {
                teacheridSelect[i].selected = true;
            }
        }

	</script>
</html>
