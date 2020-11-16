package br.com.pyim.mgpyim.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.pyim.mgpyim.entities.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long> {

}
