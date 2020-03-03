package com.renovacija.model;




import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="bankas")
public class Bankas {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;
    private String bankoKoduote;
    private String bankoPavadinimas;
    private int bankoKodas;

    @OneToMany(mappedBy = "bankas")
    private List<Namas> namas= new ArrayList<>();


    public Bankas(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBankoKoduote() {
        return bankoKoduote;
    }

    public void setBankoKoduote(String bankoKoduote) {
        this.bankoKoduote = bankoKoduote;
    }

    public String getBankoPavadinimas() {
        return bankoPavadinimas;
    }

    public void setBankoPavadinimas(String bankoPavadinimas) {
        this.bankoPavadinimas = bankoPavadinimas;
    }

    public int getBankoKodas() {
        return bankoKodas;
    }

    public void setBankoKodas(int bankoKodas) {
        this.bankoKodas = bankoKodas;
    }

    public List<Namas> getNamas() {
        return namas;
    }

    public void setNamas(List<Namas> namas) {
        this.namas = namas;
    }


}
