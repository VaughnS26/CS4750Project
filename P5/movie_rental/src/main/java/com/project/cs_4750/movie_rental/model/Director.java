package com.project.cs_4750.movie_rental.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Director")
public class Director {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long directorID;

    @Column(name = "name")
    private String name;

    @Column(name = "age")
    private int age;

    public Director() {}

    public Director(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public long getDirectorID() {
        return directorID;
    }

    public void setDirectorID(long directorID) {
        this.directorID = directorID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
