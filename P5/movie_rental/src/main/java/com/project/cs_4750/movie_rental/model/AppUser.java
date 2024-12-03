package com.project.cs_4750.movie_rental.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "AppUser")
public class AppUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long userID;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "isActiveAccount")
    private int isActiveAccount;

    @Column(name = "encryptedPassword")
    private byte[] encryptedPassword;

    public AppUser() {}

    public AppUser(String username, String password, int isActiveAccount, byte[] encryptedPassword) {
        this.username = username;
        this.password = password;
        this.isActiveAccount = isActiveAccount;
        this.encryptedPassword = encryptedPassword;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID =userID;
    }

    public String getUsername(){
        return username;
    }

    public void setUsername(String username){
        this.username = username;
    }

    public String getPassword(){
        return password;
    }

    public void setPassword(String password){
        this.password = password;
    }

    public int getIsActiveAccount() {
        return isActiveAccount;
    }

    public void setIsActiveAccount(int isActiveAccount){
        this.isActiveAccount = isActiveAccount;
    }

    public byte[] getEncryptedPassword(){
        return encryptedPassword;
    }
    
    public void setEncryptedPassword(byte[] encryptedPassword){
        this.encryptedPassword = encryptedPassword;
    }
}
