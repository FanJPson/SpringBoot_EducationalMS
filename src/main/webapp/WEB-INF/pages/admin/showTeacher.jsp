<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>教师信息显示</title>
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
						<h2 class="card-title text-center">教师管理</h2>
						<form style="display: inline" action="/admin/selectTeacher?page=1&pageSize=4" id="form1" method="post" class="mt-2">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="输入姓名查找" name="findByName" id="findByName">
								<button class="btn btn-outline-primary">查找</button>
							</div>
						</form>
						<button type="button" class="btn btn-primary mt-2" onClick="location.href='/admin/addTeacher'">添加</button>

						<table class="table text-center mt-3">
							<thead>
							<tr>
								<th scope="col">教师编号</th>
								<th scope="col">姓名</th>
								<th scope="col">性别</th>
								<th scope="col">出生年份</th>
								<th scope="col">学历</th>
								<th scope="col">职称</th>
								<th scope="col">入职时间</th>
								<th scope="col">学院</th>
								<th scope="col">操作</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach  items="${teacherPageInfo.list}" var="item">
								<tr>
									<th scope="row">${item.userid}</th>
									<td>${item.username}</td>
									<td>${item.sex}</td>
									<td><fmt:formatDate value="${item.birthyear}" dateStyle="medium" /></td>
									<td>${item.degree}</td>
									<td>${item.title}</td>
									<td><fmt:formatDate value="${item.grade}" dateStyle="medium" /></td>
									<td>${item.collegeName}</td>
									<td>
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-warning" onClick="location.href='/admin/editTeacher?id=${item.userid}'">修改</button>
											<button type="button" class="btn btn-danger" onClick="deleteConfirmd(${item.userid})">删除</button>
										</div>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>

						<nav class="mt-3">
							<ul class="pagination justify-content-center">
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/admin/showTeacher?page=${teacherPageInfo.pageNum-1}&pageSize=${teacherPageInfo.pageSize}">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<c:forEach begin="1" end="${teacherPageInfo.pages}" var="i">
									<c:if test="${i==teacherPageInfo.pageNum}">
										<li class="page-item active">
											<a class="page-link" href="${pageContext.request.contextPath}/admin/showTeacher?page=${i}&pageSize=${teacherPageInfo.pageSize}">${i}</a>
										</li>
									</c:if>
									<c:if test="${i!=teacherPageInfo.pageNum}">
										<li class="page-item">
											<a class="page-link" href="${pageContext.request.contextPath}/admin/showTeacher?page=${i}&pageSize=${teacherPageInfo.pageSize}">${i}</a>
										</li>
									</c:if>
								</c:forEach>
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/admin/showTeacher?page=${teacherPageInfo.pageNum+1}&pageSize=${teacherPageInfo.pageSize}">
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
		$("#nav li:nth-child(3)").addClass("active")

        function deleteConfirmd(userid) {
            var msg = "您真的确定要删除吗？！";
            if (confirm(msg)==true){
                location.href='/admin/removeTeacher?id='+userid;
                return true;
            }else{
                return false;
            }
        };

        //改变每页显示条数
        function changPageSize(){
            var pageSize=$("#changPageSize").val();
            location.href="${pageContext.request.contextPath}/admin/showTeacher?page=1&pageSize="+pageSize;
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
                url:"/admin/searchTeacherName",
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
