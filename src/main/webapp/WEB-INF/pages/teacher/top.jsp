<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--shiro标签--%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!-- 顶栏 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">青枣选课系统</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbarNavAltMarkup">
            <div class="navbar-nav" style="font-size: 1.25rem;">
                <a class="nav-link text-primary active" href="#">教师平台</a>
            </div>
        </div>
        <form action="##" class="d-flex">
            <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown">
                    <shiro:principal/>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                    <li><a class="dropdown-item" href="#">个人信息</a></li>
                    <li><a class="dropdown-item" href="/logout">注销</a></li>
                </ul>
            </div>
        </form>
    </div>
</nav>
