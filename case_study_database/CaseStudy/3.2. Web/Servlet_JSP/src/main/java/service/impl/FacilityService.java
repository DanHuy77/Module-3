package service.impl;

import model.Facility;
import repository.IFacilityRepository;
import repository.impl.FacilityRepository;
import service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    IFacilityRepository facilityRepository = new FacilityRepository();
    @Override
    public List<Facility> findAll() {
        return facilityRepository.findAll();
    }

    @Override
    public boolean save(Facility facility) {
        return facilityRepository.save(facility);
    }

    @Override
    public Facility findByID(int id) {
        return null;
    }

    @Override
    public boolean update(int id, Facility facility) {
        return facilityRepository.update(id, facility);
    }

    @Override
    public boolean remove(int id) {
        return facilityRepository.remove(id);
    }

    @Override
    public Facility searchByName(String name) {
        return null;
    }
}
