package com.project.cs_4750.movie_rental.utils;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class EncryptionService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public byte[] encryptPassword(String password) {
        //Used ChatGPT to figure out how to use CallableStatements for autoencryption
        String encryptQuery =
            "OPEN SYMMETRIC KEY AppUserPasswordKey DECRYPTION BY CERTIFICATE AppUserCert;" +
            "DECLARE @EncryptedPassword VARBINARY(128);" +
            "SET @EncryptedPassword = EncryptByKey(Key_GUID('AppUserPasswordKey'), ?);" +
            "CLOSE SYMMETRIC KEY AppUserPasswordKey;" +
            "SELECT @EncryptedPassword AS EncryptedPassword;";

        return jdbcTemplate.execute((Connection connection) -> {
            try (CallableStatement callableStatement = connection.prepareCall(encryptQuery)) {
                callableStatement.setString(1, password);
                
                ResultSet rs = callableStatement.executeQuery();
                if (rs.next()) {
                    return rs.getBytes("EncryptedPassword");
                }
                return null;
            } catch (SQLException e) {
                return null;
            }
        });
    }
}
