package service.impl;

import model.AttachedService;
import repository.IAttachedServiceRepository;
import repository.impl.AttachedServiceRepository;
import service.IAttachedServiceService;

import java.util.List;

public class AttachedServiceService implements IAttachedServiceService {
    IAttachedServiceRepository attachedServiceRepository = new AttachedServiceRepository();
    @Override
    public List<AttachedService> findAll() {
        return attachedServiceRepository.findAll();
    }
}
