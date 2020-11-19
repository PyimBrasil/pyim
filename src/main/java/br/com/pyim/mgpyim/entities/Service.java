package br.com.pyim.mgpyim.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "service")
public class Service {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Date initialDateTime;

    private Date finalDateTime;
    private Integer numberHoursOfService;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String description;

    public Service() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getInitialDateTime() {
        return initialDateTime;
    }

    public void setInitialDateTime(Date initialDateTime) {
        this.initialDateTime = initialDateTime;
    }

    public Date getFinalDateTime() {
        return finalDateTime;
    }

    public void setFinalDateTime(Date finalDateTime) {
        this.finalDateTime = finalDateTime;
    }

    public Integer getNumberHoursOfService() {
        return numberHoursOfService;
    }

    public void setNumberHoursOfService(Integer numberHoursOfService) {
        this.numberHoursOfService = numberHoursOfService;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Service other = (Service) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }
}
