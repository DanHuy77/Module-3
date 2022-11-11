package repository.impl;

import model.AttachedService;
import repository.BaseRepository;
import repository.IAttachedServiceRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AttachedServiceRepository implements IAttachedServiceRepository {
    private final String SELECT_ALL = "SELECT * FROM attached_service;";

    @Override
    public List<AttachedService> findAll() {
        List<AttachedService> attachedServiceList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("attached_service_code");
                String name = resultSet.getString("attached_service_name");
                int cost = resultSet.getInt("cost");
                String unit = resultSet.getString("unit");
                String status = resultSet.getString("service_status");
                AttachedService attachedService = new AttachedService(id, name, cost, unit, status);
                attachedServiceList.add(attachedService);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return attachedServiceList;
    }
}
