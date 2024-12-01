package com.project.cs_4750.movie_rental.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import com.project.cs_4750.movie_rental.repository.ReviewRepository;
import com.project.cs_4750.movie_rental.model.Review;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.ArrayList;
import java.util.Optional;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PostMapping;





@RestController
public class ReviewController {

    @Autowired
    ReviewRepository reviewRepository;

    @GetMapping("/reviews")
    public ResponseEntity<List<Review>> getAllReviews() {
        try {
            // System.out.println("Hello!");
            List<Review> reviews = new ArrayList<Review>();

            reviewRepository.findAll().forEach(reviews::add);

            if (reviews.isEmpty()) {
                System.out.println("We're empty!");
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(reviews, HttpStatus.OK);
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/reviews/{id}")
    public ResponseEntity<Review> getReviewById(@PathVariable("id") long id) {
        Optional<Review> reviewData = reviewRepository.findById(id);

        if (reviewData.isPresent()) {
            return new ResponseEntity<>(reviewData.get(), HttpStatus.OK);
        }
        else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    
    @DeleteMapping("/reviews/{id}")
    public ResponseEntity<HttpStatus> deleteReview(@PathVariable("id") long id) {
        try {
            reviewRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/reviews")
    public ResponseEntity<HttpStatus> deleteAllReviews() {
        try {
            reviewRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/reviews/{id}")
    public ResponseEntity<Review> updateReview(@PathVariable("id") long id, @RequestBody Review review) {
        Optional<Review> reviewData = reviewRepository.findById(id);

        if (reviewData.isPresent()) {
            Review _review = reviewData.get();
            _review.setMovieID(review.getMovieID());
            _review.setUserID(review.getUserID());
            _review.setRating(review.getRating());
            _review.setComment(review.getComment());
            return new ResponseEntity<>(reviewRepository.save(_review), HttpStatus.OK);
        }
        else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/reviews")
    public ResponseEntity<Review> createReview(@RequestBody Review review) {
        try {
            Review _review = reviewRepository.save(new Review(review.getMovieID(), review.getUserID(), review.getRating(), review.getComment()));
            return new ResponseEntity<>(_review, HttpStatus.CREATED);
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    
    

}
