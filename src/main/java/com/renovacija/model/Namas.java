package com.renovacija.model;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

@Entity(name = "namas")
public class Namas {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @NotBlank(message = "required.gatve")
    private String gatve;
    private String namoNr;
    private String namoKodas;

    @NotNull(message = "required.bankas")
    @ManyToOne
    @JoinColumn(name = "banko_id")
    private Bankas bankas;

    @Column(name = "kaup_lesu_saskaita")
    private String kaupLesuSakaitaBanke;

    @OneToMany(mappedBy = "namas")
    private List<Butas> butas= new ArrayList<>();

    @OneToOne(mappedBy = "namas", cascade = CascadeType.ALL, fetch = FetchType.LAZY, optional=false)
    private PalukanuGrazinimoGrafikas palukanuGrazinimoGrafikas;

    public Namas(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGatve() {
        return gatve;
    }

    public void setGatve(String gatve) {
        this.gatve = gatve;
    }

    public String getNamoNr() {
        return namoNr;
    }

    public void setNamoNr(String namoNr) {
        this.namoNr = namoNr;
    }

    public String getNamoKodas() {
        return namoKodas;
    }

    public void setNamoKodas(String namoKodas) {
        this.namoKodas = namoKodas;
    }


    public String getKaupLesuSakaitaBanke() {
        return kaupLesuSakaitaBanke;
    }

    public void setKaupLesuSakaitaBanke(String kaupLesuSakaitaBanke) {
        this.kaupLesuSakaitaBanke = kaupLesuSakaitaBanke;
    }

    public Bankas getBankas() {
        return bankas;
    }

    public void setBankas(Bankas bankas) {
        this.bankas = bankas;
    }

    public List<Butas> getButas() {
        return butas;
    }

    public void setButas(List<Butas> butas) {
        this.butas = butas;
    }

    public PalukanuGrazinimoGrafikas getPalukanuGrazinimoGrafikas() {
        return palukanuGrazinimoGrafikas;
    }

    public void setPalukanuGrazinimoGrafikas(PalukanuGrazinimoGrafikas palukanuGrazinimoGrafikas) {
        this.palukanuGrazinimoGrafikas = palukanuGrazinimoGrafikas;
    }
}
