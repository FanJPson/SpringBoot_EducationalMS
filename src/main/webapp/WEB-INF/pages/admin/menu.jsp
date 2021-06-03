<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="col-md-2">
    <ul class="list-group text-center list-group-flush">
        <a href="/admin/showStudent" class="list-group-item list-group-item-action">学生管理</a>
        <a href="/admin/showCourse" class="list-group-item list-group-item-action">课程管理</a>
        <a href="/admin/showTeacher" class="list-group-item list-group-item-action">教师管理</a>
        <a href="/admin/userPasswordRest" class="list-group-item list-group-item-action">密码重置</a>
        <a href="/admin/passwordRest" class="list-group-item list-group-item-action">修改密码</a>
        <a onclick="logoutConfirmd()" class="list-group-item list-group-item-action">退出系统</a>
    </ul>

    <script>
        function logoutConfirmd() {
            var msg = "您确定要退出吗？！";
            if (confirm(msg)==true){
                location.href='/logout';
                return true;
            }else{
                return false;
            }
        };
    </script>

</div>


