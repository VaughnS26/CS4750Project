package com.project.cs_4750.movie_rental.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Review")
public class Review {

    @Column(name = "movieID")
    private long movieID;

    @Column(name = "userID")
    private long userID;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long reviewID;

    @Column(name = "rating")
    private long rating;

    @Column(name = "comment")
    private String comment;

    public Review() {
        
    }
    
    public Review(long movieID, long userID, long rating, String comment) {
        this.movieID = movieID;
        this.userID = userID;
        this.rating = rating;
        this.comment = comment;
    }

    public long getMovieID() {
        return movieID;
    }

    public void setMovieID(long movieID) {
        this.movieID = movieID;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public long getReviewID() {
        return reviewID;
    }

    public void setReviewID(long reviewID) {
        this.reviewID = reviewID;
    }

    public long getRating() {
        return rating;
    }

    public void setRating(long rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    

}
