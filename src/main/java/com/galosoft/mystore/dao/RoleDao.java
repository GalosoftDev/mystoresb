package com.galosoft.mystore.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.galosoft.mystore.model.Role;

public interface RoleDao extends JpaRepository<Role, Long> {

}
