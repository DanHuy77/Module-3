package service.impl;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public void save(Customer customer) {
        customerRepository.save(customer);
    }

    @Override
    public Customer findByID(int ID) {
        return customerRepository.findByID(ID);
    }

    @Override
    public void update(int id, Customer customer) {
        customerRepository.update(id, customer);
    }

    @Override
    public void remove(int id) {
        customerRepository.remove(id);
    }
}
