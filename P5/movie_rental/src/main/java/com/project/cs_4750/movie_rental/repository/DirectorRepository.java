package com.project.cs_4750.movie_rental.repository;

import com.project.cs_4750.movie_rental.model.Director;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DirectorRepository extends JpaRepository<Director, Long> {
}
