package br.com.pyim.mgpyim.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "employee")
public class Employee extends User{
    @Column(nullable = false)
    private Double salary;

    @Column(nullable = false)
    private Date AdmissionDate;

    private Date ResignationDate;
    
    @OneToOne()
    @JoinColumn(name="role_id", nullable=false,unique = false)
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
	
	public Date getAdmissionDate() {
		return AdmissionDate;
	}

	public void setAdmissionDate(Date admissionDate) {
		AdmissionDate = admissionDate;
	}

	public Date getResignationDate() {
		return ResignationDate;
	}

	public void setResignationDate(Date resignationDate) {
		ResignationDate = resignationDate;
	}
}
