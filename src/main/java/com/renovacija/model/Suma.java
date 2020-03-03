package com.renovacija.model;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class Suma {

    private float kreditas;
    private float palukanos;
    private float atidetosPalukanos;


    public Suma(float kreditas) {
        this.kreditas = kreditas;
    }

    public Suma(){

    }

    public float getKreditas() {
        return kreditas;
    }

    public void setKreditas(float kreditas) {
        BigDecimal bd = new BigDecimal(kreditas).setScale(2, RoundingMode.FLOOR);
        this.kreditas = bd.floatValue();
    }

    public float getPalukanos() {
        return palukanos;
    }

    public void setPalukanos(float palukanos) {
        BigDecimal bd = new BigDecimal(palukanos).setScale(2, RoundingMode.FLOOR);
        this.palukanos = bd.floatValue();
    }

    public float getAtidetosPalukanos() {
        return atidetosPalukanos;
    }

    public void setAtidetosPalukanos(float atidetosPalukanos) {
        BigDecimal bd = new BigDecimal(atidetosPalukanos).setScale(2, RoundingMode.FLOOR);
        this.atidetosPalukanos = bd.floatValue();
    }
}
