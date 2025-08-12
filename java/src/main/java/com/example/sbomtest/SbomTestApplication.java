package com.example.sbomtest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import org.apache.commons.lang3.StringUtils;
import lombok.Data;

import java.util.Arrays;
import java.util.List;

@SpringBootApplication
public class SbomTestApplication {

    public static void main(String[] args) {
        SpringApplication.run(SbomTestApplication.class, args);
    }
}

@RestController
class UserController {
    
    private final ObjectMapper objectMapper;
    
    public UserController(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }
    
    @GetMapping("/")
    public String home() {
        return "SBOM Test Java App is running!";
    }
    
    @GetMapping("/api/users")
    public List<User> getUsers() {
        return Arrays.asList(
            new User(1L, "Alice", "alice@example.com"),
            new User(2L, "Bob", "bob@example.com"),
            new User(3L, StringUtils.capitalize("charlie"), "charlie@example.com")
        );
    }
    
    @GetMapping("/api/status")
    public ObjectNode getStatus() {
        ObjectNode node = objectMapper.createObjectNode();
        node.put("status", "OK");
        node.put("timestamp", System.currentTimeMillis());
        node.put("message", "Spring Boot application is healthy");
        return node;
    }
}

@Data
class User {
    private final Long id;
    private final String name;
    private final String email;
}
