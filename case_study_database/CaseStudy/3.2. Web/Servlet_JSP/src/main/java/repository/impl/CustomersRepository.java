package repository.impl;

import model.Customers;
import repository.BaseRepository;
import repository.ICustomersRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomersRepository implements ICustomersRepository {
    private final String SELECT_ALL = "SELECT * FROM customer;";
    private final String INSERT_CUSTOMERS = "INSERT INTO customer(full_name, birthday, gender, ID_number, telephone,email, address, customer_type_code) " + " values(?, ?, ?, ?, ?, ? ,?, ?);";
    private final String DELETE_CUSTOMERS = "DELETE FROM customer WHERE customer.customer_code = ?;";
    private final String EDIT_CUSTOMERS = "UPDATE customer SET customer.full_name = ?, customer.birthday = ?, customer.gender = ?, customer.ID_number = ?, customer.telephone = ?, customer.email = ?, customer.address = ?, customer.customer_type_code = ? WHERE customer.customer_code =?;";

    @Override
    public List<Customers> findAll() {
        List<Customers> customersList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_code");
                String name = resultSet.getString("full_name");
                Date birthday = resultSet.getDate("birthday");
                boolean gender = resultSet.getBoolean("gender");
                String id_number = resultSet.getString("ID_number");
                String phoneNumber = resultSet.getString("telephone");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int customerTypeCode = resultSet.getInt("customer_type_code");
                Customers customers = new Customers(id, name, birthday, gender, id_number, phoneNumber, email, address, customerTypeCode);
                customersList.add(customers);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customersList;
    }

    @Override
    public boolean save(Customers customers) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMERS);
            preparedStatement.setString(1, customers.getName());
            preparedStatement.setDate(2, customers.getBirthday());
            preparedStatement.setBoolean(3, customers.isGender());
            preparedStatement.setString(4, customers.getIdNumber());
            preparedStatement.setString(5, customers.getPhoneNumber());
            preparedStatement.setString(6, customers.getEmail());
            preparedStatement.setString(7, customers.getAddress());
            preparedStatement.setInt(8, customers.getCustomerTypeCode());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public Customers findByID(int id) {

        return null;
    }

    @Override
    public boolean update(int id, Customers customers) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT_CUSTOMERS);
            preparedStatement.setString(1, customers.getName());
            preparedStatement.setDate(2, customers.getBirthday());
            preparedStatement.setBoolean(3, customers.isGender());
            preparedStatement.setString(4, customers.getIdNumber());
            preparedStatement.setString(5, customers.getPhoneNumber());
            preparedStatement.setString(6, customers.getEmail());
            preparedStatement.setString(7, customers.getAddress());
            preparedStatement.setInt(8, customers.getCustomerTypeCode());
            preparedStatement.setInt(9, id);
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
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMERS);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public Customers searchByName(String name) {

        return null;
    }
}
