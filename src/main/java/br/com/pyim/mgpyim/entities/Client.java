package br.com.pyim.mgpyim.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "client")
public class Client extends User {
    @Column(nullable = false)
    private Double balanceAmount;

    //Associação 
    @ManyToOne
    @JoinColumn(name="service_id")
    private Service service;

    public Client() {
        super();
    }

    public Double getBalanceAmount() {
        return balanceAmount;
    }

    public void setBalanceAmount(Double balanceAmount) {
        this.balanceAmount = balanceAmount;
    }
}
