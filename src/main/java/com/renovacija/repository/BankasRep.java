package com.renovacija.repository;

import com.renovacija.model.Bankas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BankasRep extends JpaRepository<Bankas, Integer> {

}
