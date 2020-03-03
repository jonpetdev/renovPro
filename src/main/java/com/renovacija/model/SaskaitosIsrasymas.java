package com.renovacija.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;

@Entity
@Table(name="saskaitos_israsymas")
public class SaskaitosIsrasymas {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "butas_id")
    private Butas butasSaskaita;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date saskaitosIsrasymoData;
    private float menesineSuma;
    private float delspinigiai;


    public SaskaitosIsrasymas() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Butas getButasSaskaita() {
        return butasSaskaita;
    }

    public void setButasSaskaita(Butas butasSaskaita) {
        this.butasSaskaita = butasSaskaita;
    }

    public Date getSaskaitosIsrasymoData() {
        return saskaitosIsrasymoData;
    }

    public void setSaskaitosIsrasymoData(Date saskaitosIsrasymoData) {
        this.saskaitosIsrasymoData = saskaitosIsrasymoData;
    }

    public float getMenesineSuma() {
        return menesineSuma;
    }

    public void setMenesineSuma(float menesineSuma) {
        BigDecimal bd = new BigDecimal(menesineSuma).setScale(2, RoundingMode.FLOOR);
        this.menesineSuma = bd.floatValue();
    }

    public float getDelspinigiai() {
        return delspinigiai;
    }

    public void setDelspinigiai(float delspinigiai) {
        BigDecimal bd = new BigDecimal(delspinigiai).setScale(2, RoundingMode.FLOOR);
        this.delspinigiai = bd.floatValue();
    }
}
