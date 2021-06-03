<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>课程信息显示</title>

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
						<h2 class="card-title text-center">已修课程</h2>
						<table class="table text-center mt-3">
							<thead>
							<tr>
								<th scope="col">课程号</th>
								<th scope="col">课程名称</th>
								<th scope="col">授课老师工号</th>
								<th scope="col">上课时间</th>
								<th scope="col">上课地点</th>
								<th scope="col">周数</th>
								<th scope="col">课程类型</th>
								<th scope="col">学分</th>
								<th scope="col">成绩</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach  items="${selectedCourseList}" var="item">
								<%--输出已修完的课程--%>
								<c:if test="${item.over}">
								<tr>
									<th scope="row">${item.couseCustom.courseid}</th>
									<td>${item.couseCustom.coursename}</td>
									<td>${item.couseCustom.teacherid}</td>
									<td>${item.couseCustom.coursetime}</td>
									<td>${item.couseCustom.classroom}</td>
									<td>${item.couseCustom.courseweek}</td>
									<td>${item.couseCustom.coursetype}</td>
									<td>${item.couseCustom.score}</td>
									<td class="text-danger">${item.mark}</td>
								</tr>
								</c:if>
							</c:forEach>
							</tbody>
						</table>
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
        function confirmd() {
            var msg = "您真的确定要删除吗？！";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
        }

        $("#sub").click(function () {
            $("#form1").submit();
        });
	</script>
</html>
