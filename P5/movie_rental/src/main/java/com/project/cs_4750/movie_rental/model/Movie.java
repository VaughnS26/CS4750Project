package com.project.cs_4750.movie_rental.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Movie")
public class Movie {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long movieID;

    @Column(name = "title")
    private String title;

    @Column(name = "runtime")
    private int runtime;

    @Column(name = "productionID")
    private int productionID;

    @Column(name = "originalLanguage")
    private String originalLanguage;

    @Column(name = "day")
    private String day;

    @Column(name = "month")
    private String month;

    @Column(name = "year")
    private String year;

    public Movie() {}

    public Movie(String title, int runtime, int productionID, String originalLanguage, String day, String month, String year) {
        this.title = title;
        this.runtime = runtime;
        this.productionID = productionID;
        this.originalLanguage = originalLanguage;
        this.day = day;
        this.month = month;
        this.year = year;
    }

    // Getters and Setters
    public long getMovieID() {
        return movieID;
    }

    public void setMovieID(long movieID) {
        this.movieID = movieID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getRuntime() {
        return runtime;
    }

    public void setRuntime(int runtime) {
        this.runtime = runtime;
    }

    public int getProductionID() {
        return productionID;
    }

    public void setProductionID(int productionID) {
        this.productionID = productionID;
    }

    public String getOriginalLanguage() {
        return originalLanguage;
    }

    public void setOriginalLanguage(String originalLanguage) {
        this.originalLanguage = originalLanguage;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }
}
