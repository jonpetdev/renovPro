package com.renovacija.model;

import javax.persistence.*;

@Entity
@Table(name = "grid_settings")
public class GridSettings {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int gridid;

    private boolean adresas;
    private boolean moketojoKodas;
    private boolean bendrasPlotas;
    private boolean vardasPavarde;
    private boolean delspinigiai;
    private boolean spausdinimas;
    private boolean bankoKoduote;
    private boolean palukanuProcentas;
    private boolean menesioDiena;
    private boolean dienuSkaiciusMetuose;
    private boolean paskolosGrazinimoTerminas;
    private boolean paskolosSuma;
    private boolean paskolosLikutis;
    private boolean palukanuSuma;
    private boolean palukanuLikutis;
    private boolean atidetuPalukanuSuma;
    private boolean atidetuPalukanuLikutis;

    public GridSettings(){

    }

    public int getGridid() {
        return gridid;
    }

    public void setGridid(int gridid) {
        this.gridid = gridid;
    }

    public boolean isAdresas() {
        return adresas;
    }

    public void setAdresas(boolean adresas) {
        this.adresas = adresas;
    }

    public boolean isMoketojoKodas() {
        return moketojoKodas;
    }

    public void setMoketojoKodas(boolean moketojoKodas) {
        this.moketojoKodas = moketojoKodas;
    }

    public boolean isBendrasPlotas() {
        return bendrasPlotas;
    }

    public void setBendrasPlotas(boolean bendrasPlotas) {
        this.bendrasPlotas = bendrasPlotas;
    }

    public boolean isVardasPavarde() {
        return vardasPavarde;
    }

    public void setVardasPavarde(boolean vardasPavarde) {
        this.vardasPavarde = vardasPavarde;
    }

    public boolean isDelspinigiai() {
        return delspinigiai;
    }

    public void setDelspinigiai(boolean delspinigiai) {
        this.delspinigiai = delspinigiai;
    }

    public boolean isSpausdinimas() {
        return spausdinimas;
    }

    public void setSpausdinimas(boolean spausdinimas) {
        this.spausdinimas = spausdinimas;
    }

    public boolean isBankoKoduote() {
        return bankoKoduote;
    }

    public void setBankoKoduote(boolean bankoKoduote) {
        this.bankoKoduote = bankoKoduote;
    }

    public boolean isPalukanuProcentas() {
        return palukanuProcentas;
    }

    public void setPalukanuProcentas(boolean palukanuProcentas) {
        this.palukanuProcentas = palukanuProcentas;
    }

    public boolean isMenesioDiena() {
        return menesioDiena;
    }

    public void setMenesioDiena(boolean menesioDiena) {
        this.menesioDiena = menesioDiena;
    }

    public boolean isDienuSkaiciusMetuose() {
        return dienuSkaiciusMetuose;
    }

    public void setDienuSkaiciusMetuose(boolean dienuSkaiciusMetuose) {
        this.dienuSkaiciusMetuose = dienuSkaiciusMetuose;
    }

    public boolean isPaskolosGrazinimoTerminas() {
        return paskolosGrazinimoTerminas;
    }

    public void setPaskolosGrazinimoTerminas(boolean paskolosGrazinimoTerminas) {
        this.paskolosGrazinimoTerminas = paskolosGrazinimoTerminas;
    }

    public boolean isPaskolosSuma() {
        return paskolosSuma;
    }

    public void setPaskolosSuma(boolean paskolosSuma) {
        this.paskolosSuma = paskolosSuma;
    }

    public boolean isPaskolosLikutis() {
        return paskolosLikutis;
    }

    public void setPaskolosLikutis(boolean paskolosLikutis) {
        this.paskolosLikutis = paskolosLikutis;
    }

    public boolean isPalukanuSuma() {
        return palukanuSuma;
    }

    public void setPalukanuSuma(boolean palukanuSuma) {
        this.palukanuSuma = palukanuSuma;
    }

    public boolean isPalukanuLikutis() {
        return palukanuLikutis;
    }

    public void setPalukanuLikutis(boolean palukanuLikutis) {
        this.palukanuLikutis = palukanuLikutis;
    }

    public boolean isAtidetuPalukanuSuma() {
        return atidetuPalukanuSuma;
    }

    public void setAtidetuPalukanuSuma(boolean atidetuPalukanuSuma) {
        this.atidetuPalukanuSuma = atidetuPalukanuSuma;
    }

    public boolean isAtidetuPalukanuLikutis() {
        return atidetuPalukanuLikutis;
    }

    public void setAtidetuPalukanuLikutis(boolean atidetuPalukanuLikutis) {
        this.atidetuPalukanuLikutis = atidetuPalukanuLikutis;
    }
}
