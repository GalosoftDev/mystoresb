package com.galosoft.mystore.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class AdditionalResourceWebConfiguration implements WebMvcConfigurer {

  @Override
  public void addResourceHandlers(final ResourceHandlerRegistry registry) {
	  
    registry.addResourceHandler("/imgs/**").
    addResourceLocations("file:////home/alexander/Downloads/javaEE/springBoot/springBootTasks/MyStore/src/main/webapp/imgs/");
                                  
  }
}