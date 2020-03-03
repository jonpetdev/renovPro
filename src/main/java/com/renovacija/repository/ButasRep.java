package com.renovacija.repository;

import com.renovacija.model.Butas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ButasRep extends JpaRepository<Butas, Integer> {

    public List<Butas> findAllByNamas_IdOrderByButoNrAsc(Integer id);

    public List<Butas> findAllByNamas_Id(Integer namo_id);
}