package com.revshop.main.revshop_main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;
import com.revshop.main.revshop_main.service.UserService;
import com.revshop.main.revshop_main.service.EmailService;
import com.revshop.main.revshop_main.model.User;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private EmailService emailService;

    // Store OTPs for each email
    private Map<String, String> otpStorage = new HashMap<>();

    // Show registration form based on user type (admin, seller, buyer)
    @GetMapping("/registers")
    public String showRegistrationForm(@ModelAttribute("userType") String userType, Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("userType", userType);  // Add userType to model
        return "register";  // Returns the registration form view
    }

    // Generate and send OTP for email verification
    @PostMapping("/send-otp")
    public ResponseEntity<Map<String, Object>> sendOtp(@RequestBody Map<String, String> requestBody) {
        String email = requestBody.get("email");
        System.out.println("Sending OTP to: " + email); // Logging email
        try {
            // Generate a 6-digit OTP
            String otp = String.format("%06d", new Random().nextInt(1000000)); // Ensure OTP is 6 digits
            otpStorage.put(email, otp); // Store the OTP associated with the email
            
            // Log the OTP and email for verification
            System.out.println("Generated OTP: " + otp + " for Email: " + email);

            // Send OTP to user's email
            emailService.sendOtpEmail(email, otp); 

            // Return a structured JSON response
            return ResponseEntity.ok(Map.of("success", true, "message", "OTP sent successfully to " + email));
        } catch (Exception e) {
            System.err.println("Error sending OTP email: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
            // Return a structured error response
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body(Map.of("success", false, "message", "Failed to send OTP. Please try again."));
        }
    }



    // Verify the OTP
    @PostMapping("/verify-otp")
    public ResponseEntity<Map<String, Object>> verifyOtp(@RequestParam("email") String email, 
                                                          @RequestParam("otp") String otp) {
        // Retrieve stored OTP from the storage
        String storedOtp = otpStorage.get(email);
        System.out.println("Verifying OTP for email: " + email); // Log email being verified
        System.out.println("Stored OTP: " + storedOtp + ", Input OTP: " + otp); // Log stored and input OTP for debugging

        Map<String, Object> response = new HashMap<>();

        // Check if the OTP is correct
        if (storedOtp != null && storedOtp.equals(otp)) {
            // OTP is correct
            response.put("success", true);
            otpStorage.remove(email); // Remove OTP after verification
            System.out.println("OTP verification successful for email: " + email); // Log success
        } else {
            // OTP is incorrect
            response.put("success", false);
            System.out.println("OTP verification failed for email: " + email); // Log failure
        }

        // Return the response as JSON
        return ResponseEntity.ok(response);
    }


    // POST mapping to handle user registration (admin, seller, or buyer) after OTP verification
    @PostMapping("/registers")
    public String registerUser(@ModelAttribute User user, @RequestParam("email") String email, 
                               RedirectAttributes redirectAttributes) {
        if (otpStorage.containsKey(email)) {
            try {
                // Call the service method to register the user
                userService.registerUser(user);

                // Send registration confirmation email
                emailService.sendRegistrationEmail(user.getEmail(), user.getFirstName(), user.getUserType());

                // Add a flash attribute for the success message
                redirectAttributes.addFlashAttribute("successMessage", "Registration successful! A confirmation email has been sent to your registered email address.");

                // Clear OTP from storage after successful registration
                otpStorage.remove(email);

                return "redirect:/success";  // Redirect to the success page
            } catch (RuntimeException e) {
                // Handle error (e.g., duplicate email)
                redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
                return "redirect:/registers";  // Return to the registration form with error message
            }
        } else {
            // OTP is not verified
            redirectAttributes.addFlashAttribute("errorMessage", "Please verify your email before registering.");
            return "redirect:/registers";
        }
    }

    // Success page
    @GetMapping("/success")
    public String showSuccessPage() {
        return "success";  // Returns the success view
    }

    // Login page mapping
    @GetMapping("/login")
    public String showLoginPage() {
        return "login";  // Maps to the login.jsp view
    }
}
