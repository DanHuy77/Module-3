package repository;

import model.AttachedService;

import java.util.List;

public interface IAttachedServiceRepository {
    List<AttachedService> findAll();
}
