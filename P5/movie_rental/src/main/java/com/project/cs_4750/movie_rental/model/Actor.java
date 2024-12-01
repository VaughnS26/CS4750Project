package com.project.cs_4750.movie_rental.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Actor")
public class Actor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long actorID;

    @Column(name = "name")
    private String name;

    @Column(name = "age")
    private int age;

    public Actor() {}

    public Actor(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public long getActorID() {
        return actorID;
    }

    public void setActorID(long actorID) {
        this.actorID = actorID;
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
