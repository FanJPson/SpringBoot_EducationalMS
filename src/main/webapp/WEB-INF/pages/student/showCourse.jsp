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
				<div class="card mb-5">
					<div class="card-body">
						<h2 class="card-title text-center">课程管理</h2>
						<form style="display: inline" action="/student/searchCourse?page=1&pageSize=4" id="form1" method="post" class="mt-2">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="输入课程名查找" name="findByName" id="findByName">
								<button class="btn btn-outline-primary">查找</button>
							</div>
						</form>
						<table class="table text-center mt-3">
							<thead>
							<tr>
								<th scope="col">课程编号</th>
								<th scope="col">课程名称</th>
								<th scope="col">授课老师编号</th>
								<th scope="col">上课时间</th>
								<th scope="col">上课地点</th>
								<th scope="col">周数</th>
								<th scope="col">课程类型</th>
								<th scope="col">学分</th>
								<th scope="col">操作</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach  items="${CoursePageInfo.list}" var="item">
								<tr>
									<th scope="row">${item.courseid}</th>
									<td>${item.coursename}</td>
									<td>${item.teacherid}</td>
									<td>${item.coursetime}</td>
									<td>${item.classroom}</td>
									<td>${item.courseweek}</td>
									<td>${item.coursetype}</td>
									<td>${item.score}</td>
									<td>
										<button type="button" class="btn btn-warning" onclick="selectConfirmd(${item.courseid})">选课</button>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>

						<nav class="mt-3">
							<ul class="pagination justify-content-center">
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/student/showCourse?page=${CoursePageInfo.pageNum-1}&pageSize=${CoursePageInfo.pageSize}">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<c:forEach begin="1" end="${CoursePageInfo.pages}" var="i">
									<c:if test="${i==CoursePageInfo.pageNum}">
										<li class="page-item active">
											<a class="page-link" href="${pageContext.request.contextPath}/student/showCourse?page=${i}&pageSize=${CoursePageInfo.pageSize}">${i}</a>
										</li>
									</c:if>
									<c:if test="${i!=CoursePageInfo.pageNum}">
										<li class="page-item">
											<a class="page-link" href="${pageContext.request.contextPath}/student/showCourse?page=${i}&pageSize=${CoursePageInfo.pageSize}">${i}</a>
										</li>
									</c:if>
								</c:forEach>
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/student/showCourse?page=${CoursePageInfo.pageNum+1}&pageSize=${CoursePageInfo.pageSize}">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</ul>
						</nav>
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

		<%--设置菜单--%>
		$("#nav li:nth-child(1)").addClass("active")

        //改变每页显示条数
        function changPageSize(){
            var pageSize=$("#changPageSize").val();
            location.href="${pageContext.request.contextPath}/student/showCourse?page=1&pageSize="+pageSize;
        }

        // 选课确认
        function selectConfirmd(courseid) {
            var msg = "您确定要选修该门课程吗？！";
            if (confirm(msg)==true){
                location.href='/student/stuSelectedCourse?id='+courseid;
                return true;
            }else{
                return false;
            }
        };


        function sleep(numberMillis) {
            var now = new Date();
            var exitTime = now.getTime() + numberMillis;
            while (true) {
                now = new Date();
                if (now.getTime() > exitTime)
                    return;
            }
        }


        $("#sub").click(function () {
            findByName();
        });

        //按键盘的回车键也执行搜索
        $("#findByName").keydown(function () {
            if(event.keyCode==13) {
                findByName();
            }
        });


        // 发送ajax请求，将要查询的名字存入到session中
        function findByName() {
            var username = $("#findByName").val();
            // alert(username)
            var allData={
                username:username
            };

            $.ajax({
                url:"/student/searchCourseName",
                contentType:"application/json;charset=UTF-8",
                data:JSON.stringify(allData),//'{"username":username}',
                dataType:"json",
                type:"post"
            });

            sleep(500)

            $("#form1").submit();
        }
	</script>
</html>
