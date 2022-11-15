<%--
  Created by IntelliJ IDEA.
  User: Nhật Huy
  Date: 11/6/2022
  Time: 9:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<h1 style="text-align: center">Danh sách khách hàng</h1>
<c:if test="${message != null}">
    <p style="text-align: center">${message}</p>
</c:if>

<button type="button" style="float: right" class="btn btn-primary" data-bs-toggle="modal"
        data-bs-target="#add">Thêm mới khách hàng
</button>

<table class="table table-success">
    <tr>
        <th hidden>ID</th>
        <th>Stt</th>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Giới tính</th>
        <th hidden>Số CMND</th>
        <th>Số điện thoại</th>
        <th>Email</th>
        <th>Địa chỉ</th>
        <th>Loại khách</th>
        <th>Cập nhật</th>
        <th>Xóa</th>
        <th>Xem chi tiết</th>
    </tr>
    <c:forEach var="customers" items="${customersList}" varStatus="status">
        <tr>
            <td hidden>${customers.getId()}</td>
            <td>${status.count}</td>
            <td>${customers.getName()}</td>
            <td>${customers.getBirthday()}</td>
            <c:if test="${customers.isGender() == true}">
                <td>Nam</td>
            </c:if>
            <c:if test="${customers.isGender() == false}">
                <td>Nữ</td>
            </c:if>

            <td hidden>${customers.getIdNumber()}</td>
            <td>${customers.getPhoneNumber()}</td>
            <td>${customers.getEmail()}</td>
            <td>${customers.getAddress()}</td>
            <c:forEach var="custype" items="${customerTypeList}">
                <c:if test="${custype.customerTypeCode == customers.getCustomerTypeCode()}">
                    <td>${custype.customerTypeName}</td>
                </c:if>
            </c:forEach>
            <td>
                <button onclick="passEditInfo('${customers.getId()}','${customers.getName()}','${customers.getBirthday()}',
                        '${customers.isGender()}','${customers.getIdNumber()}','${customers.getPhoneNumber()}',
                        '${customers.getEmail()}','${customers.getAddress()}', ${customers.getCustomerTypeCode()})"
                        class="btn btn-success" type="button" data-bs-toggle="modal"
                        data-bs-target="#edit">Cập nhật
                </button>
            </td>
            <td>
                <button onclick="passInfo('${customers.getId()}','${customers.getName()}')" class="btn btn-danger"
                        type="button" data-bs-toggle="modal"
                        data-bs-target="#remove">Xóa
                </button>
            </td>
            <td><a href="/customer?action=view&id=${customers.getId()}">
                <button class="btn btn-secondary">Xem chi tiết</button>
            </a></td>
        </tr>

    </c:forEach>
</table>


<%--Modal add--%>


<div class="modal fade" id="add" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelAdd">Thêm mới khách hàng</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/customers?action=add" method="post">
                <div class="modal-body">

                    <pre>Tên           <input name="name"></pre>


                    <pre>Ngày Sinh     <input name="birthday" type="date"></pre>


                    <pre>Giới tính     <select name="gender" style="width: 45%; height: 70%"
                                               class="form-select form-control-sm"
                                               aria-label="Default select example">
                                    <option value="true" selected>Nam</option>
                                    <option value="false">Nữ</option>
                                </select></pre>


                    <pre>Số CMND       <input name="idNumber" type="text"></pre>

                    <pre>Số điện thoại <input name="phoneNumber" type="text"></pre>


                    <pre>Email         <input name="email" type="text"></pre>


                    <pre>Địa chỉ       <input name="address" type="text"></pre>

                    <pre>Loại khách    <select name="customerTypeCode" style="width: 45%"
                                               class="form-select form-control-sm"
                                               aria-label="Default select example">
                        <option selected>-- Chọn loại khách --</option>

                            <c:forEach var="cus" items="${customerTypeList}">
                                <option value="${cus.customerTypeCode}">${cus.customerTypeName}</option>
                            </c:forEach>
                                </select></pre>
                </div>

                <div class="modal-footer">

                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
                    <button type="submit" class="btn btn-primary">Xác nhận</button>

                </div>
            </form>
        </div>

    </div>

</div>


<%--Modal Xóa--%>

<div class="modal fade" id="remove" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">

    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Chú ý!</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form action="/customers?action=remove" method="post">
                <div class="modal-body">
                    <input hidden type="text" name="cusId" id="cusId">
                    Bạn có muốn xóa khách hàng "<span id="cusName"></span>" không?
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


<%--Modal Edit--%>

<div class="modal fade" id="edit" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelRemove">Cập nhật thông tin</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/customers?action=edit" method="post">
                <div class="modal-body">
                    <input hidden id="editId" name="id">

                    <pre>Tên           <input id="editName" name="name"></pre>


                    <pre>Ngày Sinh     <input id="editBirthday" name="birthday" type="date"></pre>


                    <pre>Giới tính     <select id="editCusGen" name="gender" style="width: 45%"
                                               class="form-select form-control-sm"
                                               aria-label="Default select example">
                        <option selected>Chọn giới tính</option>
                                <option value="true">Nam</option>
                                <option value="false">Nữ</option>
                            </select></pre>


                    <pre>Số CMND       <input id="editIdNumber" name="idNumber" type="text"></pre>

                    <pre>Số điện thoại <input id="editPhoneNumber" name="phoneNumber" type="text"></pre>


                    <pre>Email         <input id="editEmail" name="email" type="text"></pre>


                    <pre>Địa chỉ       <input id="editAddress" name="address" type="text"></pre>

                    <pre>Loại khách    <select id="cusTypeCode" name="customerTypeCode" style="width: 45%"
                                               class="form-select form-control-sm"
                                               aria-label="Default select example">

                            <c:forEach var="cus" items="${customerTypeList}">
                                <option value="${cus.customerTypeCode}">${cus.customerTypeName}</option>
                            </c:forEach>
                                </select></pre>
                </div>

                <div class="modal-footer">

                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
                    <button type="submit" class="btn btn-primary">Lưu</button>

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
        document.getElementById("cusId").value = id;
        document.getElementById("cusName").innerText = name;
    }

    function passEditInfo(id, name, birthday, gender, idNumber, phoneNumber, email, address, typeCode) {
        document.getElementById("editId").value = id;
        document.getElementById("editName").value = name;
        document.getElementById("editBirthday").value = birthday;
        document.getElementById("editCusGen").value = gender;
        document.getElementById("editIdNumber").value = idNumber;
        document.getElementById("editPhoneNumber").value = phoneNumber;
        document.getElementById("editEmail").value = email;
        document.getElementById("editAddress").value = address;
        document.getElementById("cusTypeCode").value = typeCode;
    }
</script>
</html>
