<%--
  Created by IntelliJ IDEA.
  User: Nhật Huy
  Date: 11/11/2022
  Time: 10:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Chỉnh sửa Facility</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<h1 class="bg-success" style="text-align: center; color: white">Chỉnh sửa Facility</h1>
<h4 class="bg-success" style="text-align: center; color: white">Vui lòng nhập thông tin</h4>
<a href="/facility">
    <button class="btn btn-secondary">Quay lại danh sách</button>
</a>
<c:if test="${message != null}">
    <p style="text-align: center">${message}</p>
</c:if>
<form action="/facility?action=edit" method="post">
    <table style="width: 50%; margin-left: 350px; margin-top: 25px" class="table table-success">
        <tr>
            <td>Tên dịch vụ</td>
            <td><input value="${facility.getName()}" name="name"></td>
        </tr>
        <tr>
            <td>Diện tích</td>
            <td><input value="${facility.getArea()}" name="area"></td>
        </tr>
        <tr>
            <td>Giá thuê</td>
            <td><input value="${facility.getRentalCost()}" name="rentalCost"></td>
        </tr>
        <tr>
            <td>Số khách tối đa</td>
            <td><input value="${facility.getMaxUser()}" name="maxUser"></td>
        </tr>
        <tr>
            <td>Tiêu chuẩn phòng</td>
            <td><select name="roomStandard" style="width: 45%"
                        class="form-select form-control-sm"
                        aria-label="Default select example">
                <option selected>-- Chọn tiêu chuẩn --</option>
                <option value="Vip" ${facility.getRoomStandard().equals("vip")?"selected":""}>Vip</option>
                <option value="Normal" ${facility.getRoomStandard().equals("normal")?"selected":""}>Normal</option>
            </select></td>
        </tr>
        <tr>
            <td>Mô tả tiện nghi khác</td>
            <td><input value="${facility.getOtherDescription()}" name="od"></td>
        </tr>
        <c:if test="${facility.getFacilityTypeCode() == 1}">
            <tr>
                <td>Diện tích hồ bơi</td>
                <td><input value="${facility.getPoolArea()}" name="poolArea"></td>
            </tr>
        </c:if>
        <c:if test="${facility.getFacilityTypeCode() == 1 || facility.getFacilityTypeCode() == 2}">
            <tr>
                <td>Số tầng</td>
                <td><input value="${facility.getFloorNumber()}" name="floorNumber"></td>
            </tr>
        </c:if>
        <c:if test="${facility.getFacilityTypeCode() == 3}">
            <tr>
                <td>Dịch vụ miễn phí đi kèm</td>
                <td><input value="${facility.getFreeService()}" name="freeService"></td>
            </tr>
        </c:if>
        <tr>
            <td>Kiểu thuê</td>
            <td><select name="rentalTypeCode" style="width: 45%"
                        class="form-select form-control-sm"
                        aria-label="Default select example">
                <option selected>-- Chọn kiểu thuê --</option>
                <option value="1" ${facility.getRentalTypeCode() == 1?"selected":""}>Year</option>
                <option value="2" ${facility.getRentalTypeCode() == 2?"selected":""}>Month</option>
                <option value="3" ${facility.getRentalTypeCode() == 3?"selected":""}>Day</option>
                <option value="4" ${facility.getRentalTypeCode() == 4?"selected":""}>Hour</option>
            </select></td>
        </tr>
        <tr hidden>
            <td><input value="${facility.getId()}" name="id"></td>
            <td><input value="${facility.getFacilityTypeCode()}" name="facilityTypeCode"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <span><button class="btn btn-primary">Xác nhận</button></span>
            </td>
        </tr>

    </table>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>
</body>
</html>
