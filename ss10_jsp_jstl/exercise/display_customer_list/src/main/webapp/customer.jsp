<%--
  Created by IntelliJ IDEA.
  User: Nhật Huy
  Date: 11/3/2022
  Time: 11:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
    <h1>Danh Sách Khách Hàng</h1>
    <table class="table table-success">
        <tr>
            <th>Số thứ tự</th>
            <th>
                Tên
            </th>
            <th>
                Ngày Sinh
            </th>
            <th>
                Địa Chỉ
            </th>
            <th>
                Ảnh
            </th>
        </tr>

        <c:forEach var="customer" items="${customers}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${customer.getName()}</td>
                <td>${customer.getBirthday()}</td>
                <td>${customer.getAddress()}</td>
                <td><img src=${customer.getAvatar()}></td>

            </tr>
        </c:forEach>
    </table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>
