package br.com.pyim.mgpyim.entities;

import java.time.Instant;
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

    @Column(columnDefinition = "TIMESTAMP WITHOUT TIME ZONE", nullable = false)
    private Instant InitialDateTime;

    @Column(columnDefinition = "TIMESTAMP WITHOUT TIME ZONE")
    private Instant FinalDateTime;

    private Date numberHoursOfService;

    public Service() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Instant getInitialDateTime() {
        return InitialDateTime;
    }

    public void setInitialDateTime(Instant initialDateTime) {
        InitialDateTime = initialDateTime;
    }

    public Instant getFinalDateTime() {
        return FinalDateTime;
    }

    public void setFinalDateTime(Instant finalDateTime) {
        FinalDateTime = finalDateTime;
    }

    public Date getNumberHoursOfService() {
        return numberHoursOfService;
    }

    public void setNumberHoursOfService(Date numberHoursOfService) {
        this.numberHoursOfService = numberHoursOfService;
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
