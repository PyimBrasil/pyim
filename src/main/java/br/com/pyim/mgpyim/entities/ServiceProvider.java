package br.com.pyim.mgpyim.entities;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "service_provider")
public class ServiceProvider extends User {
    @Column(columnDefinition = "TEXT", nullable = false, name = "Curriculum_URI")
    private String curriculumURI;

    @Column(columnDefinition = "TEXT", nullable = false)
    private String description;

    @Column(nullable = false)
    private String profession;

    // Associações
    @OneToMany(targetEntity = Service.class)
    private Set<Service> requestServices = new HashSet<Service>();

    @OneToMany(mappedBy = "service_provider")
    private List<SmartContract> smartcontracts = new ArrayList<SmartContract>();

    public ServiceProvider() {
        super();
    }

    public String getCurriculumURI() {
        return curriculumURI;
    }

    public void setCurriculumURI(String curriculumURI) {
        this.curriculumURI = curriculumURI;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public Set<Service> getRequestServices() {
        return requestServices;
    }

    public void setRequestServices(Set<Service> requestServices) {
        this.requestServices = requestServices;
    }

    public List<SmartContract> getSmartcontracts() {
        return smartcontracts;
    }

    public void setSmartcontracts(List<SmartContract> smartcontracts) {
        this.smartcontracts = smartcontracts;
    }
}
