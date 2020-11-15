package br.com.pyim.mgpyim.entities;

import java.time.Instant;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "block_chain")
public class BlockChain {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, columnDefinition = "TIMESTAMP")
    private Instant InitialDateTime;

    @Column(nullable = false, columnDefinition = "TIMESTAMP")
    private Instant finalDateTime;

    public BlockChain() {
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
        return finalDateTime;
    }

    public void setFinalDateTime(Instant finalDateTime) {
        this.finalDateTime = finalDateTime;
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
        BlockChain other = (BlockChain) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }
}
