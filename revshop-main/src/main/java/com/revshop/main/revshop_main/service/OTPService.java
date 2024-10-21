package com.revshop.main.revshop_main.service;

import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class OTPService {

    // Store OTPs and their expiration times for each email
    private final Map<String, OtpData> otpStorage = new ConcurrentHashMap<>();

    // Expiry time for OTP (in minutes)
    private static final int EXPIRATION_TIME = 5;

    // Generate a 6-digit OTP and store it with expiration time
    public String generateOtp(String email) {
        String otp = String.valueOf(100000 + new Random().nextInt(900000)); // 6-digit OTP
        OtpData otpData = new OtpData(otp, LocalDateTime.now().plusMinutes(EXPIRATION_TIME));
        otpStorage.put(email, otpData);
        System.out.println("Generated OTP: " + otp + " for email: " + email);  // Add debug log
        return otp;
    }

    // Validate OTP
    public boolean validateOtp(String email, String otp) {
    	System.out.println("Verifying OTP for email: " + email);  // Add debug log
        OtpData otpData = otpStorage.get(email);

        if (otpData != null) {
        	System.out.println("Stored OTP: " + otpData.getOtp() + ", Input OTP: " + otp);  // Add debug log
            // Check if OTP matches and has not expired
            if (otpData.getOtp().equals(otp) && otpData.getExpiryTime().isAfter(LocalDateTime.now())) {
                otpStorage.remove(email);  // OTP is valid, remove it after successful validation
                return true;
            } else {
                otpStorage.remove(email);  // OTP is either wrong or expired, remove it
            }
            
        }
        else {
            System.out.println("No OTP stored for email: " + email);  // Add debug log
        }
        return false;
    }

    // Nested class to store OTP and its expiration time
    private static class OtpData {
        private final String otp;
        private final LocalDateTime expiryTime;

        public OtpData(String otp, LocalDateTime expiryTime) {
            this.otp = otp;
            this.expiryTime = expiryTime;
        }

        public String getOtp() {
            return otp;
        }

        public LocalDateTime getExpiryTime() {
            return expiryTime;
        }
    }
}
