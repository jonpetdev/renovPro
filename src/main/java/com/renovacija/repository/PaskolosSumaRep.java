package com.renovacija.repository;

import com.renovacija.model.PaskolosSuma;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaskolosSumaRep extends JpaRepository<PaskolosSuma, Integer> {
}
