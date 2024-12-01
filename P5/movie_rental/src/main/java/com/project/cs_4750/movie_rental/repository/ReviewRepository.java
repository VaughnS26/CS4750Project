package com.project.cs_4750.movie_rental.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.cs_4750.movie_rental.model.Review;

public interface ReviewRepository extends JpaRepository<Review, Long>{

}
