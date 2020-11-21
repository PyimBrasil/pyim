package br.com.pyim.mgpyim.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "client")
public class Client extends User {
    @Column(nullable = false)
    private Double balanceAmount;

    //Associação 
    @OneToMany(mappedBy="client")
    private Set<Service> service = new HashSet<Service>();

    public Client() {
        super();
    }

    public Double getBalanceAmount() {
        return balanceAmount;
    }

    public void setBalanceAmount(Double balanceAmount) {
        this.balanceAmount = balanceAmount;
    }

    public Set<Service> getService() {
        return service;
    }

    public void setService(Set<Service> service) {
        this.service = service;
    }
}
