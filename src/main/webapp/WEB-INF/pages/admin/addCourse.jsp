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
			<div class="card mb-5">
				<div class="card-body">
					<h2 class="card-title text-center">添加课程</h2>
					<form class="mt-2" action="/admin/addCourse" id="editfrom" method="post">
						<div class="mb-3 form-floating">
							<input type="number" class="form-control" id="courseid" name="courseid" placeholder="请输入课程号">
							<label for="courseid" class="form-label">课程号</label>
							<%--课程号存在时给出的提示信息--%>
							<span id="span_userid" style="float: right"></span>
						</div>
						<div class="mb-3 form-floating">
							<input type="text" class="form-control" id="inputPassword3" name="coursename" placeholder="请输入课程名称">
							<label for="inputPassword3" class="form-label">课程名称</label>
						</div>
						<div class="mb-3 form-floating">
							<select class="form-select" id="teacherid" name="teacherid">
								<c:forEach items="${teacherList}" var="item">
									<option value="${item.userid}">${item.username}</option>
								</c:forEach>
							</select>
							<label for="teacherid">授课老师编号</label>
						</div>
						<div class="mb-3 form-floating">
							<input type="text" class="form-control" id="time1" name="coursetime" placeholder="请输入上课时间">
							<label for="time1" class="form-label">上课时间</label>
						</div>
						<div class="mb-3 form-floating">
							<input type="text" class="form-control" id="add1" name="classroom" placeholder="请输入上课地点">
							<label for="add1" class="form-label">上课地点</label>
						</div>
						<div class="mb-3 form-floating">
							<input type="number" class="form-control" id="courseweek" name="courseweek" placeholder="请输入周数">
							<label for="courseweek" class="form-label">周数</label>
						</div>
						<div class="mb-3 form-floating">
							<select class="form-select" id="kc1" name="coursetype">
								<option value="必修课">必修课</option>
								<option value="选修课">选修课</option>
								<option value="公共课">公共课</option>
							</select>
							<label for="kc1">课程类型</label>
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
							<input type="number" class="form-control" id="score" name="score" placeholder="请输入学分">
							<label for="score" class="form-label">学分</label>
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
<script type="text/javascript">
    $("#nav li:nth-child(1)").addClass("active")

    //查看课程号是否存在
    function checkUserid(){
        var userid=$("#userid").val();
        // alert(userid)

        var allData = {
            userid:userid
        };

        $.ajax({
            url:"${pageContext.request.contextPath}/admin/checkCourseId",
            contentType:"application/json;charset=UTF-8",
            data:JSON.stringify(allData),//'{"username":username}',
            dataType:"json",
            type:"post",
            success:function (data) {
                if (data.flag){
                    //学号不存在，可以添加
                    $("#userid").css("border","");
                    $("#span_userid").text("");
                }else{
                    //学号已经存在
                    $("#userid").css("border","1px solid red");
                    $("#span_userid").text(data.errorMsg);
                    $("#span_userid").css("color","red");
                }
            }
        });
    }

    $(function () {

        $("#userid").blur(checkUserid);

    });
</script>
</html>
