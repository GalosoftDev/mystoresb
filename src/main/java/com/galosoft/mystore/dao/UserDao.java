package com.galosoft.mystore.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.galosoft.mystore.model.User;

public interface UserDao extends JpaRepository<User, Long> {

	User findByEmail(String email);

}
