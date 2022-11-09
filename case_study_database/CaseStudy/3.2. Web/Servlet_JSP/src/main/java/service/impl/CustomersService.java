package service.impl;

import model.Customers;
import repository.ICustomersRepository;
import repository.impl.CustomersRepository;
import service.ICustomersService;

import java.util.List;

public class CustomersService implements ICustomersService {
    ICustomersRepository customersRepository = new CustomersRepository();

    @Override
    public List<Customers> findAll() {
        return customersRepository.findAll();
    }

    @Override
    public boolean save(Customers customers) {
        return customersRepository.save(customers);
    }

    @Override
    public Customers findByID(int id) {
        return customersRepository.findByID(id);
    }

    @Override
    public boolean update(int id, Customers customers) {
        return customersRepository.update(id, customers);
    }

    @Override
    public boolean remove(int id) {
       return customersRepository.remove(id);
    }

    @Override
    public Customers searchByName(String name) {
        return customersRepository.searchByName(name);
    }
}
