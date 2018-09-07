package com.galosoft.mystore.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.galosoft.mystore.dao.ProductDao;
import com.galosoft.mystore.model.Product;

@Controller
public class HomeController {
	
	@Autowired
	private ProductDao productDao;
	
	private Path path;
	
	@RequestMapping("/")
	public String inicio() {
		return "myIndex";
	}
	
	@RequestMapping("/productList")
	public String getProducts(Model model) {
		List<Product> products = productDao.findAll();
		model.addAttribute("products", products);
		
		return "productList";
	}
	
	@RequestMapping("/productList/viewProduct/{id}")
	public String viewProduct(@PathVariable Long id, Model model){
		Product product = productDao.getOne(id);
		model.addAttribute(product);
		return "viewProduct";
	}
	
	@RequestMapping("/admin")
	public String adminPage() {
		return "admin";
	}
	
	@RequestMapping("/admin/productInventory")
	public String productInventory(Model model) {
		List<Product> products = productDao.findAll();
		model.addAttribute("products", products);
		
		return "productInventory";
	}
	
	@RequestMapping("/admin/productInventory/addProduct")
	public String addProduct() {
		return "addProduct";
	}
	
	@RequestMapping(value="/admin/productInventory/addProduct", method=RequestMethod.POST)
	public String addProductPost(@Valid @ModelAttribute("product") Product product,BindingResult errors, HttpServletRequest request,Model model) {
		
		if(errors.hasErrors()) {
			model.addAttribute("msgName", "Please fill field name");
			model.addAttribute("msgPrice", "Please fill field price");
			return "addProduct";
         }
		
		productDao.save(product);
		
		MultipartFile productImage = product.getImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		System.out.println(rootDirectory);
		path = Paths.get(rootDirectory + "//imgs//" + product.getId()+ ".png");
		
		
		System.out.println(path);
		
		if(productImage != null && !productImage.isEmpty()) {
			try {
				productImage.transferTo(new File(path.toString()));
			}catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("product saving failed...", e);
			}
		}
		
		return "redirect:/admin/productInventory";
      }
	
	@RequestMapping("/admin/productInventory/deleteProduct/{id}")
	public String deleteProduct(@PathVariable Long id, Model model, HttpServletRequest request) {
		
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		path = Paths.get(rootDirectory + "//imgs//" + id+ ".png");
		
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		productDao.deleteById(id);;
		return "redirect:/admin/productInventory";
     }
	
	@RequestMapping("/admin/productInventory/editProduct/{id}")
	public String editProduct(@PathVariable Long id, Model model) {
		Product product = productDao.getOne(id);
		model.addAttribute(product);
		return "editProduct";
	}
	
	@RequestMapping(value="/admin/productInventory/editProduct", method = RequestMethod.POST)
	public String editProduct(@Valid @ModelAttribute("product")Product product,BindingResult result, Model model, HttpServletRequest request) {
		
		if(result.hasErrors()) {
			return "editProduct";
		}
		
		MultipartFile productImage = product.getImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		path = Paths.get(rootDirectory + "//imgs//" + product.getId()+ ".png");
		
		if(productImage != null && !productImage.isEmpty()) {
			try {
				productImage.transferTo(new File(path.toString()));
			}catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("product saving failed...", e);
			}
		}
		
		productDao.save(product);
		
		return "redirect:/admin/productInventory";
		
}
	
}




















