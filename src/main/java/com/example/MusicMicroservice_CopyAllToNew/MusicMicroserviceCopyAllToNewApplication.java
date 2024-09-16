package com.example.MusicMicroservice_CopyAllToNew;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
@EntityScan(basePackages = "com.example.MusicMicroservice_CopyAllToNew.entites")
public class MusicMicroserviceCopyAllToNewApplication {

	public static void main(String[] args) {
		SpringApplication.run(MusicMicroserviceCopyAllToNewApplication.class, args);
	}

	@Bean
	@LoadBalanced
	public RestTemplate restTemplate() {
		return new RestTemplate();
	}
}
