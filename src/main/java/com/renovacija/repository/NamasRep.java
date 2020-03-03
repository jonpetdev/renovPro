package com.renovacija.repository;


import com.renovacija.model.Namas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface NamasRep extends JpaRepository<Namas, Integer> {

}
