package com.renovacija.repository;


import com.renovacija.model.PalukanuGrazinimoGrafikas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface PalukanuGrazinimoGrafikasRep extends JpaRepository<PalukanuGrazinimoGrafikas, Integer> {
}
