package com.project.cs_4750.movie_rental.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.project.cs_4750.movie_rental.model.AppUser;


public interface AppUserRepository extends JpaRepository<AppUser, Long> {
}