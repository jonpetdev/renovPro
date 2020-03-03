package com.renovacija.service;

import com.renovacija.model.Butas;

import java.util.List;

public interface ButasService {

    public void butuListasSuPaskirstytaSuma(Integer namo_id, float sumaPaskirstymui, float sumaPalukanuPaskirstymui, float sumaaAtidetuPalukanuPaskirstymas);

    public Iterable<Butas> findAllByNamas_IdOrderByButoNrAsc(Integer id);
}
