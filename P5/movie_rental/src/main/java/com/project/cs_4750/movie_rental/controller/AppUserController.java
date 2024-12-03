package com.project.cs_4750.movie_rental.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.cs_4750.movie_rental.model.AppUser;
import com.project.cs_4750.movie_rental.repository.AppUserRepository;
import com.project.cs_4750.movie_rental.utils.AppUserService;

@RestController
@RequestMapping("/users")
public class AppUserController {
    
    @Autowired
    private AppUserRepository appUserRepository;

    @Autowired
    private AppUserService appUserService;

    @GetMapping
    public List<AppUser> getAllAppUsers(){
        return appUserRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<AppUser> getAppUserById(@PathVariable long id) {
        return appUserRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<String> createUser(@RequestBody AppUser userRequest) {
        appUserService.createAppUser(userRequest.getUsername(), userRequest.getPassword(), userRequest.getIsActiveAccount());
        return ResponseEntity.ok("User created successfully!");
    }

    @PutMapping("/{id}")
    public ResponseEntity<AppUser> updateActor(@PathVariable long id, @RequestBody AppUser appUserDetails) {
        return appUserRepository.findById(id)
                .map(appUser -> {
                    appUser.setUsername(appUserDetails.getUsername());
                    appUser.setPassword(appUserDetails.getPassword());
                    appUser.setIsActiveAccount(appUserDetails.getIsActiveAccount());
                    appUser.setEncryptedPassword(appUserDetails.getEncryptedPassword());
                    appUserRepository.save(appUser);
                    return ResponseEntity.ok(appUser);
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteAppUser(@PathVariable long id) {
        return appUserRepository.findById(id)
                .map(appUser -> {
                    appUserRepository.delete(appUser);
                    return ResponseEntity.status(204).<Void>build(); 
                })
                .orElse(ResponseEntity.notFound().build());
    }
}

