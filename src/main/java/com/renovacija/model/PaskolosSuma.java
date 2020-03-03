package com.renovacija.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.math.RoundingMode;


@Entity
@Table(name = "paskolos_suma")
public class PaskolosSuma {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL, orphanRemoval=true)
    @JoinColumn(name = "butas_id")
    private Butas butasbutas;

    
    private float visaMoketinaSuma;
    private float paskolosLikutis;
    private float visosPalukanos;
    private float palukanuLikutis;
    private float visosAtidetosPalukanos;
    private float atidetuPalukanuLikutis;

    public PaskolosSuma() {
    }

    public PaskolosSuma(Butas butasbutas, float visaMoketinaSuma, float paskolosLikutis,
                        float visosPalukanos, float palukanuLikutis,
                        float visosAtidetosPalukanos, float atidetuPalukanuLikutis){
        this.butasbutas=butasbutas;
        this.visaMoketinaSuma=visaMoketinaSuma;
        this.paskolosLikutis=paskolosLikutis;
        this.visosPalukanos=visosPalukanos;
        this.palukanuLikutis=palukanuLikutis;
        this.visosAtidetosPalukanos=visosAtidetosPalukanos;
        this.atidetuPalukanuLikutis=atidetuPalukanuLikutis;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Butas getButasbutas() {
        return butasbutas;
    }

    public void setButasbutas(Butas butasbutas) {
        this.butasbutas = butasbutas;
    }

    public float getVisaMoketinaSuma() {
        return visaMoketinaSuma;
    }

    public void setVisaMoketinaSuma(float visaMoketinaSuma) {
        BigDecimal bd = new BigDecimal(visaMoketinaSuma).setScale(2, RoundingMode.FLOOR);
        this.visaMoketinaSuma = bd.floatValue();
    }

    public float getPaskolosLikutis() {
        return paskolosLikutis;
    }

    public void setPaskolosLikutis(float paskolosLikutis) {
        BigDecimal bd = new BigDecimal(paskolosLikutis).setScale(2, RoundingMode.FLOOR);
        this.paskolosLikutis = bd.floatValue();
    }

    public float getVisosPalukanos() {
        return visosPalukanos;
    }

    public void setVisosPalukanos(float visosPalukanos) {
        BigDecimal bd = new BigDecimal(visosPalukanos).setScale(2, RoundingMode.FLOOR);
        this.visosPalukanos = bd.floatValue();
    }

    public float getPalukanuLikutis() {
        return palukanuLikutis;
    }

    public void setPalukanuLikutis(float palukanuLikutis) {
        BigDecimal bd = new BigDecimal(palukanuLikutis).setScale(2, RoundingMode.FLOOR);
        this.palukanuLikutis = bd.floatValue();
    }

    public float getVisosAtidetosPalukanos() {
        return visosAtidetosPalukanos;
    }

    public void setVisosAtidetosPalukanos(float visosAtidetosPalukanos) {
        BigDecimal bd = new BigDecimal(visosAtidetosPalukanos).setScale(2, RoundingMode.FLOOR);
        this.visosAtidetosPalukanos = bd.floatValue();
    }

    public float getAtidetuPalukanuLikutis() {
        return atidetuPalukanuLikutis;
    }

    public void setAtidetuPalukanuLikutis(float atidetuPalukanuLikutis) {
        BigDecimal bd = new BigDecimal(atidetuPalukanuLikutis).setScale(2, RoundingMode.FLOOR);
        this.atidetuPalukanuLikutis = bd.floatValue();
    }
}
