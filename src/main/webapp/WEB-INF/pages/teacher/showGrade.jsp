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
						<h2 class="card-title text-center">此课程学生名单</h2>

						<table class="table text-center mt-3">
							<thead>
							<tr>
								<th scope="col">学号</th>
								<th scope="col">姓名</th>
								<th scope="col">分数</th>
								<th scope="col">操作</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach  items="${selectedCourseList}" var="item">
								<tr>
									<th scope="row">${item.studentCustom.userid}</th>
									<td>${item.studentCustom.username}</td>
									<c:if test="${!item.over}">
										<td>未打分</td>
										<td>
											<button class="btn btn-primary" onClick="location.href='/teacher/mark?studentid=${item.studentid}&courseid=${item.courseid}'">打分</button>
										</td>
									</c:if>
									<c:if test="${item.over}">
										<td>${item.mark}</td>
										<td>已打分</td>
									</c:if>
								</tr>
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
