package br.com.pyim.mgpyim.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.pyim.mgpyim.entities.Service;

@Repository
public interface ServiceRepository extends JpaRepository<Service, Long> {

}
