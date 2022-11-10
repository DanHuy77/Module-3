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
<h1 style="text-align: center">Danh sách cơ sở dịch vụ</h1>
<c:if test="${message != null}">
    <p style="text-align: center">${message}</p>
</c:if>

<div style="text-align: right" class="dropdown dropdown-primary">
    <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
        Thêm mới cơ sở dịch vụ
    </button>
    <ul class="dropdown-menu dropdown-menu-primary">
        <li><a class="dropdown-item" href="/facility?action=addVilla">Thêm mới Villa</a></li>
        <li><a class="dropdown-item" href="/facility?action=addHouse">Thêm mới House</a></li>
        <li><a class="dropdown-item" href="/facility?action=addRoom">Thêm mới Room</a></li>
    </ul>
</div>

<table class="table table-success ">
    <thead>
    <tr>
        <th scope="col">Số thứ tự</th>
        <th hidden scope="col">id</th>
        <th scope="col">Tên dịch vụ</th>
        <th scope="col">Diện tích</th>
        <th scope="col">Giá thuê</th>
        <th scope="col">Số khách tối đa</th>
        <th scope="col">Tiêu chuẩn phòng</th>
        <th scope="col">Mô tả tiện nghi khác</th>
        <th scope="col">Diện tích hồ bơi</th>
        <th scope="col">Số tầng</th>
        <th scope="col">Dịch vụ miễn phí</th>
        <th scope="col">Kiểu thuê</th>
        <th scope="col">Loại dịch vụ</th>
        <th scope="col">Cập nhật</th>
        <th scope="col">Xóa</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="fac" items="${facilityList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td hidden>${fac.getId()}</td>
            <td>${fac.getName()}</td>
            <td>${fac.getArea()}</td>
            <td>${fac.getRentalCost()}</td>
            <td>${fac.getMaxUser()}</td>
            <td>${fac.getRoomStandard()}</td>
            <td>${fac.getOtherDescription()}</td>
            <td>${fac.getPoolArea()}</td>
            <td>${fac.getFloorNumber()}</td>
            <td>${fac.getFreeService()}</td>
            <td>${fac.getRentalTypeName()}</td>
            <td>${fac.getFacilityTypeName()}</td>
            <td>
                <button class="btn btn-success">C.Nhật</button>
            </td>
            <td>
                <button onclick="passInfo('${fac.getId()}','${fac.getName()}')" class="btn btn-danger"
                        type="button" data-bs-toggle="modal"
                        data-bs-target="#remove">Xóa
                </button>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>

<%--Modal xóa--%>

<div class="modal fade" id="remove" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Chú ý!</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form action="/facility?action=remove" method="post">
                <div class="modal-body">
                    <input hidden type="text" name="facId" id="facId">
                    Bạn có muốn xóa cơ sở "<span id="facName"></span>" không?
                </div>
                <div class="modal-footer">


                    <span><button type="button" class="btn btn-secondary"
                                  data-bs-dismiss="modal">Không</button></span>
                    <span><button class="btn btn-primary">Xác nhận</button></span>


                </div>
            </form>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>
</body>
<script>
    function passInfo(id, name) {
        document.getElementById("facId").value = id;
        document.getElementById("facName").innerText = name;
    }
</script>
</html>
