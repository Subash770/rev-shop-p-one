package com.revshop.main.revshop_main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.revshop.main.revshop_main.repository.UserRepository;
import com.revshop.main.revshop_main.model.User;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Transactional // Ensure this method runs in a transactional context
    public void registerUser(User user) {
        // Check for duplicate email
        if (userRepository.findByEmail(user.getEmail()) != null) {
            throw new RuntimeException("Email already registered."); // Handle this appropriately
        }
        // Save the user (admin, seller, or buyer)
        userRepository.save(user);
    }

    public User login(String email, String password) {
        // TODO: Implement login logic based on userType if necessary
        return null;
    }
}
