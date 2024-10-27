package com.revature.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.revature.model.UserDtls;
import com.revature.model.Wishlist;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface WishlistRepository extends JpaRepository<Wishlist, Long> {
    List<Wishlist> findByUser(UserDtls user);

    // Changed Long to Integer for productId
    Wishlist findByUserAndProductId(UserDtls user, Integer productId);

    @Modifying
    @Query("DELETE FROM Wishlist w WHERE w.product.id = :productId")
    void deleteByProductId(@Param("productId") Integer productId);

}
