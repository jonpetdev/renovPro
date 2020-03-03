package com.renovacija.repository;

import com.renovacija.model.GridSettings;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GridSettingsRep extends JpaRepository<GridSettings, Integer> {
}
