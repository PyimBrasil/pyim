package br.com.pyim.mgpyim.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.pyim.mgpyim.entities.Service;
import br.com.pyim.mgpyim.entities.enums.ServiceStatus;

@Repository
public interface ServiceRepository extends JpaRepository<Service, Long> {
    List<Service> findAllByServiceStatus(ServiceStatus serviceStatus);
}
