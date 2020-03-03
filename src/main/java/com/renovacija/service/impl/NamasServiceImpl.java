package com.renovacija.service.impl;


import com.renovacija.model.Namas;
import com.renovacija.repository.NamasRep;
import com.renovacija.service.NamasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NamasServiceImpl implements NamasService {

    @Autowired
    private NamasRep namasRep;

    @Override
    public Iterable<Namas> findAll() {
        return namasRep.findAll();
    }
}
