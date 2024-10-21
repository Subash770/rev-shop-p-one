package com.revshop.main.revshop_main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.revshop.main.revshop_main.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    
    // Method to find a user by email
    User findByEmail(String email);
}
