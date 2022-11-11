package controller;

import model.Facility;
import service.IFacilityService;
import service.impl.FacilityService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FacilityServlet", value = "/facility")
public class FacilityServlet extends HttpServlet {
    IFacilityService facilityService = new FacilityService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                save(request, response);
                break;
            case "edit":
                update(request, response);
                break;
            case "remove":
                remove(request, response);
                break;
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double rentalCost = Double.parseDouble(request.getParameter("rentalCost"));
        int maxUser = Integer.getInteger(request.getParameter("maxUser"));
        String roomStandard = request.getParameter("roomStandard");
        String otherDes = request.getParameter("od");
        int poolArea = Integer.parseInt(request.getParameter("poolArea"));
        int floorNumber = Integer.parseInt(request.getParameter("floorNumber"));
        String freeService = request.getParameter("freeService");
        int rentalTypeCode = Integer.parseInt(request.getParameter("rentalTypeCode"));
        int facilityTypeCode = Integer.parseInt(request.getParameter("facilityTypeCode"));
        Facility facility = new Facility(name, area, rentalCost, maxUser, roomStandard, otherDes, poolArea, floorNumber, freeService, rentalTypeCode, facilityTypeCode);
        boolean check = facilityService.update(id, facility);
        String message = "Cập nhật không thành công";
        if (check) {
            message = "Cập nhật thành công";
        }
        request.setAttribute("message", message);
        showFacility(request, response);
    }

    private void remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("facId"));
        boolean check = facilityService.remove(id);
        String message = "Xóa không thành công";
        if (check) {
            message = "Xóa thành công";
        }
        request.setAttribute("message", message);
        showFacility(request, response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double rentalCost = Double.parseDouble(request.getParameter("rentalCost"));
        int maxUser = Integer.parseInt(request.getParameter("maxUser"));
        String roomStandard = request.getParameter("roomStandard");
        String otherDes = request.getParameter("od");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int floorNumber = Integer.parseInt(request.getParameter("floorNumber"));
        String freeService = request.getParameter("freeService");
        int rentalTypeCode = Integer.parseInt(request.getParameter("rentalTypeCode"));
        int facilityTypeCode = Integer.parseInt(request.getParameter("facilityTypeCode"));

        Facility facility = new Facility(name, area, rentalCost, maxUser, roomStandard, otherDes, poolArea, floorNumber, freeService, rentalTypeCode, facilityTypeCode);

        boolean check = facilityService.save(facility);
        String message = "Thêm mới không thành công";
        if (check) {
            message = "Thêm mới thành công";
        }
        request.setAttribute("message", message);
        request.getRequestDispatcher("view/facility/add_villa.jsp").forward(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addVilla":
                showAddVillaForm(request, response);
                break;
            case "addHouse":
                showAddHouseForm(request, response);
                break;
            case "addRoom":
                showAddRoomForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            default:
                showFacility(request, response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Facility facility = facilityService.findByID(id);
        request.setAttribute("facility", facility);
        try {
            request.getRequestDispatcher("view/facility/edit_facility.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddRoomForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/facility/add_room.jsp").forward(request, response);
    }

    private void showAddHouseForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/facility/add_house.jsp").forward(request, response);
    }

    private void showAddVillaForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/facility/add_villa.jsp").forward(request, response);

    }

    private void showFacility(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Facility> facilityList = facilityService.findAll();
        request.setAttribute("facilityList", facilityList);
        request.getRequestDispatcher("/view/facility/facility_list.jsp").forward(request, response);
    }
}
