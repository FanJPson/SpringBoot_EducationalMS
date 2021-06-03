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
						<h2 class="card-title text-center">课程管理</h2>
						<form style="display: inline" action="/admin/selectCourse" id="form1" method="post" class="mt-2">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="输入姓名查找" name="findByName" id="findByName" value="${sessionScope.findCourseByName}">
								<button class="btn btn-outline-primary" id="sub">查找</button>
							</div>
						</form>
						<button type="button" class="btn btn-primary mt-2" onClick="location.href='/admin/addCourse'">添加</button>

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
								<th scope="col">操作</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach  items="${selectCourseInfo.list}" var="item">
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
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-warning" onClick="location.href='/admin/editCourse?id=${item.courseid}'">修改</button>
											<button type="button" class="btn btn-danger" onClick="deleteConfirmd(${item.courseid})">删除</button>
										</div>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>

						<nav class="mt-3">
							<ul class="pagination justify-content-center">
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/admin/selectCourse?page=${selectCourseInfo.pageNum-1}&pageSize=${selectCourseInfo.pageSize}">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<c:forEach begin="1" end="${selectCourseInfo.pages}" var="i">
									<c:if test="${i==selectCourseInfo.pageNum}">
										<li class="page-item active">
											<a class="page-link" href="${pageContext.request.contextPath}/admin/selectCourse?page=${i}&pageSize=${selectCourseInfo.pageSize}">${i}</a>
										</li>
									</c:if>
									<c:if test="${i!=selectCourseInfo.pageNum}">
										<li class="page-item">
											<a class="page-link" href="${pageContext.request.contextPath}/admin/selectCourse?page=${i}&pageSize=${selectCourseInfo.pageSize}">${i}</a>
										</li>
									</c:if>
								</c:forEach>
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/admin/selectCourse?page=${selectCourseInfo.pageNum+1}&pageSize=${selectCourseInfo.pageSize}">
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

        $("#nav li:nth-child(1)").addClass("active");

		<%--设置菜单中--%>
		<%--$("#nav li:nth-child(1)").addClass("active")--%>
        <%--<c:if test="${pagingVO != null}">--%>
        <%--if (${pagingVO.curentPageNo} == ${pagingVO.totalCount}) {--%>
            <%--$(".pagination li:last-child").addClass("disabled")--%>
        <%--};--%>

        <%--if (${pagingVO.curentPageNo} == ${1}) {--%>
            <%--$(".pagination li:nth-child(1)").addClass("disabled")--%>
        <%--};--%>
        <%--</c:if>--%>

        function deleteConfirmd(courseid) {
            var msg = "您真的确定要删除吗？！";
            if (confirm(msg)==true){
                location.href='/admin/removeCourse?id='+courseid;
                return true;
            }else{
                return false;
            }
        };

        //改变每页显示条数
        function changPageSize(){
            var pageSize=$("#changPageSize").val();
            location.href="${pageContext.request.contextPath}/admin/selectCourse?page=1&pageSize="+pageSize;
        }

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
                url:"/admin/searchCourseName",
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
