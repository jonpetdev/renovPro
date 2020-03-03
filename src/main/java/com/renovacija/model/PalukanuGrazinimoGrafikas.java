package com.renovacija.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "paskolu_grafikas")
public class PalukanuGrazinimoGrafikas {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL, orphanRemoval=true)
    @JoinColumn(name = "namas_id")
    private Namas namas;

    private float palukanuProcentas;
    private int paskolosGrazinimoGrafikoMenesioDiena;
    private int dienuSkaiciusMetuose;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date paskolosGrazinimoTerminas;




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


    public float getPalukanuProcentas() {
        return palukanuProcentas;
    }

    public void setPalukanuProcentas(float palukanuProcentas) {
        this.palukanuProcentas = palukanuProcentas;
    }

    public int getPaskolosGrazinimoGrafikoMenesioDiena() {
        return paskolosGrazinimoGrafikoMenesioDiena;
    }

    public void setPaskolosGrazinimoGrafikoMenesioDiena(int paskolosGrazinimoGrafikoMenesioDiena) {
        this.paskolosGrazinimoGrafikoMenesioDiena = paskolosGrazinimoGrafikoMenesioDiena;
    }

    public int getDienuSkaiciusMetuose() {
        return dienuSkaiciusMetuose;
    }

    public void setDienuSkaiciusMetuose(int dienuSkaiciusMetuose) {
        this.dienuSkaiciusMetuose = dienuSkaiciusMetuose;
    }


    public Date getPaskolosGrazinimoTerminas() {
        return paskolosGrazinimoTerminas;
    }


    public void setPaskolosGrazinimoTerminas(Date paskolosGrazinimoTerminas) {
        this.paskolosGrazinimoTerminas = paskolosGrazinimoTerminas;
    }
}
