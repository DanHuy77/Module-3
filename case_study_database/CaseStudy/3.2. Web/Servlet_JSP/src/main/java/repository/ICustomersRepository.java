package repository;

import model.Customers;

import java.util.List;

public interface ICustomersRepository {
    List<Customers> findAll();
    void save(Customers customers);
    Customers findByID(int id);
    void update(int id, Customers customers);
    void remove(int id);
    Customers searchByName(String name);
}
