package com.renovacija.model;

public class NamasAdd {

    private Namas namas;
    private PalukanuGrazinimoGrafikas palukanuGrazinimoGrafikas;

    public NamasAdd(Namas namas, PalukanuGrazinimoGrafikas palukanuGrazinimoGrafikas) {
        this.namas = namas;
        this.palukanuGrazinimoGrafikas = palukanuGrazinimoGrafikas;
    }

    public NamasAdd(){}

    public Namas getNamas() {
        return namas;
    }

    public void setNamas(Namas namas) {
        this.namas = namas;
    }

    public PalukanuGrazinimoGrafikas getPalukanuGrazinimoGrafikas() {
        return palukanuGrazinimoGrafikas;
    }

    public void setPalukanuGrazinimoGrafikas(PalukanuGrazinimoGrafikas palukanuGrazinimoGrafikas) {
        this.palukanuGrazinimoGrafikas = palukanuGrazinimoGrafikas;
    }
}
