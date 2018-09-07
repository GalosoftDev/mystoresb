package com.galosoft.mystore.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.galosoft.mystore.model.Product;

public interface ProductDao extends JpaRepository<Product, Long>{
	

}
