<%--
  Created by IntelliJ IDEA.
  User: Nhật Huy
  Date: 11/9/2022
  Time: 10:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<html>
<head>
    <title>Danh sách cơ sở dịch vụ</title>
</head>
<body>
<h1>Danh sách cơ sở dịch vụ</h1>
<c:if test="${message != null}">
    <p style="text-align: center">${message}</p>
</c:if>

<button type="button" style="float: right" class="btn btn-primary" data-bs-toggle="modal"
        data-bs-target="#add">Thêm mới khách hàng
</button>

<table class="table table-success">
    <thead>
    <tr>
        <th scope="col">Số thứ tự</th>
        <th scope="col">id</th>
        <th scope="col">Tên dịch vụ</th>
        <th scope="col">Diện tích</th>
        <th scope="col">Giá thuê</th>
        <th scope="col">Số khách tối đa</th>
        <th scope="col">Tiêu chuẩn phòng</th>
        <th scope="col">Số tầng</th>
        <th scope="col">Dịch vụ miễn phí</th>
        <th scope="col">Kiểu thuê</th>
        <th scope="col">Loại dịch vụ</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">1</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
    </tr>
    </tbody>
</table>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>
</body>
</html>
