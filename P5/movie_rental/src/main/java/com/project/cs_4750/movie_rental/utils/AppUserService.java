package com.project.cs_4750.movie_rental.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cs_4750.movie_rental.model.AppUser;
import com.project.cs_4750.movie_rental.repository.AppUserRepository;

@Service
public class AppUserService {

    @Autowired
    private AppUserRepository appUserRepository;

    @Autowired
    private EncryptionService encryptionService;

    public AppUser createAppUser(String username, String password, int isActiveAccount) {
        AppUser user = new AppUser();
        user.setUsername(username);
        user.setPassword(password);
        user.setIsActiveAccount(isActiveAccount);

        // Encrypt the password
        byte[] encryptedPassword = encryptionService.encryptPassword(password);
        user.setEncryptedPassword(encryptedPassword);

        return appUserRepository.save(user);
    }
}
