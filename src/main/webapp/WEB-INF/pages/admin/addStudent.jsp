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
				<div class="card">
					<div class="card-body">
						<h2 class="card-title text-center">添加学生</h2>
						<form class="mt-2" action="/admin/addStudent" id="editfrom" method="post">
							<div class="mb-3 form-floating">
								<input type="number" class="form-control" id="userid" name="userid" placeholder="请输入学号">
								<label for="userid" class="form-label">学号</label>
								<%--学号存在时给出的提示信息--%>
								<span id="span_userid" style="float: right"></span>
							</div>
							<div class="mb-3 form-floating">
								<input type="text" class="form-control" id="inputPassword3" name="username" placeholder="请输入姓名">
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
								<input type="date" class="form-control" id="Da1" name="birthyear">
							</div>
							<div class="mb-3">
								<label for="Da2" class="form-label">入学时间</label>
								<input type="date" class="form-control" id="Da2" name="grade">
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
		$("#nav li:nth-child(2)").addClass("active")

		//查看学号是否存在
        function checkUserid(){
            var userid=$("#userid").val();
            // alert(userid)

            var allData = {
                userid:userid
            };

            $.ajax({
                url:"${pageContext.request.contextPath}/admin/checkStudentId",
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
