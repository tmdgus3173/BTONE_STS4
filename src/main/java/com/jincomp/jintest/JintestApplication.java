package com.jincomp.jintest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@SpringBootApplication
public class JintestApplication {

	public static void main(String[] args) {
		SpringApplication.run(JintestApplication.class, args);
	}

//	@Bean
//	public InternalResourceViewResolver setupViewResolver() {
//
//		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
//
//		resolver.setPrefix("/WEB-INF/jsp/");
//		resolver.setSuffix(".jsp");
//		return resolver;
//	}

}
