package repository.impl;

import model.Facility;
import repository.BaseRepository;
import repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private final String SELECT_ALL = "SELECT service.*, rental_type.rental_type_name,service_type.service_type_name FROM service JOIN rental_type ON service.rental_type_code = rental_type.rental_type_code JOIN service_type ON service.service_type_code = service_type.service_type_code ORDER BY service.service_code;";
    private final String INSERT_FACILITY = "INSERT INTO service\n" +
            "  (service_name,area,rental_cost,maximum_user,room_standard,other_description,pool_area,floor_number,free_service,rental_type_code,service_type_code)\n" +
            "VALUES\n" +
            "  (?,?,?,?,?,?,?,?,?,?,?)";
    private final String DELETE_FACILITY = "DELETE FROM service WHERE service.service_code = ?;";
    private final String FIND_BY_ID = "SELECT service.*, rental_type.rental_type_name,service_type.service_type_name FROM service JOIN rental_type ON service.rental_type_code = rental_type.rental_type_code JOIN service_type ON service.service_type_code = service_type.service_type_code WHERE service.service_code = ?;";
    private final String UPDATE_FACILITY = "UPDATE service SET service_name = ?, area = ?, rental_cost = ?, maximum_user = ?, room_standard = ?, other_description = ?, pool_area = ?, floor_number = ?, free_service = ?, rental_type_code = ?, service_type_code = ? WHERE service_code = ?;";

    @Override
    public List<Facility> findAll() {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("service_code");
                String name = resultSet.getString("service_name");
                int area = resultSet.getInt("area");
                double rentalCost = resultSet.getDouble("rental_cost");
                int maxUser = resultSet.getInt("maximum_user");
                String roomStandard = resultSet.getString("room_standard");
                String otherDescription = resultSet.getString("other_description");
                Double poolArea = resultSet.getDouble("pool_area");
                Integer floorNumber = resultSet.getInt("floor_number");
                String freeService = resultSet.getString("free_service");
                String rentalTypeName = resultSet.getString("rental_type_name");
                String facilityTypeName = resultSet.getString("service_type_name");
                Facility facility = new Facility(id, name, area, rentalCost, maxUser, roomStandard, otherDescription, poolArea, floorNumber, freeService, rentalTypeName, facilityTypeName);
                facilityList.add(facility);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return facilityList;
    }


    @Override
    public boolean save(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FACILITY);
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getRentalCost());
            preparedStatement.setInt(4, facility.getMaxUser());
            preparedStatement.setString(5, facility.getRoomStandard());
            preparedStatement.setString(6, facility.getOtherDescription());
            preparedStatement.setDouble(7, facility.getPoolArea());
            preparedStatement.setInt(8, facility.getFloorNumber());
            preparedStatement.setString(9, facility.getFreeService());
            preparedStatement.setInt(10, facility.getRentalTypeCode());
            preparedStatement.setInt(11, facility.getFacilityTypeCode());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public Facility findByID(int id) {
        Facility facility = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("service_name");
                int area = resultSet.getInt("area");
                double rentalCost = resultSet.getDouble("rental_cost");
                int maxUser = resultSet.getInt("maximum_user");
                String roomStandard = resultSet.getString("room_standard");
                String otherDescription = resultSet.getString("other_description");
                Double poolArea = resultSet.getDouble("pool_area");
                Integer floorNumber = resultSet.getInt("floor_number");
                String freeService = resultSet.getString("free_service");
                int rentalTypeCode = resultSet.getInt("rental_type_code");
                int facilityTypeCode = resultSet.getInt("service_type_code");
                facility = new Facility(name, area, rentalCost, maxUser, roomStandard, otherDescription, poolArea, floorNumber, freeService, rentalTypeCode, facilityTypeCode);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facility;
    }

    @Override
    public boolean update(int id, Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_FACILITY);
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getRentalCost());
            preparedStatement.setInt(4, facility.getMaxUser());
            preparedStatement.setString(5, facility.getRoomStandard());
            preparedStatement.setString(6, facility.getOtherDescription());
            preparedStatement.setDouble(7, facility.getPoolArea());
            preparedStatement.setInt(8, facility.getFloorNumber());
            preparedStatement.setString(9, facility.getFreeService());
            preparedStatement.setInt(10, facility.getRentalTypeCode());
            preparedStatement.setInt(11, facility.getFacilityTypeCode());
            preparedStatement.setInt(12, facility.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean remove(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FACILITY);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public Facility searchByName(String name) {
        return null;
    }
}
