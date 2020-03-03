package com.renovacija.service.impl;

import com.renovacija.model.Butas;

import com.renovacija.model.PaskolosSuma;
import com.renovacija.repository.ButasRep;
import com.renovacija.repository.NamasRep;
import com.renovacija.repository.PaskolosSumaRep;
import com.renovacija.service.ButasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import java.util.List;

@Service
public class ButasServiceImpl implements ButasService {

    @Autowired
    NamasRep namasRep;

    @Autowired
    ButasRep butasRep;

    @Autowired
    PaskolosSumaRep paskolosSumaRep;

    @Override
    public void butuListasSuPaskirstytaSuma(Integer namo_id, float sumaPaskirstymui, float sumaPalukanuPaskirstymui, float sumaAtidetuPalukanuPaskirstymas ) {
        List<Butas> butaiListas;
        float namoBendrasPlotas=0;
        float sumaButui;
        float sumaPalukanuButui;
        float sumaAtidetuPalukanuButui;
        butaiListas = butasRep.findAllByNamas_Id(namo_id);
        for (Butas b: butaiListas) {
            namoBendrasPlotas=namoBendrasPlotas+b.getBendrasPlotas();
        }
        for (Butas b:butaiListas){
            sumaButui = (sumaPaskirstymui*b.getBendrasPlotas())/namoBendrasPlotas;
            sumaPalukanuButui= (sumaPalukanuPaskirstymui*b.getBendrasPlotas())/namoBendrasPlotas;
            sumaAtidetuPalukanuButui= (sumaAtidetuPalukanuPaskirstymas*b.getBendrasPlotas())/namoBendrasPlotas;
            if(b.getPaskolosSuma() == null) {
                paskolosSumaRep.save(new PaskolosSuma(b, sumaButui, sumaButui,sumaPalukanuButui, sumaPalukanuButui, sumaAtidetuPalukanuButui,sumaAtidetuPalukanuButui));
            }else{
                b.getPaskolosSuma().setVisaMoketinaSuma(sumaButui);
                b.getPaskolosSuma().setPaskolosLikutis(sumaButui);
                b.getPaskolosSuma().setVisosPalukanos(sumaPalukanuButui);
                b.getPaskolosSuma().setPalukanuLikutis(sumaPalukanuButui);
                b.getPaskolosSuma().setVisosAtidetosPalukanos(sumaAtidetuPalukanuButui);
                b.getPaskolosSuma().setAtidetuPalukanuLikutis(sumaAtidetuPalukanuButui);
                paskolosSumaRep.save(b.getPaskolosSuma());
            }
        }
    }
}
