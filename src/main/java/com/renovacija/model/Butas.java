package com.renovacija.model;


import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="butas")
public class Butas {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "namo_id")
    private Namas namas;

    private String butoNr;

    private int moketojoKodas;
    private float bendrasPlotas;
    private String Vardas;
    private String Pavarde;
    private boolean delspinigiai;
    private boolean spausdinti;

    @OneToOne(mappedBy = "butasbutas", cascade = CascadeType.ALL, fetch = FetchType.LAZY, optional=false)
    private PaskolosSuma paskolosSuma;

    @OneToMany(mappedBy = "butasSaskaita")
    private List<SaskaitosIsrasymas> saskaitosIsrasymas= new ArrayList<>();

    public Butas(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Namas getNamas() {
        return namas;
    }

    public void setNamas(Namas namas) {
        this.namas = namas;
    }

    public int getMoketojoKodas() {
        return moketojoKodas;
    }

    public void setMoketojoKodas(int moketojoKodas) {
        this.moketojoKodas = moketojoKodas;
    }

    public float getBendrasPlotas() {
        return bendrasPlotas;
    }

    public void setBendrasPlotas(float bendrasPlotas) {
        this.bendrasPlotas = bendrasPlotas;
    }

    public String getVardas() {
        return Vardas;
    }

    public void setVardas(String vardas) {
        Vardas = vardas;
    }

    public String getPavarde() {
        return Pavarde;
    }

    public void setPavarde(String pavarde) {
        Pavarde = pavarde;
    }

    public boolean isDelspinigiai() {
        return delspinigiai;
    }

    public void setDelspinigiai(boolean delspinigiai) {
        this.delspinigiai = delspinigiai;
    }

    public boolean isSpausdinti() {
        return spausdinti;
    }

    public void setSpausdinti(boolean spausdinti) {
        this.spausdinti = spausdinti;
    }

    public String getButoNr() {
        return butoNr;
    }

    public void setButoNr(String butoNr) {
        this.butoNr = butoNr;
    }

    public PaskolosSuma getPaskolosSuma() {
        return paskolosSuma;
    }

    public void setPaskolosSuma(PaskolosSuma paskolosSuma) {
        this.paskolosSuma = paskolosSuma;
    }

    public List<SaskaitosIsrasymas> getSaskaitosIsrasymas() {
        return saskaitosIsrasymas;
    }

    public void setSaskaitosIsrasymas(List<SaskaitosIsrasymas> saskaitosIsrasymas) {
        this.saskaitosIsrasymas = saskaitosIsrasymas;
    }
}
