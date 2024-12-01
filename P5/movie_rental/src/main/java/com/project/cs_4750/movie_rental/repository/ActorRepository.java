package com.project.cs_4750.movie_rental.repository;

import com.project.cs_4750.movie_rental.model.Actor;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ActorRepository extends JpaRepository<Actor, Long> {
}
