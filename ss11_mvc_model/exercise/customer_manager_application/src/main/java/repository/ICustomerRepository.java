package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();
    void save(Customer customer);
    Customer findByID(int ID);
    void update(int id, Customer customer);
    void remove(int id);
}
