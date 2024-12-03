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

        byte[] encryptedPassword = encryptionService.encryptPassword(password);
        user.setEncryptedPassword(encryptedPassword);

        return appUserRepository.save(user);
    }

    public boolean updateUser(Long userId, String newPassword, String username, int isActiveAccount) {
        AppUser appUser = appUserRepository.findById(userId).orElse(null);

        if (appUser != null) {
            if (newPassword != null){
                byte[] encryptedPassword = encryptionService.encryptPassword(newPassword);
                appUser.setEncryptedPassword(encryptedPassword);
                appUser.setPassword(newPassword);
            }
            
            if (username != null){
                appUser.setUsername(username);
            }
   
            appUser.setIsActiveAccount(isActiveAccount);
            
            appUserRepository.save(appUser);
            return true;
        }
        return false;
    }
}
