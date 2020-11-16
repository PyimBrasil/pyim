package br.com.pyim.mgpyim.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "service_provider")
public class ServiceProvider extends User {
    @Column(columnDefinition = "TEXT", nullable = false, name = "Curriculum_URI")
    private String CurriculumURI;

    @Column(columnDefinition = "TEXT", nullable = false)
    private String Description;

    @Column(nullable = false)
    private String Profession;

    // Associações
    @ManyToOne
    @JoinColumn(name = "service_id")
    private Service requestService;

    @OneToMany(mappedBy="service_provider")
    private List<SmartContract> smartcontracts = new ArrayList<SmartContract>();

    public ServiceProvider() {
        super();
    }

    public String getCurriculumURI() {
        return CurriculumURI;
    }

    public void setCurriculumURI(String curriculumURI) {
        CurriculumURI = curriculumURI;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getProfession() {
        return Profession;
    }

    public void setProfession(String profession) {
        Profession = profession;
    }
}
