package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
    void save(Customer customer);
    Customer findByID(int ID);
    void update(int id, Customer customer);
    void remove(int id);
}
