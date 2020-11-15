package br.com.pyim.mgpyim.entities;

import java.time.Instant;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "employee")
public class Employee extends User{
    private Double salary;

    @Column(columnDefinition = "TIMESTAMP", nullable = false)
    private Instant AdmissionDate;

    @Column(columnDefinition = "TIMESTAMP")
    private Instant ResignationDate;
    
    @OneToOne(optional=false)
    @JoinColumn(name="role_id", unique=true, nullable=false)
    private Role role;
    
    public Employee() {
        super();
    }

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
		this.salary = salary;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Instant getAdmissionDate() {
		return AdmissionDate;
	}

	public void setAdmissionDate(Instant admissionDate) {
		AdmissionDate = admissionDate;
	}

	public Instant getResignationDate() {
		return ResignationDate;
	}

	public void setResignationDate(Instant resignationDate) {
		ResignationDate = resignationDate;
	}
}
